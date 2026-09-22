/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathWriterPathPlan.
  Short role: named driver for lean --run of live ProductPathWriterPathPlan.lean parse.
  Ready is HostFrontLiveProductPathWriterPathPlan parse plus HostKernel.kernelCheck of live
  ProductPathWriterPathPlan.lean, not := true, not lake build SystemsLean.ProductPathWriterPathPlan.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-PLAN,
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_PLAN_V0, slake-typecheck-productpathwriterpathplan,
  slakeTypecheckProductPathWriterPathPlanReady, kernelCheckLiveProductPathWriterPathPlanSource,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathWriterPathPlan
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveProductPathWriterPathPlan

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_PLAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-PLAN"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckProductPathWriterPathPlan : String :=
  "slake-typecheck-productpathwriterpathplan"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterPathPlanRel : String :=
  SystemsLean.HostFrontLiveProductPathWriterPathPlan.liveProductPathWriterPathPlanRel

/-- Ready names HostFrontLiveProductPathWriterPathPlan parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckProductPathWriterPathPlanReady,
    kernelCheckLiveProductPathWriterPathPlanSource. -/
def slakeTypecheckProductPathWriterPathPlanReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriterPathPlan.hostFrontLiveProductPathWriterPathPlanReady

/-- Honesty: this command is not lake build of ProductPathWriterPathPlan. -/
def slakeTypecheckProductPathWriterPathPlanDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriterPathPlanFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriterPathPlanOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathWriterPathPlan.lean.
    Ready is HostFrontLiveProductPathWriterPathPlan.hostFrontLiveProductPathWriterPathPlanReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathWriterPathPlan.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriterPathPlan} =="
  IO.println s!"  host={hostId} liveRel={SystemsLean.HostFrontLiveProductPathWriterPathPlan.liveRel} file={liveProductPathWriterPathPlanRel}"
  unless (!slakeTypecheckProductPathWriterPathPlanFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterPathPlanOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriterPathPlan.main args
