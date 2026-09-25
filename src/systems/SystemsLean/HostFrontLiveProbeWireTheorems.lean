/-
  SYSTEMS_LEAN_HOST partial -- parse live ProbeWireTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProbeWireTheorems. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on ProbeWireTheorems text.
  Not HostFrontLiveProbeWire (that live parser is a different slice).
  Not ProbeWire.lean. liveRel is the bare basename ProbeWireTheorems.lean.

  Spec (readable):
  - parseLiveProbeWireTheoremsSource turns live ProbeWireTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.ProbeWireTheorems even without a module
    line. The living namespace is SystemsLean.ProbeWire.
  - kernelCheckLiveProbeWireTheoremsSource is HostKernel.kernelCheck of
    that parse. Not kernelCheckMultFixture. Not the constant true.
  - Product ids PROBE-WIRE-THEOREM and PROBE-WIRE-SMOKE stay on the
    live file as source needles. This parser does not change those claims.
  - Unique needles include their trailing newline so ProbeWire is not a
    prefix of ProbeWireTheorems and PROBE-WIRE-THEOREM is not a suffix
    of HOST-PROBE-WIRE-THEOREM.

  Theorems, examples, set_option, and open skip until the next command. Kept
  commands are import, namespace, and end. The live file imports
  DualResidual, ProductPath, InventoryClose, SelfApplyFs, LlvmHold, and
  ProbeWire, then namespace SystemsLean.ProbeWire and its end.
  Parse fuel is 2048, not 256.

  Disk path is repo root / "src/systems/SystemsLean" / liveRel.
  liveRel is the bare name ProbeWireTheorems.lean, not a repo-root path.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live ProbeWire.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70.
  - Host tools stay 69 of 69. Not Lake-gone.
  - Not freestanding residual free. Not PROVABLY.
  - Not package-typecheck ownership.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PROBEWIRETHEOREMS,
  SLAKE_HOST_FRONT_LIVE_PROBEWIRETHEOREMS_V0,
  PARSE-LIVE-PROBEWIRETHEOREMS, parseLiveProbeWireTheoremsSource,
  kernelCheckLiveProbeWireTheoremsSource,
  hostFrontLiveProbeWireTheoremsReady, liveProbeWireTheoremsSource,
  liveRel, liveProbeWireTheoremsRel, PROBE-WIRE-THEOREM,
  PROBE-WIRE-SMOKE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProbeWireTheorems
  Red/green: just slake-typecheck-probewiretheorems (lean --run; no mill;
  no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProbeWireTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProbeWireTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PROBEWIRETHEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PROBEWIRETHEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PROBEWIRETHEOREMS"

/-- Live file basename. Dual-pin name. Not a repo-root path. -/
def liveRel : String := "ProbeWireTheorems.lean"

/-- Same bare basename. Greppable: liveProbeWireTheoremsRel. -/
def liveProbeWireTheoremsRel : String := liveRel

/-- Directory under the repo root that holds the live file. -/
def liveDir : String := "src/systems/SystemsLean"

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProbeWireTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProbeWireTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProbeWireTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel. Not 256. -/
def liveProbeWireTheoremsParseFuel : Nat := 2048

/-- Kept commands: six imports, one namespace, one end. -/
def liveProbeWireTheoremsKeptCmds : Nat := 8

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end. Tokenize with Mult takeIdent so SystemsLean.ProbeWire
    stays one name. -/
def parseCmdsProbeWireTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveProbeWireTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsProbeWireTheorems n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsProbeWireTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsProbeWireTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProbeWireTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsProbeWireTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ProbeWireTheorems.lean text.
    Greppable: parseLiveProbeWireTheoremsSource,
    PARSE-LIVE-PROBEWIRETHEOREMS. -/
def parseLiveProbeWireTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProbeWireTheorems liveProbeWireTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProbeWireTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProbeWireTheorems parse. Not kernelCheckMultFixture.
    Not the constant true.
    Greppable: kernelCheckLiveProbeWireTheoremsSource,
    PARSE-LIVE-PROBEWIRETHEOREMS. -/
def kernelCheckLiveProbeWireTheoremsSource (src : String) : Bool :=
  match parseLiveProbeWireTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProbeWireTheoremsParsed? : Option Module :=
  match parseLiveProbeWireTheoremsSource liveProbeWireTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProbeWireTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Six imports plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveProbeWireTheoremsParsed? with
  | some m => m.commands.length == liveProbeWireTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end (theorems and open skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveProbeWireTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is ProbeWireTheorems (no module line in the live file). -/
def liveParseHasProbeWireTheoremsModule : Bool :=
  match liveProbeWireTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProbeWireTheorems"
      && lastSeg m.name.raw == "ProbeWireTheorems"

/-- True when the live parse kept an import whose last segment is `seg`. -/
def liveParseHasImport (seg : String) : Bool :=
  match liveProbeWireTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == seg
      | _ => false

/-- Live parse imports SystemsLean.DualResidual. -/
def liveParseHasDualResidualImport : Bool :=
  liveParseHasImport "DualResidual"

/-- Live parse imports SystemsLean.ProductPath. -/
def liveParseHasProductPathImport : Bool :=
  liveParseHasImport "ProductPath"

/-- Live parse imports SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseImport : Bool :=
  liveParseHasImport "InventoryClose"

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  liveParseHasImport "SelfApplyFs"

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  liveParseHasImport "LlvmHold"

/-- Live parse imports SystemsLean.ProbeWire.
    Last segment is ProbeWire, not ProbeWireTheorems. -/
def liveParseHasProbeWireImport : Bool :=
  liveParseHasImport "ProbeWire"

/-- Live parse has every import the product file actually contains. -/
def liveParseHasRequiredImports : Bool :=
  liveParseHasDualResidualImport
    && liveParseHasProductPathImport
    && liveParseHasInventoryCloseImport
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseHasProbeWireImport

/-- Live parse has the ProbeWire namespace command. -/
def liveParseHasProbeWireNamespace : Bool :=
  match liveProbeWireTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProbeWire"
      | _ => false

/-- Live parse ends the ProbeWire namespace. -/
def liveParseHasProbeWireEnd : Bool :=
  match liveProbeWireTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProbeWire"
      | _ => false

/-- Header line ending in PROBE-WIRE-THEOREM. Trailing newline.
    Not a suffix match of HOST-PROBE-WIRE-THEOREM. -/
def needleProbeWireTheoremLine : String :=
  "  SYSTEMS_LEAN_HOST partial -- ProbeWire PROBE-WIRE-THEOREM +\n"

/-- Header line PROBE-WIRE-SMOKE. Trailing newline.
    Two-space indent so HOST-PROBE-WIRE-SMOKE is not this needle. -/
def needleProbeWireSmokeLine : String := "  PROBE-WIRE-SMOKE.\n"

/-- Module line. Trailing newline so ProbeWire is not ProbeWireTheorems. -/
def needleModuleProbeWireTheorems : String :=
  "  Module: SystemsLean.ProbeWireTheorems\n"

/-- Import needle. Trailing newline. -/
def needleImportDualResidual : String := "import SystemsLean.DualResidual\n"

/-- Import needle. Trailing newline. -/
def needleImportProductPath : String := "import SystemsLean.ProductPath\n"

/-- Import needle. Trailing newline. -/
def needleImportInventoryClose : String := "import SystemsLean.InventoryClose\n"

/-- Import needle. Trailing newline. -/
def needleImportSelfApplyFs : String := "import SystemsLean.SelfApplyFs\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Import needle. Trailing newline.
    import SystemsLean.ProbeWire is not a prefix of ProbeWireTheorems. -/
def needleImportProbeWire : String := "import SystemsLean.ProbeWire\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ProbeWire\n"

/-- set_option needle with a trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 16384\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String :=
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_PROBE_WIRE_V0\" := rfl\n"

/-- theorem hostProbeWireId_eq needle with a trailing newline. -/
def needleHostIdEq : String :=
  "theorem hostProbeWireId_eq : hostProbeWireId = \"HOST-PROBE-WIRE\" := rfl\n"

/-- theorem productWireIsEmitPath_true needle with a trailing newline. -/
def needleProductWireIsEmitPath : String :=
  "theorem productWireIsEmitPath_true : productWireIsEmitPath = true := rfl\n"

/-- theorem residualFreeClaimed_false needle with a trailing newline. -/
def needleResidualFreeClaimed : String :=
  "theorem residualFreeClaimed_false : residualFreeClaimed = false := rfl\n"

/-- theorem probeWireReady_true needle with a trailing newline. -/
def needleProbeWireReady : String :=
  "theorem probeWireReady_true : probeWireReady = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProbeWire\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Every needle ends with a newline. -/
def liveNeedlesOk : Bool :=
  let src := liveProbeWireTheoremsSource
  (src.splitOn needleProbeWireTheoremLine).length > 1
    && (src.splitOn needleProbeWireSmokeLine).length > 1
    && (src.splitOn needleModuleProbeWireTheorems).length > 1
    && (src.splitOn needleImportDualResidual).length > 1
    && (src.splitOn needleImportProductPath).length > 1
    && (src.splitOn needleImportInventoryClose).length > 1
    && (src.splitOn needleImportSelfApplyFs).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleImportProbeWire).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSetOption).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleProductWireIsEmitPath).length > 1
    && (src.splitOn needleResidualFreeClaimed).length > 1
    && (src.splitOn needleProbeWireReady).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProbeWireTheoremsReady,
    PARSE-LIVE-PROBEWIRETHEOREMS,
    HOST-FRONT-LIVE-PROBEWIRETHEOREMS.
    Real conjunction: parse plus HostKernel.kernelCheck, plus honesty pins.
    Not hardcoded true. liveRel is the bare name. -/
def hostFrontLiveProbeWireTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PROBEWIRETHEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PROBEWIRETHEOREMS")
    && (parseId == "PARSE-LIVE-PROBEWIRETHEOREMS")
    && (liveRel == "ProbeWireTheorems.lean")
    && (liveProbeWireTheoremsRel == liveRel)
    && (liveDir == "src/systems/SystemsLean")
    && !hostFrontLiveProbeWireTheoremsFullHost
    && !hostFrontLiveProbeWireTheoremsResidualFreeClaimed
    && !hostFrontLiveProbeWireTheoremsProvablyUnlocked
    && kernelCheckLiveProbeWireTheoremsSource liveProbeWireTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasProbeWireTheoremsModule
    && liveParseHasRequiredImports
    && liveParseHasProbeWireNamespace
    && liveParseHasProbeWireEnd
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProbeWireTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProbeWireTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PROBEWIRETHEOREMS =="
  IO.println s!"  host={hostId} file={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProbeWireTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProbeWireTheorems.lean != liveProbeWireTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProbeWireTheorems.lean")
  let r := parseLiveProbeWireTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PROBEWIRETHEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PROBEWIRETHEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PROBEWIRETHEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProbeWireTheorems parse false"
      throw (IO.userError "kernelCheck live ProbeWireTheorems parse false")
    unless hostFrontLiveProbeWireTheoremsReady do
      IO.eprintln "error: hostFrontLiveProbeWireTheoremsReady false"
      throw (IO.userError "hostFrontLiveProbeWireTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source did not reject"
      throw (IO.userError "empty source did not reject")
    IO.println s!"GREEN {stageId}: live ProbeWireTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProbeWireTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProbeWireTheorems
