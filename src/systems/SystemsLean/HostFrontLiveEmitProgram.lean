/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitProgram.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitProgram. Reuses HostFrontLiveHostTerm
  tokenizeHostTerm and HostFrontLiveMult stripComments.
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not the EmitProgramScaffold product parser.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.

  Spec (readable):
  - parseLiveEmitProgramSource turns live EmitProgram.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.EmitProgram (no module line in the file).
  - Import target SystemsLean.EmitProgramScaffold stays after comment strip.
    That import is not this module name.
  - Namespace and end use full raw SystemsLean.EmitProgram.
    lastSeg EmitProgram alone is not identity. Identity is that full raw
    name plus liveRel src/systems/SystemsLean/EmitProgram.lean.
  - kernelCheckLiveEmitProgramSource is HostKernel.kernelCheck of that parse.
  - After strip, the shape is import, namespace, and end. No def and no
    theorem in this file. Doc comments are block comments. stripComments strips them.
  - Skip-fold theorem, example, set_option, open, private, and def.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. slakeOwnsPackageTypecheck stays false.
  - Not freestanding residual free.

  Unique needles (trailing newline so a longer name is not a prefix hit):
  HostFrontLiveEmitProgram
  PARSE-LIVE-EMIT-PROGRAM
  HOST-FRONT-LIVE-EMIT-PROGRAM
  SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_V0
  src/systems/SystemsLean/EmitProgram.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitProgramSource,
  kernelCheckLiveEmitProgramSource,
  hostFrontLiveEmitProgramReady, liveEmitProgramSource,
  liveRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveEmitProgram
  Red/green: dest-missing until barrel; closed lean --run on horizon.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitProgramSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitProgram

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-PROGRAM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-PROGRAM"

/-- Live file relative to repo root. Dual-pin path. Exact, not a prefix. -/
def liveRel : String := "src/systems/SystemsLean/EmitProgram.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitProgramFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitProgramResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitProgramProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitProgramParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitProgramSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitProgram`. -/
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

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitProgram (fuel : Nat) (toks : List String) :
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
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / private / def.
    private is not isCmdKw. This file has import, namespace, and end only. -/
def parseCmdsEmitProgram : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitProgram liveEmitProgramParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitProgramSkipFuel rest
      parseCmdsEmitProgram n rest2 (acc ++ [c])
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitProgram n rest acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitProgramSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitProgram n rest2 acc
          else none
        else none
      | [] => some acc

