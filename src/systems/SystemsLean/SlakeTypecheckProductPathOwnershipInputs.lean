/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathOwnershipInputs.
  Short role: named driver for just slake-typecheck-productpathownershipinputs.
  Ready is HostFrontLiveProductPathOwnershipInputs parse plus HostKernel.kernelCheck
  of live ProductPathOwnershipInputs.lean, not := true, not lake build
  SystemsLean.ProductPathOwnershipInputs.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not ProductPathOwnershipInputsTheorems.lean.
  Unique needles (own line, no THEOREMS suffix):
  SlakeTypecheckProductPathOwnershipInputs
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS
  SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_V0
  slake-typecheck-productpathownershipinputs
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathOwnershipInputsReady,
  kernelCheckLiveProductPathOwnershipInputsSource,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathOwnershipInputs
  Checkable writer: just slake-typecheck-productpathownershipinputs
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathOwnershipInputs

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_OWNERSHIP_INPUTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-OWNERSHIP-INPUTS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathOwnershipInputs. -/
def justRecipeSlakeTypecheckProductPathOwnershipInputs : String :=
  "slake-typecheck-productpathownershipinputs"

/-- Live file relative to repo root. Basename is ProductPathOwnershipInputs.lean. -/
def liveProductPathOwnershipInputsRel : String :=
  SystemsLean.HostFrontLiveProductPathOwnershipInputs.liveProductPathOwnershipInputsRel

/-- Ready names HostFrontLiveProductPathOwnershipInputs parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathOwnershipInputsReady,
    kernelCheckLiveProductPathOwnershipInputsSource. -/
def slakeTypecheckProductPathOwnershipInputsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathOwnershipInputs.hostFrontLiveProductPathOwnershipInputsReady

/-- Honesty: this command is not lake build of ProductPathOwnershipInputs.
    This pin is not the kernel check. -/
def slakeTypecheckProductPathOwnershipInputsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathOwnershipInputsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathOwnershipInputsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathOwnershipInputs.lean.
    Ready is HostFrontLiveProductPathOwnershipInputs.hostFrontLiveProductPathOwnershipInputsReady
    (parse plus HostKernel.kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathOwnershipInputs.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathOwnershipInputs} =="
  IO.println s!"  host={hostId} file={liveProductPathOwnershipInputsRel}"
  IO.println s!"liveRel=ProductPathOwnershipInputs.lean"
  unless (!slakeTypecheckProductPathOwnershipInputsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathOwnershipInputsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathOwnershipInputs.main args
