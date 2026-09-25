/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFrontTheoremsKernel.
  Short role: named driver for the HostModuleCheckFrontTheoremsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckFrontTheoremsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckFrontTheoremsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckFrontTheoremsKernel.
  liveRel is HostModuleCheckFrontTheoremsKernel.lean.
  This wrap is HostModuleCheckFrontTheoremsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-FRONT-THEOREMS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_FRONT_THEOREMS_KERNEL,
  slake-typecheck-hostmodulecheckfronttheoremskernel,
  slakeTypecheckHostModuleCheckFrontTheoremsKernelReady,
  kernelCheckLiveHostModuleCheckFrontTheoremsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-FRONT-THEOREMS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFrontTheoremsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckFrontTheoremsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFrontTheoremsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_FRONT_THEOREMS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-FRONT-THEOREMS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckFrontTheoremsKernel : String :=
  "slake-typecheck-hostmodulecheckfronttheoremskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckFrontTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFrontTheoremsKernelSource.liveHostModuleCheckFrontTheoremsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckFrontTheoremsKernelReady. -/
def slakeTypecheckHostModuleCheckFrontTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFrontTheoremsKernelSource.hostFrontLiveHostModuleCheckFrontTheoremsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFrontTheoremsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFrontTheoremsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckFrontTheoremsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFrontTheoremsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFrontTheoremsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFrontTheoremsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFrontTheoremsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFrontTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckFrontTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFrontTheoremsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFrontTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFrontTheoremsKernelSource.main args
