/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.DualEqWriteCapableGap.
  Short role: named driver for just slake-typecheck-dualeqwritecapablegap.
  Ready is HostFrontLiveDualEqWriteCapableGap parse plus HostKernel.kernelCheck
  of live DualEqWriteCapableGap.lean, not := true, not lake build
  SystemsLean.DualEqWriteCapableGap.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckDualEqWriteCapableGap is not a
  prefix of mill wrap SlakeTypecheckDualEqWriteCapableGapMain):
  SlakeTypecheckDualEqWriteCapableGap
  HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP
  SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_V0
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP
  slake-typecheck-dualeqwritecapablegap
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-dualeqwritecapablegap,
  slakeTypecheckDualEqWriteCapableGapReady,
  kernelCheckLiveDualEqWriteCapableGapSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckDualEqWriteCapableGap
  Checkable writer: just slake-typecheck-dualeqwritecapablegap
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveDualEqWriteCapableGap

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_DUAL_EQ_WRITE_CAPABLE_GAP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-DUAL-EQ-WRITE-CAPABLE-GAP"

/-- Named just recipe. Not lake build SystemsLean.DualEqWriteCapableGap. -/
def justRecipeSlakeTypecheckDualEqWriteCapableGap : String :=
  "slake-typecheck-dualeqwritecapablegap"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteCapableGapRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGap.liveDualEqWriteCapableGapRel

/-- Live basename. Greppable: liveRel. Must be DualEqWriteCapableGap.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGap.liveRel

/-- Ready names HostFrontLiveDualEqWriteCapableGap parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckDualEqWriteCapableGapReady,
    kernelCheckLiveDualEqWriteCapableGapSource. -/
def slakeTypecheckDualEqWriteCapableGapReady : Bool :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGap.hostFrontLiveDualEqWriteCapableGapReady

/-- Honesty: this command is not lake build of DualEqWriteCapableGap. -/
def slakeTypecheckDualEqWriteCapableGapDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckDualEqWriteCapableGapFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckDualEqWriteCapableGapOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live DualEqWriteCapableGap.lean.
    Ready is HostFrontLiveDualEqWriteCapableGap.hostFrontLiveDualEqWriteCapableGapReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveDualEqWriteCapableGap.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckDualEqWriteCapableGap} =="
  IO.println s!"  host={hostId} file={liveDualEqWriteCapableGapRel} liveRel={liveRel}"
  unless (!slakeTypecheckDualEqWriteCapableGapFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckDualEqWriteCapableGapOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveDualEqWriteCapableGap.main args
