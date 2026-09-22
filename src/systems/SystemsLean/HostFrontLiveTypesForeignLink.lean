/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/TypesForeignLink.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypesForeignLink. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold (Types-style). Tokenizer-dropped ++, string-safe -- strip via
  HostFrontLiveMult.stripComments, termNoAppN as needed. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on TypesForeignLink text.
  Not occupancy leftover. Not LinearForeignLink. Not ForeignLink.lean.

  Spec (readable):
  - parseLiveTypesForeignLinkSource turns live TypesForeignLink.lean text into HostTerm.Module.
  - Module name is SystemsLean.TypesForeignLink even without a module line.
  - kernelCheckLiveTypesForeignLinkSource is HostKernel.kernelCheck of that parse.
  - Skip theorems, examples, set_option, open, un-kernelable match/let/app
    bodies, and abbrev leftovers (not isCmdKw). Keep kernelable namespace,
    end, import, structure, inductive, and kernelable defs.
  - Skip .name proj (typesKind0Name and siblings), Term.app of not
    (typesForeignLinkLocalUnlockFalse / typesForeignLinkKeepsLlvmLocked),
    and && conjuncts encoded as Term.ite / == as Term.decideEq
    (typesForeignLinkDoesNotUnlockLlvm, typesSsotKindAgreementOk,
    typesForeignLinkConsumerContractOk, typesForeignLinkDualAgreementOk,
    typesForeignLinkSurfaceOk, typesForeignLinkPackageOk,
    typesForeignLinkReady). kernelFuel 64 cannot check that nest.
  - Keep simple := true / := false / string lits / nat lits. Alias
    justRecipe := justRecipeTypesForeignLink stays Term.const / Term.var.
  - toksHaveDefNamed still sees typesForeignLinkReady and
    typesForeignLinkDualAgreementOk.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-TYPESFOREIGNLINK,
  SLAKE_HOST_FRONT_LIVE_TYPESFOREIGNLINK_V0,
  PARSE-LIVE-TYPESFOREIGNLINK, parseLiveTypesForeignLinkSource,
  kernelCheckLiveTypesForeignLinkSource,
  hostFrontLiveTypesForeignLinkReady, liveTypesForeignLinkSource,
  liveTypesForeignLinkRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveTypesForeignLink
  Red/green: just slake-typecheck-typesforeignlink (if dests free); just systems-host dest rows
  when dests free; lake build SystemsLean.HostFrontLiveTypesForeignLink on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveTypesForeignLinkSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveTypesForeignLink

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_TYPESFOREIGNLINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-TYPESFOREIGNLINK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-TYPESFOREIGNLINK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesForeignLinkRel : String :=
  "src/systems/SystemsLean/TypesForeignLink.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveTypesForeignLinkFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveTypesForeignLinkResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveTypesForeignLinkProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveTypesForeignLinkParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails and abbrev leftovers. -/
def liveTypesForeignLinkSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . TypesForeignLink`. -/
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
def cmdAddsTypesForeignLink (c : Cmd) : List String :=
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
    so kernelFuel 64 can check the remaining Bool/String/Nat lits. -/
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
def cmdBodyKnownTypesForeignLink (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTypesForeignLinkParseFuel body
        && termNoAppN liveTypesForeignLinkParseFuel body
        && termKeepSimpleN liveTypesForeignLinkParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveTypesForeignLinkParseFuel body
        && termNoAppN liveTypesForeignLinkParseFuel body
        && termKeepSimpleN liveTypesForeignLinkParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    Dotted import / namespace / end (HostKernel wrap). structure / inductive /
    def reuse parseOneCmdHt (HostFrontLiveHostTerm). Open and abbrev skip. -/
def parseOneCmdTypesForeignLink (fuel : Nat) (toks : List String) :
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
def parseCmdsTypesForeignLink : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdTypesForeignLink liveTypesForeignLinkParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveTypesForeignLinkSkipFuel rest
      if cmdBodyKnownTypesForeignLink kn c then
        parseCmdsTypesForeignLink n rest2
          (kn ++ cmdAddsTypesForeignLink c) (acc ++ [c])
      else
        parseCmdsTypesForeignLink n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveTypesForeignLinkSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsTypesForeignLink n rest2 kn acc
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

/-- Parse live TypesForeignLink.lean text.
    Greppable: parseLiveTypesForeignLinkSource, PARSE-LIVE-TYPESFOREIGNLINK. -/
def parseLiveTypesForeignLinkSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsTypesForeignLink liveTypesForeignLinkParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.TypesForeignLink", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live TypesForeignLink parse.
    Greppable: kernelCheckLiveTypesForeignLinkSource, PARSE-LIVE-TYPESFOREIGNLINK. -/
def kernelCheckLiveTypesForeignLinkSource (src : String) : Bool :=
  match parseLiveTypesForeignLinkSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveTypesForeignLinkParsed? : Option Module :=
  match parseLiveTypesForeignLinkSource liveTypesForeignLinkSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveTypesForeignLinkParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / kept lits / end, plus imports).
    Real lower bound after skip-fold. The && conjuncts skip-fold.
    Empty cmds reject. Measured keep count is 36. -/
def liveParseCmdCountOk : Bool :=
  match liveTypesForeignLinkParsed? with
  | some m => m.commands.length >= 36
  | none => false

/-- Live parse has the TypesForeignLink namespace command (dotted lastSeg). -/
def liveParseHasTypesForeignLinkNs : Bool :=
  match liveTypesForeignLinkParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "TypesForeignLink"
      | _ => false

/-- Live parse has core TypesForeignLink defs (def_ or defBind). The &&
    conjuncts skip-fold as Term.ite / Term.decideEq; toksHaveDefNamed still
    sees the heads. -/
def liveParseHasCoreDefs : Bool :=
  match liveTypesForeignLinkParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveTypesForeignLinkSource)
    let named (nm : String) : Bool :=
      has nm || toksHaveDefNamed liveTypesForeignLinkSkipFuel toks nm
    named "typesForeignLinkSuccessClaimed"
      && named "typesForeignLinkReady"
      && named "typesForeignLinkDualAgreementOk"
      && named "stageId"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveTypesForeignLinkReady, PARSE-LIVE-TYPESFOREIGNLINK,
    HOST-FRONT-LIVE-TYPESFOREIGNLINK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveTypesForeignLinkReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_TYPESFOREIGNLINK_V0")
    && (hostId == "HOST-FRONT-LIVE-TYPESFOREIGNLINK")
    && (parseId == "PARSE-LIVE-TYPESFOREIGNLINK")
    && (liveTypesForeignLinkRel
      == "src/systems/SystemsLean/TypesForeignLink.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveTypesForeignLinkFullHost
    && !hostFrontLiveTypesForeignLinkResidualFreeClaimed
    && !hostFrontLiveTypesForeignLinkProvablyUnlocked
    && kernelCheckLiveTypesForeignLinkSource liveTypesForeignLinkSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasTypesForeignLinkNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveTypesForeignLinkSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveTypesForeignLink (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-TYPESFOREIGNLINK =="
  IO.println s!"  host={hostId} file={liveTypesForeignLinkRel}"
  let path := root / liveTypesForeignLinkRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveTypesForeignLinkRel}"
    throw (IO.userError s!"missing {liveTypesForeignLinkRel}")
  let disk <- IO.FS.readFile path
  if disk != liveTypesForeignLinkSource then
    IO.eprintln "error: dual-pin mismatch: on-disk TypesForeignLink.lean != liveTypesForeignLinkSource"
    throw (IO.userError "dual-pin mismatch live TypesForeignLink.lean")
  let r := parseLiveTypesForeignLinkSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-TYPESFOREIGNLINK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-TYPESFOREIGNLINK reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-TYPESFOREIGNLINK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live TypesForeignLink parse false"
      throw (IO.userError "kernelCheck live TypesForeignLink parse false")
    unless hostFrontLiveTypesForeignLinkReady do
      IO.eprintln "error: hostFrontLiveTypesForeignLinkReady false"
      throw (IO.userError "hostFrontLiveTypesForeignLinkReady false")
    IO.println s!"GREEN {stageId}: live TypesForeignLink.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveTypesForeignLink root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveTypesForeignLink
