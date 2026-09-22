/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathPerform.
  Short role: named driver for just slake-typecheck-productpathperform.
  Ready is HostFrontLiveProductPathPerform parse plus HostKernel.kernelCheck
  of live ProductPathPerform.lean, not := true, not lake build
  SystemsLean.ProductPathPerform.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not ProductPathPerformTheorems.lean.
  Unique needles (own line, no THEOREMS suffix):
  SlakeTypecheckProductPathPerform
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM
  SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_V0
  slake-typecheck-productpathperform
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathPerformReady,
  kernelCheckLiveProductPathPerformSource,
  PARSE-LIVE-PRODUCT-PATH-PERFORM, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathPerform
  Checkable writer: just slake-typecheck-productpathperform
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathPerform

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM"

/-- Named just recipe. Not lake build SystemsLean.ProductPathPerform. -/
def justRecipeSlakeTypecheckProductPathPerform : String :=
  "slake-typecheck-productpathperform"

/-- Live file relative to repo root. Basename is ProductPathPerform.lean. -/
def liveProductPathPerformRel : String :=
  SystemsLean.HostFrontLiveProductPathPerform.liveProductPathPerformRel

/-- Ready names HostFrontLiveProductPathPerform parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathPerformReady,
    kernelCheckLiveProductPathPerformSource. -/
def slakeTypecheckProductPathPerformReady : Bool :=
  SystemsLean.HostFrontLiveProductPathPerform.hostFrontLiveProductPathPerformReady

/-- Honesty: this command is not lake build of ProductPathPerform.
    This pin is not the kernel check. -/
def slakeTypecheckProductPathPerformDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathPerformFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathPerformOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathPerform.lean.
    Ready is HostFrontLiveProductPathPerform.hostFrontLiveProductPathPerformReady
    (parse plus HostKernel.kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathPerform.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathPerform} =="
  IO.println s!"  host={hostId} file={liveProductPathPerformRel}"
  IO.println s!"liveRel=ProductPathPerform.lean"
  unless (!slakeTypecheckProductPathPerformFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathPerformOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathPerform.main args
