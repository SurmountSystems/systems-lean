/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathTheorems.
  Short role: named driver for just slake-typecheck-productpaththeorems.
  Ready is HostFrontLiveProductPathTheorems parse plus HostKernel.kernelCheck
  of live ProductPathTheorems.lean, not := true, not lake build
  SystemsLean.ProductPathTheorems.
  file= prints the bare liveRel ProductPathTheorems.lean.
  Product ids PRODUCT-PATH-THEOREM and PRODUCT-PATH-SMOKE are not changed.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-THEOREMS,
  SLAKE_TYPECHECK_PRODUCT_PATH_THEOREMS_V0, slake-typecheck-productpaththeorems,
  slakeTypecheckProductPathTheoremsReady,
  kernelCheckLiveProductPathTheoremsSource,
  PARSE-LIVE-PRODUCTPATHTHEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathTheorems
  Checkable writer: just slake-typecheck-productpaththeorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathTheorems. -/
def justRecipeSlakeTypecheckProductPathTheorems : String :=
  "slake-typecheck-productpaththeorems"

/-- Live file basename. Dual-pin name. Bare ProductPathTheorems.lean. -/
def liveProductPathTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathTheorems.liveRel

/-- Ready names HostFrontLiveProductPathTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathTheoremsReady,
    kernelCheckLiveProductPathTheoremsSource. -/
def slakeTypecheckProductPathTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathTheorems.hostFrontLiveProductPathTheoremsReady

/-- Honesty: this command is not lake build of ProductPathTheorems. -/
def slakeTypecheckProductPathTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathTheorems.lean.
    Ready is HostFrontLiveProductPathTheorems.hostFrontLiveProductPathTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathTheorems} =="
  IO.println s!"  host={hostId} file={liveProductPathTheoremsRel}"
  unless (!slakeTypecheckProductPathTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (liveProductPathTheoremsRel == "ProductPathTheorems.lean") do
    IO.eprintln "error: liveRel must be the bare name ProductPathTheorems.lean"
    return 1
  SystemsLean.HostFrontLiveProductPathTheorems.main args
