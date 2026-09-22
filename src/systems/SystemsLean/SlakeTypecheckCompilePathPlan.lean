/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathPlan.
  Short role: named driver for just slake-typecheck-compilepathplan.
  Ready is HostFrontLiveCompilePathPlan parse plus HostKernel.kernelCheck
  of live CompilePathPlan.lean, not := true, not lake build
  SystemsLean.CompilePathPlan.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathPlan drivers are not prefix hits):
  SlakeTypecheckCompilePathPlan
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-PLAN
  SLAKE_TYPECHECK_COMPILE_PATH_PLAN_V0
  PARSE-LIVE-COMPILE-PATH-PLAN
  COMPILE-PATH-PLAN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathplan,
  slakeTypecheckCompilePathPlanReady,
  kernelCheckLiveCompilePathPlanSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathPlan
  Checkable writer: just slake-typecheck-compilepathplan
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathPlan

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_PLAN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-PLAN"

/-- Named just recipe. Not lake build SystemsLean.CompilePathPlan. -/
def justRecipeSlakeTypecheckCompilePathPlan : String :=
  "slake-typecheck-compilepathplan"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathPlanRel : String :=
  SystemsLean.HostFrontLiveCompilePathPlan.liveCompilePathPlanRel

/-- Ready names HostFrontLiveCompilePathPlan parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathPlanReady,
    kernelCheckLiveCompilePathPlanSource. -/
def slakeTypecheckCompilePathPlanReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathPlan.hostFrontLiveCompilePathPlanReady

/-- Honesty: this command is not lake build of CompilePathPlan. -/
def slakeTypecheckCompilePathPlanDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathPlanFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathPlanOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathPlan.lean.
    Ready is HostFrontLiveCompilePathPlan.hostFrontLiveCompilePathPlanReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathPlan.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathPlan} =="
  IO.println s!"  host={hostId} file={liveCompilePathPlanRel}"
  unless (!slakeTypecheckCompilePathPlanFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathPlanOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathPlan.main args
