/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathComposePlanTheorems.
  Short role: named driver for just slake-typecheck-productpathcomposeplantheorems.
  Ready is HostFrontLiveProductPathComposePlanTheorems parse plus HostKernel.kernelCheck
  of live ProductPathComposePlanTheorems.lean, not := true, not lake build
  SystemsLean.ProductPathComposePlanTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  SlakeTypecheckProductPathComposePlanTheorems
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
  SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0
  slake-typecheck-productpathcomposeplantheorems
  Greppable: SYSTEMS_LEAN_HOST,
  slakeTypecheckProductPathComposePlanTheoremsReady,
  kernelCheckLiveProductPathComposePlanTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS, liveRel, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathComposePlanTheorems
  Checkable writer: just slake-typecheck-productpathcomposeplantheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathComposePlanTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathComposePlanTheorems. -/
def justRecipeSlakeTypecheckProductPathComposePlanTheorems : String :=
  "slake-typecheck-productpathcomposeplantheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathComposePlanTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathComposePlanTheorems.liveProductPathComposePlanTheoremsRel

/-- Live basename. Greppable: liveRel. Must be ProductPathComposePlanTheorems.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveProductPathComposePlanTheorems.liveRel

/-- Ready names HostFrontLiveProductPathComposePlanTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathComposePlanTheoremsReady,
    kernelCheckLiveProductPathComposePlanTheoremsSource. -/
def slakeTypecheckProductPathComposePlanTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathComposePlanTheorems.hostFrontLiveProductPathComposePlanTheoremsReady

/-- Honesty: this command is not lake build of ProductPathComposePlanTheorems. -/
def slakeTypecheckProductPathComposePlanTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathComposePlanTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathComposePlanTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathComposePlanTheorems.lean.
    Ready is HostFrontLiveProductPathComposePlanTheorems.hostFrontLiveProductPathComposePlanTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathComposePlanTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathComposePlanTheorems} =="
  IO.println s!"  host={hostId} file={liveProductPathComposePlanTheoremsRel} liveRel={liveRel}"
  unless (!slakeTypecheckProductPathComposePlanTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathComposePlanTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathComposePlanTheorems.main args
