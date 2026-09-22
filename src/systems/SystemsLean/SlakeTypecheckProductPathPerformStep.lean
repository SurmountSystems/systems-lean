/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathPerformStep.
  Short role: named driver for just slake-typecheck-productpathperformstep.
  Ready is HostFrontLiveProductPathPerformStep parse plus HostKernel.kernelCheck
  of live ProductPathPerformStep.lean, not := true, not lake build
  SystemsLean.ProductPathPerformStep.
  liveRel is ProductPathPerformStep.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not ProductPathPerformStepTheorems.lean.
  Unique needles (own line, no THEOREMS suffix):
  SlakeTypecheckProductPathPerformStep
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP
  SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_V0
  slake-typecheck-productpathperformstep
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathPerformStepReady,
  kernelCheckLiveProductPathPerformStepSource,
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathPerformStep
  Checkable writer: just slake-typecheck-productpathperformstep
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathPerformStep

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP"

/-- Named just recipe. Not lake build SystemsLean.ProductPathPerformStep. -/
def justRecipeSlakeTypecheckProductPathPerformStep : String :=
  "slake-typecheck-productpathperformstep"

/-- Live file relative to repo root. Basename is ProductPathPerformStep.lean. -/
def liveProductPathPerformStepRel : String :=
  SystemsLean.HostFrontLiveProductPathPerformStep.liveProductPathPerformStepRel

/-- Ready names HostFrontLiveProductPathPerformStep parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathPerformStepReady,
    kernelCheckLiveProductPathPerformStepSource. -/
def slakeTypecheckProductPathPerformStepReady : Bool :=
  SystemsLean.HostFrontLiveProductPathPerformStep.hostFrontLiveProductPathPerformStepReady

/-- Honesty: this command is not lake build of ProductPathPerformStep.
    This pin is not the kernel check. -/
def slakeTypecheckProductPathPerformStepDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathPerformStepFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathPerformStepOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathPerformStep.lean.
    Ready is HostFrontLiveProductPathPerformStep.hostFrontLiveProductPathPerformStepReady
    (parse plus HostKernel.kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathPerformStep.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathPerformStep} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathPerformStep.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathPerformStepRel}"
  unless (!slakeTypecheckProductPathPerformStepFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathPerformStepOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathPerformStep.main args
