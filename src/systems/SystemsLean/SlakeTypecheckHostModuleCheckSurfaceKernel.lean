/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSurfaceKernel.
  Short role: named driver for the HostModuleCheckSurfaceKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckSurfaceKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckSurfaceKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckSurfaceKernel.
  liveRel is HostModuleCheckSurfaceKernel.lean.
  This wrap is HostModuleCheckSurfaceKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-SURFACE-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_SURFACE_KERNEL,
  slake-typecheck-hostmodulechecksurfacekernel,
  slakeTypecheckHostModuleCheckSurfaceKernelReady,
  kernelCheckLiveHostModuleCheckSurfaceKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-SURFACE-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSurfaceKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckSurfaceKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSurfaceKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_SURFACE_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-SURFACE-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckSurfaceKernel : String :=
  "slake-typecheck-hostmodulechecksurfacekernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckSurfaceKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSurfaceKernelSource.liveHostModuleCheckSurfaceKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSurfaceKernelReady. -/
def slakeTypecheckHostModuleCheckSurfaceKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSurfaceKernelSource.hostFrontLiveHostModuleCheckSurfaceKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSurfaceKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSurfaceKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckSurfaceKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSurfaceKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSurfaceKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSurfaceKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSurfaceKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSurfaceKernelRel}"
  unless (!slakeTypecheckHostModuleCheckSurfaceKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSurfaceKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSurfaceKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSurfaceKernelSource.main args
