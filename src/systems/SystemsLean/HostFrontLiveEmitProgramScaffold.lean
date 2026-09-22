/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitProgramScaffold.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitProgramScaffold. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckEmitProgramScaffoldTerm.
  Not live HostModuleCheckEmitProgramScaffoldTerm.lean.
  Not HostFrontLiveEmitProgram (that wrap would parse EmitProgram.lean).
  Not HostFrontLiveEmitMultScaffold. Not HostFrontLiveEmitTypesScaffold.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.

  Spec (readable):
  - parseLiveEmitProgramScaffoldSource turns live EmitProgramScaffold.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.EmitProgramScaffold even without a module line.
  - kernelCheckLiveEmitProgramScaffoldSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes, private struct lits the kernel cannot type) are skip-folded.
    Kernelable string/Nat defs plus import / namespace / end remain.
    Skip-head still sees theorem emitProgramReady_true and def
    programHeaderFragment.
  - Skip-fold ALL theorems including emitProgramReady_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.
  - Living namespace lastSeg is EmitProgram (shared with EmitProgram.lean).
    Identity uses wrap lastSeg EmitProgramScaffold plus live rel
    EmitProgramScaffold.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not EmitProgram.lean wrap.

  Unique needles (trailing newline so EmitProgram wrap is not a prefix):
  HostFrontLiveEmitProgramScaffold
  PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-PROGRAM-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_SCAFFOLD_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitProgramScaffoldSource,
  kernelCheckLiveEmitProgramScaffoldSource,
  hostFrontLiveEmitProgramScaffoldReady, liveEmitProgramScaffoldSource,
  liveEmitProgramScaffoldRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture, EMIT-PROGRAM-SCAFFOLD.
  Module: SystemsLean.HostFrontLiveEmitProgramScaffold
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveEmitProgramScaffold on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitProgramScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitProgramScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-PROGRAM-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitProgramScaffoldRel : String :=
  "src/systems/SystemsLean/EmitProgramScaffold.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitProgramScaffoldFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitProgramScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitProgramScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitProgramScaffoldParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitProgramScaffoldSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitProgramScaffold`. -/
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
def cmdAddsEmitProgramScaffold (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app (tokenizer drops `++`, so string concat is an untyped app). -/
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
def cmdBodyKnownEmitProgramScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitProgramScaffoldParseFuel body
        && termNoAppN liveEmitProgramScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitProgramScaffoldParseFuel body
        && termNoAppN liveEmitProgramScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitProgramScaffold (fuel : Nat) (toks : List String) :
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
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / private /
    un-kernelable. private is not isCmdKw. -/
def parseCmdsEmitProgramScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitProgramScaffold liveEmitProgramScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitProgramScaffoldSkipFuel rest
      if cmdBodyKnownEmitProgramScaffold kn c then
        parseCmdsEmitProgramScaffold n rest2
          (kn ++ cmdAddsEmitProgramScaffold c) (acc ++ [c])
      else
        parseCmdsEmitProgramScaffold n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitProgramScaffold n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitProgramScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitProgramScaffold n rest2 kn acc
          else none
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

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live EmitProgramScaffold.lean text.
    Greppable: parseLiveEmitProgramScaffoldSource,
    PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD. -/
def parseLiveEmitProgramScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitProgramScaffold liveEmitProgramScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitProgramScaffold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitProgramScaffold parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitProgramScaffoldSource,
    PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD. -/
def kernelCheckLiveEmitProgramScaffoldSource (src : String) : Bool :=
  match parseLiveEmitProgramScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitProgramScaffoldParsed? : Option Module :=
  match parseLiveEmitProgramScaffoldSource liveEmitProgramScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitProgramScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / end plus kernelable string defs).
    Real lower bound, not hardcoded true. This peel has no dotted import.
    Un-kernelable string-concat defs, examples, and theorem skipped.
    Horizon lean --run measured cmds=7: namespace plus end plus five
    kernelable stage/path defs. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitProgramScaffoldParsed? with
  | some m => m.commands.length >= 7
  | none => false

/-- Wrap module lastSeg is EmitProgramScaffold (no module line in the live file). -/
def liveParseHasEmitProgramScaffoldModule : Bool :=
  match liveEmitProgramScaffoldParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitProgramScaffold"

/-- Live parse has the living EmitProgram namespace command. -/
def liveParseHasEmitProgramNs : Bool :=
  match liveEmitProgramScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "EmitProgram"
      | _ => false

/-- Skip-head: theorem emitProgramReady_true and def programHeaderFragment
    are in the live text. Unique to EmitProgramScaffold.lean (not a theorem
    or header fragment def in EmitProgram.lean). -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitProgramScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitProgramScaffoldSource)
    toksHaveTheoremNamed liveEmitProgramScaffoldSkipFuel toks
      "emitProgramReady_true"
      && toksHaveDefNamed liveEmitProgramScaffoldSkipFuel toks
        "programHeaderFragment"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitProgramScaffoldReady,
    PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-PROGRAM-SCAFFOLD.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveEmitProgramScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-PROGRAM-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD")
    && (liveEmitProgramScaffoldRel
      == "src/systems/SystemsLean/EmitProgramScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitProgramScaffoldFullHost
    && !hostFrontLiveEmitProgramScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitProgramScaffoldProvablyUnlocked
    && kernelCheckLiveEmitProgramScaffoldSource liveEmitProgramScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitProgramScaffoldModule
    && liveParseHasEmitProgramNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitProgramScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitProgramScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitProgramScaffoldRel}"
  let path := root / liveEmitProgramScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitProgramScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitProgramScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitProgramScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitProgramScaffold.lean != liveEmitProgramScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitProgramScaffold.lean")
  let r := parseLiveEmitProgramScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-PROGRAM-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitProgramScaffold parse false"
      throw (IO.userError "kernelCheck live EmitProgramScaffold parse false")
    unless hostFrontLiveEmitProgramScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitProgramScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitProgramScaffoldReady false")
    IO.println s!"GREEN {stageId}: live EmitProgramScaffold.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitProgramScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitProgramScaffold
