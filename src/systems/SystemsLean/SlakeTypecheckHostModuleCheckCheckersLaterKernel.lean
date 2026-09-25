/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCheckersLaterKernel.
  Short role: named driver for lean --run of
  HostModuleCheckCheckersLaterKernel.lean.
  Ready is HostFrontLiveHostModuleCheckCheckersLaterKernel parse plus
  HostKernel.kernelCheck of live HostModuleCheckCheckersLaterKernel.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCheckersLaterKernel.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCheckersLaterKernel
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERSLATERKERNEL
  SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERSLATERKERNEL_V0
  PARSE-LIVE-HOSTMODULECHECKCHECKERSLATERKERNEL
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcheckerslaterkernel,
  slakeTypecheckHostModuleCheckCheckersLaterKernelReady,
  kernelCheckLiveHostModuleCheckCheckersLaterKernelSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCheckersLaterKernel
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCheckersLaterKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCHECKERSLATERKERNEL_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCHECKERSLATERKERNEL"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCheckersLaterKernel.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCheckersLaterKernel : String :=
  "slake-typecheck-hostmodulecheckcheckerslaterkernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCheckersLaterKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckersLaterKernel.liveHostModuleCheckCheckersLaterKernelRel

/-- Ready names HostFrontLiveHostModuleCheckCheckersLaterKernel parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCheckersLaterKernelReady,
    kernelCheckLiveHostModuleCheckCheckersLaterKernelSource. -/
def slakeTypecheckHostModuleCheckCheckersLaterKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCheckersLaterKernel.hostFrontLiveHostModuleCheckCheckersLaterKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCheckersLaterKernelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCheckersLaterKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCheckersLaterKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCheckersLaterKernel.lean.
    Ready is hostFrontLiveHostModuleCheckCheckersLaterKernelReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCheckersLaterKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCheckersLaterKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCheckersLaterKernel.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCheckersLaterKernelRel}"
  unless (!slakeTypecheckHostModuleCheckCheckersLaterKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCheckersLaterKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCheckersLaterKernelDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCheckersLaterKernel.main args
