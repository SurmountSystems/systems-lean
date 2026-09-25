/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/UseCheck.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveUseCheck. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on UseCheck text.
  Not occupancy leftover. Not HostKernel / HostKernelTheorems / JoinMapTheorems wrap.

  Spec (readable):
  - parseLiveUseCheckSource turns live UseCheck.lean text into HostTerm.Module.
  - Module name is SystemsLean.UseCheck even without a module line.
  - kernelCheckLiveUseCheckSource is HostKernel.kernelCheck of that parse.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies, and abbrev leftovers (not isCmdKw). Keep kernelable namespace,
    end, structure, inductive, and kernelable defs.
  - Must parse structure ConsumeEvent, inductive Check, structure UseEvent.
  - toksHaveDefNamed still sees consumeTokenUseCheckReady when the body is skipped.
  - No import in UseCheck.lean; do not require liveParseHasHostTermImport.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-USECHECK,
  SLAKE_HOST_FRONT_LIVE_USECHECK_V0,
  PARSE-LIVE-USECHECK, parseLiveUseCheckSource, kernelCheckLiveUseCheckSource,
  hostFrontLiveUseCheckReady, liveUseCheckSource, liveUseCheckRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveUseCheck
  Red/green: just slake-typecheck-usecheck (if dests free); just systems-host dest rows
  when dests free; lake build SystemsLean.HostFrontLiveUseCheck on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveUseCheckSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveUseCheck

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_USECHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-USECHECK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-USECHECK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveUseCheckRel : String := "src/systems/SystemsLean/UseCheck.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "UseCheck.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveUseCheckFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveUseCheckResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveUseCheckProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveUseCheckParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveUseCheckSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . UseCheck`. -/
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
def cmdAddsUseCheck (c : Cmd) : List String :=
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

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownUseCheck (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveUseCheckParseFuel body
        && termNoAppN liveUseCheckParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveUseCheckParseFuel body
        && termNoAppN liveUseCheckParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Dotted import / namespace / end (HostKernel wrap). structure / inductive /
    def reuse parseOneCmdHt (HostFrontLiveHostTerm). Open and abbrev skip. -/
def parseOneCmdUseCheck (fuel : Nat) (toks : List String) :
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
def parseCmdsUseCheck : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdUseCheck liveUseCheckParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveUseCheckSkipFuel rest
      if cmdBodyKnownUseCheck kn c then
        parseCmdsUseCheck n rest2 (kn ++ cmdAddsUseCheck c) (acc ++ [c])
      else
        parseCmdsUseCheck n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveUseCheckSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsUseCheck n rest2 kn acc
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

/-- Parse live UseCheck.lean text.
    Greppable: parseLiveUseCheckSource, PARSE-LIVE-USECHECK. -/
def parseLiveUseCheckSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsUseCheck liveUseCheckParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.UseCheck", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live UseCheck parse.
    Greppable: kernelCheckLiveUseCheckSource, PARSE-LIVE-USECHECK. -/
def kernelCheckLiveUseCheckSource (src : String) : Bool :=
  match parseLiveUseCheckSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveUseCheckParsed? : Option Module :=
  match parseLiveUseCheckSource liveUseCheckSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveUseCheckParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / 2 structures / inductive / end).
    Real lower bound, not hardcoded true. Un-kernelable defs are skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveUseCheckParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse has the UseCheck namespace command (dotted lastSeg). -/
def liveParseHasUseCheckNs : Bool :=
  match liveUseCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "UseCheck"
      | _ => false

/-- Live parse kept structure ConsumeEvent. -/
def liveParseHasConsumeEvent : Bool :=
  match liveUseCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ x _ _ => x.raw == "ConsumeEvent"
      | _ => false

/-- Live parse kept inductive Check. -/
def liveParseHasCheckInductive : Bool :=
  match liveUseCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ x _ _ => x.raw == "Check"
      | _ => false

/-- Live parse kept structure UseEvent. -/
def liveParseHasUseEvent : Bool :=
  match liveUseCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ x _ _ => x.raw == "UseEvent"
      | _ => false

/-- Live parse has core UseCheck defs (def_ or defBind). Ready pins may be
    skip-folded; toksHaveDefNamed still sees the head. -/
def liveParseHasCoreDefs : Bool :=
  match liveUseCheckParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveUseCheckSource)
    (has "consumeTokenUseCheckReady"
      || toksHaveDefNamed liveUseCheckSkipFuel toks "consumeTokenUseCheckReady")
      && (has "unrestrictedShareUseCheckReady"
        || toksHaveDefNamed liveUseCheckSkipFuel toks "unrestrictedShareUseCheckReady")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveUseCheckReady, PARSE-LIVE-USECHECK,
    HOST-FRONT-LIVE-USECHECK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveUseCheckReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_USECHECK_V0")
    && (hostId == "HOST-FRONT-LIVE-USECHECK")
    && (parseId == "PARSE-LIVE-USECHECK")
    && (liveUseCheckRel == "src/systems/SystemsLean/UseCheck.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveUseCheckFullHost
    && !hostFrontLiveUseCheckResidualFreeClaimed
    && !hostFrontLiveUseCheckProvablyUnlocked
    && kernelCheckLiveUseCheckSource liveUseCheckSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasUseCheckNs
    && liveParseHasConsumeEvent
    && liveParseHasCheckInductive
    && liveParseHasUseEvent
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveUseCheckSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveUseCheck (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-USECHECK =="
  IO.println s!"  host={hostId} file={liveUseCheckRel}"
  let path := root / liveUseCheckRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveUseCheckRel}"
    throw (IO.userError s!"missing {liveUseCheckRel}")
  let disk <- IO.FS.readFile path
  if disk != liveUseCheckSource then
    IO.eprintln "error: dual-pin mismatch: on-disk UseCheck.lean != liveUseCheckSource"
    throw (IO.userError "dual-pin mismatch live UseCheck.lean")
  let r := parseLiveUseCheckSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-USECHECK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-USECHECK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-USECHECK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live UseCheck parse false"
      throw (IO.userError "kernelCheck live UseCheck parse false")
    unless hostFrontLiveUseCheckReady do
      IO.eprintln "error: hostFrontLiveUseCheckReady false"
      throw (IO.userError "hostFrontLiveUseCheckReady false")
    IO.println s!"GREEN {stageId}: live UseCheck.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveUseCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveUseCheck
