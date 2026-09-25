/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCheckersKernel.
  Short role: named driver for lean --run of
  HostModuleCheckCheckersKernel.lean.
  Ready is HostFrontLiveHostModuleCheckCheckersKernel parse plus
  HostKernel.kernelCheck of live HostModuleCheckCheckersKernel.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCheckersKernel.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCheckersKernel
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERSKERNEL
  SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERSKERNEL_V0
  PARSE-LIVE-HOSTMODULECHECKCHECKERSKERNEL
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcheckerskernel,
  slakeTypecheckHostModuleCheckCheckersKernelReady,
  kernelCheckLiveHostModuleCheckCheckersKernelSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCheckersKernel
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERSKERNEL_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERSKERNEL"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCheckersKernel.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCheckersKernel : String :=
  "slake-typecheck-hostmodulecheckcheckerskernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCheckersKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel.liveHostModuleCheckCheckersKernelRel

/-- Ready names HostFrontLiveHostModuleCheckCheckersKernel parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCheckersKernelReady,
    kernelCheckLiveHostModuleCheckCheckersKernelSource. -/
def slakeTypecheckHostModuleCheckCheckersKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel.hostFrontLiveHostModuleCheckCheckersKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCheckersKernelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCheckersKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCheckersKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCheckersKernel.lean.
    Ready is hostFrontLiveHostModuleCheckCheckersKernelReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCheckersKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCheckersKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCheckersKernelRel}"
  unless (!slakeTypecheckHostModuleCheckCheckersKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCheckersKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCheckersKernelDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCheckersKernel.main args
