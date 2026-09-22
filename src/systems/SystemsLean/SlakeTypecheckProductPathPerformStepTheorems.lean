/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathPerformStepTheorems.
  Short role: named driver for
  just slake-typecheck-productpathperformsteptheorems.
  Ready is HostFrontLiveProductPathPerformStepTheorems parse plus
  HostKernel.kernelCheck of live ProductPathPerformStepTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.ProductPathPerformStepTheorems.
  liveRel is ProductPathPerformStepTheorems.lean.
  This wrap is ProductPathPerformStepTheorems.lean.
  It is not ProductPathPerformStep.lean.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP-THEOREMS,
  SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_THEOREMS,
  slake-typecheck-productpathperformsteptheorems,
  slakeTypecheckProductPathPerformStepTheoremsReady,
  kernelCheckLiveProductPathPerformStepTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS.
  Module: SystemsLean.SlakeTypecheckProductPathPerformStepTheorems
  Checkable writer: just slake-typecheck-productpathperformsteptheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathPerformStepTheorems

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_STEP_THEOREMS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-STEP-THEOREMS"

/-- Named just recipe. Not lake build
    SystemsLean.ProductPathPerformStepTheorems. -/
def justRecipeSlakeTypecheckProductPathPerformStepTheorems : String :=
  "slake-typecheck-productpathperformsteptheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathPerformStepTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathPerformStepTheorems.liveProductPathPerformStepTheoremsRel

/-- Ready names HostFrontLiveProductPathPerformStepTheorems parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckProductPathPerformStepTheoremsReady,
    kernelCheckLiveProductPathPerformStepTheoremsSource. -/
def slakeTypecheckProductPathPerformStepTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathPerformStepTheorems.hostFrontLiveProductPathPerformStepTheoremsReady

/-- Honesty: this command is not lake build of
    ProductPathPerformStepTheorems. -/
def slakeTypecheckProductPathPerformStepTheoremsDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathPerformStepTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckProductPathPerformStepTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathPerformStepTheoremsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    ProductPathPerformStepTheorems.lean.
    Ready is HostFrontLiveProductPathPerformStepTheorems.hostFrontLiveProductPathPerformStepTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathPerformStepTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathPerformStepTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathPerformStepTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathPerformStepTheoremsRel}"
  unless (!slakeTypecheckProductPathPerformStepTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathPerformStepTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathPerformStepTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathPerformStepTheorems.main args
