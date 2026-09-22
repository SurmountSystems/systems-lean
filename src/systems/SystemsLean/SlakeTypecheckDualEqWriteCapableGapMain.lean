/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteCapableGapMain.
  Short role: named driver for just slake-typecheck-dualeqwritecapablegapmain.
  Ready is HostFrontLiveDualEqWriteCapableGapMain parse plus HostKernel.kernelCheck
  of live DualEqWriteCapableGapMain.lean, not := true, not lake build
  SystemsLean.DualEqWriteCapableGapMain.
  Not mill 16 remill (just sixteenth-host-tool / inventory row 20).
  Not occupancy name 50. Not FullHost.
  This wrap parses DualEqWriteCapableGapMain.lean only. Do not wrap DualEqWriteCapableGap.lean.
  Do not invent HostFrontLiveDualEqWriteCapableGap. Do not wrap DualEqWriteApiMain.
  Do not steal DualEqWriteParityMain. Do not steal DualEqWriteClosePathMain.
  Do not wrap Linear.lean. Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteCapableGapMain is not a prefix):
  SlakeTypecheckDualEqWriteCapableGapMain
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_MAIN_V0
  slake-typecheck-dualeqwritecapablegapmain
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  HOST-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwritecapablegapmain,
  slakeTypecheckDualEqWriteCapableGapMainReady,
  kernelCheckLiveDualEqWriteCapableGapMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteCapableGapMain
  Checkable writer: just slake-typecheck-dualeqwritecapablegapmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteCapableGapMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteCapableGapMain. -/
def justRecipeSlakeTypecheckDualEqWriteCapableGapMain : String :=
  "slake-typecheck-dualeqwritecapablegapmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteCapableGapMainRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGapMain.liveDualEqWriteCapableGapMainRel

/-- Ready names HostFrontLiveDualEqWriteCapableGapMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteCapableGapMainReady,
    kernelCheckLiveDualEqWriteCapableGapMainSource. -/
def slakeTypecheckDualEqWriteCapableGapMainReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGapMain.hostFrontLiveDualEqWriteCapableGapMainReady

/-- Honesty: this command is not lake build of DualEqWriteCapableGapMain. -/
def slakeTypecheckDualEqWriteCapableGapMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteCapableGapMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteCapableGapMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteCapableGapMain.lean.
    Ready is HostFrontLiveDualEqWriteCapableGapMain.hostFrontLiveDualEqWriteCapableGapMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteCapableGapMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteCapableGapMain} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteCapableGapMainRel}"
  unless (!slakeTypecheckDualEqWriteCapableGapMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteCapableGapMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteCapableGapMain.main args
