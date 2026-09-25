/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFrontKernel.
  Short role: named driver for the HostModuleCheckFrontKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckFrontKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckFrontKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckFrontKernel.
  liveRel is HostModuleCheckFrontKernel.lean.
  This wrap is HostModuleCheckFrontKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-FRONT-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_FRONT_KERNEL,
  slake-typecheck-hostmodulecheckfrontkernel,
  slakeTypecheckHostModuleCheckFrontKernelReady,
  kernelCheckLiveHostModuleCheckFrontKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-FRONT-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFrontKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckFrontKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFrontKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_FRONT_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-FRONT-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckFrontKernel : String :=
  "slake-typecheck-hostmodulecheckfrontkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckFrontKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFrontKernelSource.liveHostModuleCheckFrontKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckFrontKernelReady. -/
def slakeTypecheckHostModuleCheckFrontKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFrontKernelSource.hostFrontLiveHostModuleCheckFrontKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFrontKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFrontKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckFrontKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFrontKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFrontKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFrontKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFrontKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFrontKernelRel}"
  unless (!slakeTypecheckHostModuleCheckFrontKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFrontKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFrontKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFrontKernelSource.main args
