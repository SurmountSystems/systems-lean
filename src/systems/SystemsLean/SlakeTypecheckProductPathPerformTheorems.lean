/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathPerformTheorems.
  Short role: named driver for just slake-typecheck-productpathperformtheorems.
  Ready is HostFrontLiveProductPathPerformTheorems parse plus HostKernel.kernelCheck
  of live ProductPathPerformTheorems.lean, not := true, not lake build
  SystemsLean.ProductPathPerformTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a
  shorter ProductPathPerform wrap is not a prefix hit):
  SlakeTypecheckProductPathPerformTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_THEOREMS_V0
  slake-typecheck-productpathperformtheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathPerformTheoremsReady,
  kernelCheckLiveProductPathPerformTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-PERFORM-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathPerformTheorems
  Checkable writer: just slake-typecheck-productpathperformtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathPerformTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_PERFORM_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-PERFORM-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathPerformTheorems. -/
def justRecipeSlakeTypecheckProductPathPerformTheorems : String :=
  "slake-typecheck-productpathperformtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathPerformTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathPerformTheorems.liveProductPathPerformTheoremsRel

/-- Ready names HostFrontLiveProductPathPerformTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathPerformTheoremsReady,
    kernelCheckLiveProductPathPerformTheoremsSource. -/
def slakeTypecheckProductPathPerformTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathPerformTheorems.hostFrontLiveProductPathPerformTheoremsReady

/-- Honesty: this command is not lake build of ProductPathPerformTheorems.
    This pin is not the kernel check. -/
def slakeTypecheckProductPathPerformTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathPerformTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathPerformTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathPerformTheorems.lean.
    Ready is HostFrontLiveProductPathPerformTheorems.hostFrontLiveProductPathPerformTheoremsReady
    (parse plus HostKernel.kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathPerformTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathPerformTheorems} =="
  IO.println s!"  host={hostId} file={liveProductPathPerformTheoremsRel}"
  unless (!slakeTypecheckProductPathPerformTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathPerformTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathPerformTheorems.main args
