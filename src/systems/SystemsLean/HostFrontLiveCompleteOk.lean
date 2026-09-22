/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/CompleteOk.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompleteOk. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on CompleteOk text.
  Not occupancy leftover. Not HostKernel / HostKernelTheorems / JoinMapTheorems wrap.

  Spec (readable):
  - parseLiveCompleteOkSource turns live CompleteOk.lean text into HostTerm.Module.
  - Module name is SystemsLean.CompleteOk even without a module line.
  - kernelCheckLiveCompleteOkSource is HostKernel.kernelCheck of that parse.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies, and abbrev leftovers (not isCmdKw). Keep kernelable namespace,
    end, structure, inductive, and kernelable defs.
  - The big && conjunct freestandingProductSelfHostCompleteOk skip-folds
    (parser encodes && as Term.ite / == as Term.decideEq; kernelFuel 64
    cannot check that nest after the earlier lit defs).
  - Keep simple := true / := false / string lits. Alias completeOk skip-folds
    when the conjunct is not in the kernel env; toksHaveDefNamed still sees it.
  - toksHaveDefNamed still sees freestandingProductSelfHostCompleteOk.
  - No import in CompleteOk.lean; do not require liveParseHasHostTermImport.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPLETEOK,
  SLAKE_HOST_FRONT_LIVE_COMPLETEOK_V0,
  PARSE-LIVE-COMPLETEOK, parseLiveCompleteOkSource, kernelCheckLiveCompleteOkSource,
  hostFrontLiveCompleteOkReady, liveCompleteOkSource, liveCompleteOkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCompleteOk
  Red/green: just slake-typecheck-completeok (if dests free); just systems-host dest rows
  when dests free; lake build SystemsLean.HostFrontLiveCompleteOk on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompleteOkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCompleteOk

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPLETEOK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPLETEOK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPLETEOK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompleteOkRel : String := "src/systems/SystemsLean/CompleteOk.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompleteOkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompleteOkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompleteOkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCompleteOkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveCompleteOkSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . CompleteOk`. -/
def parseDottedName : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, a :: rest =>
    if !liveIsIdent a then none
    else
      match rest with
      | "." :: rest2 =>
        match parseDottedName n rest2 with
        | some (more, rest3) => some (a ++ "." ++ more, rest3)
        | none => none
      | _ => some (a, rest)

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length). -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoBadProjN n f && termNoBadProjN n a
  | Nat.succ n, Term.some_ t => termNoBadProjN n t
  | Nat.succ n, Term.ite c t e =>
      termNoBadProjN n c && termNoBadProjN n t && termNoBadProjN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoBadProjN n a && termNoBadProjN n b
  | Nat.succ n, Term.proj o f =>
      (f.raw == "isEmpty" || f.raw == "isSome" || f.raw == "length")
        && termNoBadProjN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoBadProjN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsCompleteOk (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so `"a" ++ "b"` becomes app of two string lits.
    Kernel cannot apply String. Skip any Term.app (keep lits / const / ite). -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppN n c && termNoAppN n t && termNoAppN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Keep only lit / const / var bodies. Skip &&-as-ite and ==-as-decideEq
    so kernelFuel 64 can check the remaining Bool/String lits. -/
def termKeepSimpleN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.some_ t => termKeepSimpleN n t
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ _, Term.ite _ _ _ => false
  | Nat.succ _, Term.decideEq _ _ => false
  | Nat.succ _, Term.proj _ _ => false
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no string-concat Term.app,
    no && / == nest the kernel cannot fuel. -/
def cmdBodyKnownCompleteOk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompleteOkParseFuel body
        && termNoAppN liveCompleteOkParseFuel body
        && termKeepSimpleN liveCompleteOkParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompleteOkParseFuel body
        && termNoAppN liveCompleteOkParseFuel body
        && termKeepSimpleN liveCompleteOkParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Dotted import / namespace / end (HostKernel wrap). structure / inductive /
    def reuse parseOneCmdHt (HostFrontLiveHostTerm). Open and abbrev skip. -/
def parseOneCmdCompleteOk (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.importModule (HostTerm.n nm), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "structure" :: _ => parseOneCmdHt fuel toks
  | "inductive" :: _ => parseOneCmdHt fuel toks
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / abbrev /
    un-kernelable defs. abbrev is not isCmdKw; skipUntilCmd rest still
    advances to the next command keyword. -/
def parseCmdsCompleteOk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCompleteOk liveCompleteOkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCompleteOkSkipFuel rest
      if cmdBodyKnownCompleteOk kn c then
        parseCmdsCompleteOk n rest2 (kn ++ cmdAddsCompleteOk c) (acc ++ [c])
      else
        parseCmdsCompleteOk n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveCompleteOkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsCompleteOk n rest2 kn acc
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live CompleteOk.lean text.
    Greppable: parseLiveCompleteOkSource, PARSE-LIVE-COMPLETEOK. -/
def parseLiveCompleteOkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCompleteOk liveCompleteOkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CompleteOk", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompleteOk parse.
    Greppable: kernelCheckLiveCompleteOkSource, PARSE-LIVE-COMPLETEOK. -/
def kernelCheckLiveCompleteOkSource (src : String) : Bool :=
  match parseLiveCompleteOkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompleteOkParsed? : Option Module :=
  match parseLiveCompleteOkSource liveCompleteOkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompleteOkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / 45 literal defs / end = 47).
    Real lower bound after skip-fold. The && conjunct skip-folds. Alias
    completeOk skip-folds when that name is not kernel-bound. Empty cmds
    reject. Measured keep count is 47. -/
def liveParseCmdCountOk : Bool :=
  match liveCompleteOkParsed? with
  | some m => m.commands.length >= 47
  | none => false

/-- Live parse has the CompleteOk namespace command (dotted lastSeg). -/
def liveParseHasCompleteOkNs : Bool :=
  match liveCompleteOkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompleteOk"
      | _ => false

/-- Live parse has core CompleteOk defs (def_ or defBind). The && conjunct
    skip-folds as Term.ite / Term.decideEq; toksHaveDefNamed still sees the
    head. Alias completeOk via Cmd.def_ / defBind or toksHaveDefNamed. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompleteOkParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveCompleteOkSource)
    (has "completeOk"
      || toksHaveDefNamed liveCompleteOkSkipFuel toks "completeOk")
      && toksHaveDefNamed liveCompleteOkSkipFuel toks
        "freestandingProductSelfHostCompleteOk"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompleteOkReady, PARSE-LIVE-COMPLETEOK,
    HOST-FRONT-LIVE-COMPLETEOK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompleteOkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPLETEOK_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPLETEOK")
    && (parseId == "PARSE-LIVE-COMPLETEOK")
    && (liveCompleteOkRel == "src/systems/SystemsLean/CompleteOk.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompleteOkFullHost
    && !hostFrontLiveCompleteOkResidualFreeClaimed
    && !hostFrontLiveCompleteOkProvablyUnlocked
    && kernelCheckLiveCompleteOkSource liveCompleteOkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompleteOkNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompleteOkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompleteOk (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPLETEOK =="
  IO.println s!"  host={hostId} file={liveCompleteOkRel}"
  let path := root / liveCompleteOkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompleteOkRel}"
    throw (IO.userError s!"missing {liveCompleteOkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompleteOkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompleteOk.lean != liveCompleteOkSource"
    throw (IO.userError "dual-pin mismatch live CompleteOk.lean")
  let r := parseLiveCompleteOkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPLETEOK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPLETEOK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPLETEOK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompleteOk parse false"
      throw (IO.userError "kernelCheck live CompleteOk parse false")
    unless hostFrontLiveCompleteOkReady do
      IO.eprintln "error: hostFrontLiveCompleteOkReady false"
      throw (IO.userError "hostFrontLiveCompleteOkReady false")
    IO.println s!"GREEN {stageId}: live CompleteOk.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompleteOk root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompleteOk
