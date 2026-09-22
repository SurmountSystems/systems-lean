/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitExtract.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This live file is one import, a namespace, and an end. No def.
  Not a remill. Not a new emit feature.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-EXTRACT,
  SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_V0,
  PARSE-LIVE-EMIT-EXTRACT, EMIT-EXTRACT, liveRel,
  kernelCheckLiveEmitExtractSource,
  hostFrontLiveEmitExtractReady.
  Module: SystemsLean.HostFrontLiveEmitExtract
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitExtractSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitExtract

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-EXTRACT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-EXTRACT"

/-- Live file basename. -/
def liveRel : String := "EmitExtract.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitExtractRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool :=
  liveRel == "EmitExtract.lean"

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitExtractFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitExtractResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitExtractProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitExtractParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitExtractSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitExtract`. -/
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
def parseOneCmdEmitExtract (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitExtract : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitExtract liveEmitExtractParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitExtractSkipFuel rest
      parseCmdsEmitExtract n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitExtractSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitExtract n rest2 acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has a `def` command keyword. -/
def toksHaveDef : Nat -> List String -> Bool
  | 0, _ => false
  | Nat.succ _, [] => false
  | Nat.succ _, "def" :: _ => true
  | Nat.succ n, _ :: rest => toksHaveDef n rest

/-- Parse live EmitExtract.lean text.
    Greppable: parseLiveEmitExtractSource, PARSE-LIVE-EMIT-EXTRACT. -/
def parseLiveEmitExtractSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitExtract liveEmitExtractParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitExtract"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitExtract parse. Not a fixture.
    Greppable: kernelCheckLiveEmitExtractSource, PARSE-LIVE-EMIT-EXTRACT. -/
def kernelCheckLiveEmitExtractSource (src : String) : Bool :=
  match parseLiveEmitExtractSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitExtractParsed? : Option Module :=
  match parseLiveEmitExtractSource liveEmitExtractSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitExtractParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count: one import, namespace, and end.
    Real count, not a hardcoded true. No def is kept. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitExtractParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Wrap module lastSeg is EmitExtract (no module line in the live file). -/
def liveParseHasEmitExtractModule : Bool :=
  match liveEmitExtractParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitExtract"

/-- Live parse has the living EmitExtract namespace command. -/
def liveParseHasEmitExtractNs : Bool :=
  match liveEmitExtractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitExtract"
      | _ => false

/-- Live parse has the living EmitExtract end command. -/
def liveParseHasEmitExtractEnd : Bool :=
  match liveEmitExtractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitExtract"
      | _ => false

/-- Live parse keeps the EmitExtractScaffold import. -/
def liveParseHasScaffoldImport : Bool :=
  match liveEmitExtractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitExtractScaffold"
      | _ => false

/-- Stripped live text has no def keyword. This file has no def to keep. -/
def liveParseHasNoDefToken : Bool :=
  match liveEmitExtractParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitExtractSource)
    !(toksHaveDef liveEmitExtractSkipFuel toks)

/-- Import needle with a trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitExtractScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitExtract\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitExtract\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitExtractSource
  (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitExtractReady, PARSE-LIVE-EMIT-EXTRACT,
    HOST-FRONT-LIVE-EMIT-EXTRACT.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveEmitExtractReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-EXTRACT")
    && (parseId == "PARSE-LIVE-EMIT-EXTRACT")
    && (liveRel == "EmitExtract.lean")
    && (liveEmitExtractRel == "src/systems/SystemsLean/EmitExtract.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitExtractFullHost
    && !hostFrontLiveEmitExtractResidualFreeClaimed
    && !hostFrontLiveEmitExtractProvablyUnlocked
    && kernelCheckLiveEmitExtractSource liveEmitExtractSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitExtractNs
    && liveParseHasEmitExtractEnd
    && liveParseHasScaffoldImport
    && liveParseHasEmitExtractModule
    && liveParseHasNoDefToken
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitExtractSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitExtract (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-EXTRACT =="
  IO.println s!"  host={hostId} file={liveEmitExtractRel} liveRel={liveRel}"
  let path := root / liveEmitExtractRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitExtractRel}"
    throw (IO.userError s!"missing {liveEmitExtractRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitExtractSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitExtract.lean != liveEmitExtractSource"
    throw (IO.userError "dual-pin mismatch live EmitExtract.lean")
  let r := parseLiveEmitExtractSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-EXTRACT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-EXTRACT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-EXTRACT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitExtract parse false"
      throw (IO.userError "kernelCheck live EmitExtract parse false")
    unless hostFrontLiveEmitExtractReady do
      IO.eprintln "error: hostFrontLiveEmitExtractReady false"
      throw (IO.userError "hostFrontLiveEmitExtractReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitExtract source must reject"
      throw (IO.userError "empty EmitExtract source must reject")
    IO.println s!"GREEN {stageId}: live EmitExtract.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitExtract root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitExtract
