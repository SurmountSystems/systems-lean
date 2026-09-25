/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckTypesKernel.
  Short role: named driver for the HostModuleCheckTypesKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckTypesKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckTypesKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckTypesKernel.
  liveRel is HostModuleCheckTypesKernel.lean.
  This wrap is HostModuleCheckTypesKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_KERNEL,
  slake-typecheck-hostmodulechecktypeskernel,
  slakeTypecheckHostModuleCheckTypesKernelReady,
  kernelCheckLiveHostModuleCheckTypesKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-TYPES-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTypesKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckTypesKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTypesKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckTypesKernel : String :=
  "slake-typecheck-hostmodulechecktypeskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckTypesKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesKernelSource.liveHostModuleCheckTypesKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTypesKernelReady. -/
def slakeTypecheckHostModuleCheckTypesKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesKernelSource.hostFrontLiveHostModuleCheckTypesKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckTypesKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTypesKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckTypesKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTypesKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckTypesKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTypesKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTypesKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesKernelRel}"
  unless (!slakeTypecheckHostModuleCheckTypesKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTypesKernelSource.main args