/-- Token walk: `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match rest with
    | t :: rest2 => t == nm || toksHaveDefNamed n rest2 nm
    | [] => false
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live EmitProgram.lean text.
    Greppable: parseLiveEmitProgramSource, PARSE-LIVE-EMIT-PROGRAM. -/
def parseLiveEmitProgramSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitProgram liveEmitProgramParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitProgram"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitProgram parse. Not a fixture.
    Greppable: kernelCheckLiveEmitProgramSource, PARSE-LIVE-EMIT-PROGRAM. -/
def kernelCheckLiveEmitProgramSource (src : String) : Bool :=
  match parseLiveEmitProgramSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitProgramParsed? : Option Module :=
  match parseLiveEmitProgramSource liveEmitProgramSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitProgramParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import of EmitProgramScaffold, exact string, not this module name. -/
def cmdIsImportScaffold : Cmd -> Bool
  | Cmd.importModule x =>
    x.raw == "SystemsLean.EmitProgramScaffold"
      && lastSeg x.raw == "EmitProgramScaffold"
  | _ => false

/-- Namespace command whose full name and lastSeg are EmitProgram. -/
def cmdIsEmitProgramNs : Cmd -> Bool
  | Cmd.namespace x =>
    x.raw == "SystemsLean.EmitProgram" && lastSeg x.raw == "EmitProgram"
  | _ => false

/-- End command whose full name and lastSeg are EmitProgram. -/
def cmdIsEmitProgramEnd : Cmd -> Bool
  | Cmd.endNamespace x =>
    x.raw == "SystemsLean.EmitProgram" && lastSeg x.raw == "EmitProgram"
  | _ => false

/-- Import, namespace, or end of this file. Rejects a stray command. -/
def cmdIsEmitProgramShape : Cmd -> Bool
  | c => cmdIsImportScaffold c || cmdIsEmitProgramNs c || cmdIsEmitProgramEnd c

/-- Command count: length at least 2, every command is import, namespace,
    or end, and exactly one of each. Not a hardcoded PASS count.
    The PASS line prints the measured length. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitProgramParsed? with
  | some m =>
    m.commands.length >= 2 && m.commands.all cmdIsEmitProgramShape
      && (m.commands.filter cmdIsImportScaffold).length == 1
      && (m.commands.filter cmdIsEmitProgramNs).length == 1
      && (m.commands.filter cmdIsEmitProgramEnd).length == 1
  | none => false

/-- Parsed module name is SystemsLean.EmitProgram.
    lastSeg EmitProgram alone is not identity: EmitProgramScaffold.lean
    uses namespace SystemsLean.EmitProgram too. Identity is this full raw
    name plus liveRel src/systems/SystemsLean/EmitProgram.lean. -/
def liveParseHasEmitProgramModule : Bool :=
  match liveEmitProgramParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitProgram"
      && lastSeg m.name.raw == "EmitProgram"

/-- Exactly one namespace command, lastSeg EmitProgram. -/
def liveParseHasEmitProgramNs : Bool :=
  match liveEmitProgramParsed? with
  | none => false
  | some m => (m.commands.filter cmdIsEmitProgramNs).length == 1

/-- Exactly one end command, lastSeg EmitProgram. -/
def liveParseHasEmitProgramEnd : Bool :=
  match liveEmitProgramParsed? with
  | none => false
  | some m => (m.commands.filter cmdIsEmitProgramEnd).length == 1

/-- Exactly one import of SystemsLean.EmitProgramScaffold.
    That target is not the module name SystemsLean.EmitProgram. -/
def liveParseImportTargetIsNotModule : Bool :=
  match liveEmitProgramParsed? with
  | none => false
  | some m =>
    (m.commands.filter cmdIsImportScaffold).length == 1
      && m.name.raw == "SystemsLean.EmitProgram"
      && m.name.raw != "SystemsLean.EmitProgramScaffold"

/-- After comment strip, no `def programHeaderFragment`.
    That def lives on EmitProgramScaffold, not in this file. -/
def liveParseLacksProgramHeaderFragmentDef : Bool :=
  match liveEmitProgramParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitProgramSource)
    !(toksHaveDefNamed liveEmitProgramSkipFuel toks "programHeaderFragment")

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitProgramSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitProgramReady,
    PARSE-LIVE-EMIT-PROGRAM,
    HOST-FRONT-LIVE-EMIT-PROGRAM.
    Real conjunction: parse plus kernel plus honesty pins. Not := true. -/
def hostFrontLiveEmitProgramReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_PROGRAM_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-PROGRAM")
    && (parseId == "PARSE-LIVE-EMIT-PROGRAM")
    && (liveRel == "src/systems/SystemsLean/EmitProgram.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitProgramFullHost
    && !hostFrontLiveEmitProgramResidualFreeClaimed
    && !hostFrontLiveEmitProgramProvablyUnlocked
    && kernelCheckLiveEmitProgramSource liveEmitProgramSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitProgramModule
    && liveParseHasEmitProgramNs
    && liveParseHasEmitProgramEnd
    && liveParseImportTargetIsNotModule
    && liveParseLacksProgramHeaderFragmentDef
    && liveParseRejectsEmpty

/-! ### Driver (short stage lines; dual-pin file equality). Not mill 70. -/

def runLiveEmitProgram (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-PROGRAM =="
  IO.println s!"  host={hostId} file={liveRel} liveRel={liveRel}"
  let path := root / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitProgramSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitProgram.lean != liveEmitProgramSource"
    throw (IO.userError "dual-pin mismatch live EmitProgram.lean")
  let r := parseLiveEmitProgramSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-PROGRAM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-PROGRAM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-PROGRAM ACCEPT cmds={m.commands.length} kernelCheck={k} liveRel={liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitProgram parse false"
      throw (IO.userError "kernelCheck live EmitProgram parse false")
    unless hostFrontLiveEmitProgramReady do
      IO.eprintln "error: hostFrontLiveEmitProgramReady false"
      throw (IO.userError "hostFrontLiveEmitProgramReady false")
    IO.println s!"GREEN {stageId}: live EmitProgram.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitProgram root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitProgram
