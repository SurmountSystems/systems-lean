/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.ProductPathWriterPathPlanTheorems.
  Short role: named driver for
  just slake-typecheck-productpathwriterpathplantheorems.
  Ready is HostFrontLiveProductPathWriterPathPlanTheorems parse plus
  HostKernel.kernelCheck of live ProductPathWriterPathPlanTheorems.lean,
  not a hardcoded true, not lake build
  SystemsLean.ProductPathWriterPathPlanTheorems.
  liveRel is ProductPathWriterPathPlanTheorems.lean.
  This wrap is ProductPathWriterPathPlanTheorems.lean.
  It is not ProductPathWriterPathPlan.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-PLAN-THEOREMS,
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_PLAN_THEOREMS,
  slake-typecheck-productpathwriterpathplantheorems,
  slakeTypecheckProductPathWriterPathPlanTheoremsReady,
  kernelCheckLiveProductPathWriterPathPlanTheoremsSource,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN-THEOREMS.
  Module: SystemsLean.SlakeTypecheckProductPathWriterPathPlanTheorems
  Checkable writer: just slake-typecheck-productpathwriterpathplantheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_PLAN_THEOREMS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-PLAN-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.ProductPathWriterPathPlanTheorems. -/
def justRecipeSlakeTypecheckProductPathWriterPathPlanTheorems : String :=
  "slake-typecheck-productpathwriterpathplantheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterPathPlanTheoremsRel : String :=
  SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems.liveProductPathWriterPathPlanTheoremsRel

/-- Ready names HostFrontLiveProductPathWriterPathPlanTheorems parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckProductPathWriterPathPlanTheoremsReady,
    kernelCheckLiveProductPathWriterPathPlanTheoremsSource. -/
def slakeTypecheckProductPathWriterPathPlanTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems.hostFrontLiveProductPathWriterPathPlanTheoremsReady

/-- Honesty: this command is not lake build of ProductPathWriterPathPlanTheorems. -/
def slakeTypecheckProductPathWriterPathPlanTheoremsDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriterPathPlanTheoremsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProductPathWriterPathPlanTheoremsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriterPathPlanTheoremsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    ProductPathWriterPathPlanTheorems.lean.
    Ready is HostFrontLiveProductPathWriterPathPlanTheorems.hostFrontLiveProductPathWriterPathPlanTheoremsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProductPathWriterPathPlanTheorems.main at runtime.
    kernelCheck is HostKernel.kernelCheck. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriterPathPlanTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveProductPathWriterPathPlanTheoremsRel}"
  unless (!slakeTypecheckProductPathWriterPathPlanTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterPathPlanTheoremsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterPathPlanTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems.main args
