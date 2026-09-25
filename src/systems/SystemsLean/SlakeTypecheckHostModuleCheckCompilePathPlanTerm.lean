/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathPlanTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathPlanTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathPlanTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathPlanTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathPlanTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathPlanTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHPLANTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHPLANTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHPLANTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathplanterm,
  slakeTypecheckHostModuleCheckCompilePathPlanTermReady,
  kernelCheckLiveHostModuleCheckCompilePathPlanTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathPlanTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHPLANTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHPLANTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathPlanTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathPlanTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathplanterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathPlanTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm.liveHostModuleCheckCompilePathPlanTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathPlanTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathPlanTermReady,
    kernelCheckLiveHostModuleCheckCompilePathPlanTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathPlanTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm.hostFrontLiveHostModuleCheckCompilePathPlanTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathPlanTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathPlanTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathPlanTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathPlanTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathPlanTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathPlanTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathPlanTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathPlanTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathPlanTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathPlanTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathPlanTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm.main args
