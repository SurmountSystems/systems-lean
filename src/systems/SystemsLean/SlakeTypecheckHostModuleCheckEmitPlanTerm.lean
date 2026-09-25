/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitPlanTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitPlanTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitPlanTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitPlanTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitPlanTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitPlanTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITPLANTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITPLANTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITPLANTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitplanterm,
  slakeTypecheckHostModuleCheckEmitPlanTermReady,
  kernelCheckLiveHostModuleCheckEmitPlanTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitPlanTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitPlanTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITPLANTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITPLANTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitPlanTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitPlanTerm : String :=
  "slake-typecheck-hostmodulecheckemitplanterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitPlanTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitPlanTerm.liveHostModuleCheckEmitPlanTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitPlanTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitPlanTermReady,
    kernelCheckLiveHostModuleCheckEmitPlanTermSource. -/
def slakeTypecheckHostModuleCheckEmitPlanTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitPlanTerm.hostFrontLiveHostModuleCheckEmitPlanTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitPlanTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitPlanTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitPlanTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitPlanTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitPlanTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitPlanTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitPlanTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitPlanTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitPlanTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitPlanTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitPlanTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitPlanTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitPlanTerm.main args
