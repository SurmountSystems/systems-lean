/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathComposePlan.
  Short role: named driver for just slake-typecheck-productpathcomposeplan.
  Ready is HostFrontLiveProductPathComposePlan parse plus HostKernel.kernelCheck
  of live ProductPathComposePlan.lean, not := true, not lake build
  SystemsLean.ProductPathComposePlan.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckProductPathComposePlan is not a
  prefix of mill wrap SlakeTypecheckProductPathComposePlanMain):
  SlakeTypecheckProductPathComposePlan
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN
  SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_V0
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN
  slake-typecheck-productpathcomposeplan
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-productpathcomposeplan,
  slakeTypecheckProductPathComposePlanReady,
  kernelCheckLiveProductPathComposePlanSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathComposePlan
  Checkable writer: just slake-typecheck-productpathcomposeplan
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveProductPathComposePlan

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_COMPOSE_PLAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-COMPOSE-PLAN"

/-- Named just recipe. Not lake build SystemsLean.ProductPathComposePlan. -/
def justRecipeSlakeTypecheckProductPathComposePlan : String :=
  "slake-typecheck-productpathcomposeplan"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathComposePlanRel : String :=
  SystemsLean.HostFrontLiveProductPathComposePlan.liveProductPathComposePlanRel

/-- Live basename. Greppable: liveRel. Must be ProductPathComposePlan.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveProductPathComposePlan.liveRel

/-- Ready names HostFrontLiveProductPathComposePlan parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckProductPathComposePlanReady,
    kernelCheckLiveProductPathComposePlanSource. -/
def slakeTypecheckProductPathComposePlanReady : Bool :=
  SystemsLean.HostFrontLiveProductPathComposePlan.hostFrontLiveProductPathComposePlanReady

/-- Honesty: this command is not lake build of ProductPathComposePlan. -/
def slakeTypecheckProductPathComposePlanDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathComposePlanFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathComposePlanOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathComposePlan.lean.
    Ready is HostFrontLiveProductPathComposePlan.hostFrontLiveProductPathComposePlanReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathComposePlan.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathComposePlan} =="
  IO.println s!"  host={hostId} file={liveProductPathComposePlanRel} liveRel={liveRel}"
  unless (!slakeTypecheckProductPathComposePlanFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathComposePlanOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathComposePlan.main args
