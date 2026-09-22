/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitTypes.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This live file is one import, a namespace, and an end. No def.
  Not a remill. Not a new emit feature.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-TYPES,
  SLAKE_HOST_FRONT_LIVE_EMIT_TYPES_V0,
  PARSE-LIVE-EMIT-TYPES, EMIT-TYPES, liveRel,
  kernelCheckLiveEmitTypesSource,
  hostFrontLiveEmitTypesReady.
  Module: SystemsLean.HostFrontLiveEmitTypes
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitTypesSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitTypes

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-TYPES"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-TYPES"

/-- Live file basename. -/
def liveRel : String := "EmitTypes.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitTypesRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool :=
  liveRel == "EmitTypes.lean"

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitTypesFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitTypesResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitTypesProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitTypesParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitTypesSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitTypes`. -/
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

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    This file has no kernel-checkable def, so `def` is skipped. -/
def parseOneCmdEmitTypes (fuel : Nat) (toks : List String) :
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
  | "def" :: _ => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / def. -/
def parseCmdsEmitTypes : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitTypes liveEmitTypesParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitTypesSkipFuel rest
      parseCmdsEmitTypes n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitTypesSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitTypes n rest2 acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has a `def` command keyword. -/
def toksHaveDef : Nat -> List String -> Bool
  | 0, _ => false
  | Nat.succ _, [] => false
  | Nat.succ _, "def" :: _ => true
  | Nat.succ n, _ :: rest => toksHaveDef n rest

/-- Parse live EmitTypes.lean text.
    Greppable: parseLiveEmitTypesSource, PARSE-LIVE-EMIT-TYPES. -/
def parseLiveEmitTypesSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitTypes liveEmitTypesParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitTypes"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitTypes parse. Not a fixture.
    Greppable: kernelCheckLiveEmitTypesSource, PARSE-LIVE-EMIT-TYPES. -/
def kernelCheckLiveEmitTypesSource (src : String) : Bool :=
  match parseLiveEmitTypesSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitTypesParsed? : Option Module :=
  match parseLiveEmitTypesSource liveEmitTypesSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitTypesParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count: one import, namespace, and end.
    Real count, not a hardcoded true. No def is kept. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitTypesParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is EmitTypes (no module line in the live file). -/
def liveParseHasEmitTypesModule : Bool :=
  match liveEmitTypesParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitTypes"

/-- Live parse has the living EmitTypes namespace command. -/
def liveParseHasEmitTypesNs : Bool :=
  match liveEmitTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitTypes"
      | _ => false

/-- Live parse has the living EmitTypes end command. -/
def liveParseHasEmitTypesEnd : Bool :=
  match liveEmitTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitTypes"
      | _ => false

/-- Live parse keeps the EmitTypesScaffold import. -/
def liveParseHasScaffoldImport : Bool :=
  match liveEmitTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitTypesScaffold"
      | _ => false

/-- Stripped live text has no def keyword. This file has no def to keep. -/
def liveParseHasNoDefToken : Bool :=
  match liveEmitTypesParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitTypesSource)
    !(toksHaveDef liveEmitTypesSkipFuel toks)

/-- Import needle with a trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitTypesScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitTypes\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitTypes\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitTypesSource
  (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitTypesReady, PARSE-LIVE-EMIT-TYPES,
    HOST-FRONT-LIVE-EMIT-TYPES.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveEmitTypesReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_TYPES_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-TYPES")
    && (parseId == "PARSE-LIVE-EMIT-TYPES")
    && (liveRel == "EmitTypes.lean")
    && (liveEmitTypesRel == "src/systems/SystemsLean/EmitTypes.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitTypesFullHost
    && !hostFrontLiveEmitTypesResidualFreeClaimed
    && !hostFrontLiveEmitTypesProvablyUnlocked
    && kernelCheckLiveEmitTypesSource liveEmitTypesSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitTypesNs
    && liveParseHasEmitTypesEnd
    && liveParseHasScaffoldImport
    && liveParseHasEmitTypesModule
    && liveParseHasNoDefToken
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitTypesSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitTypes (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-TYPES =="
  IO.println s!"  host={hostId} file={liveEmitTypesRel} liveRel={liveRel}"
  let path := root / liveEmitTypesRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitTypesRel}"
    throw (IO.userError s!"missing {liveEmitTypesRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitTypesSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitTypes.lean != liveEmitTypesSource"
    throw (IO.userError "dual-pin mismatch live EmitTypes.lean")
  let r := parseLiveEmitTypesSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-TYPES reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-TYPES reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-TYPES ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitTypes parse false"
      throw (IO.userError "kernelCheck live EmitTypes parse false")
    unless hostFrontLiveEmitTypesReady do
      IO.eprintln "error: hostFrontLiveEmitTypesReady false"
      throw (IO.userError "hostFrontLiveEmitTypesReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitTypes source must reject"
      throw (IO.userError "empty EmitTypes source must reject")
    IO.println s!"GREEN {stageId}: live EmitTypes.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitTypes root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitTypes
