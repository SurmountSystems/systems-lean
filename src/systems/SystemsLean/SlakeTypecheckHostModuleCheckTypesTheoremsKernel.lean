/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckTypesTheoremsKernel.
  Short role: named driver for the HostModuleCheckTypesTheoremsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckTypesTheoremsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckTypesTheoremsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckTypesTheoremsKernel.
  liveRel is HostModuleCheckTypesTheoremsKernel.lean.
  This wrap is HostModuleCheckTypesTheoremsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-THEOREMS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_THEOREMS_KERNEL,
  slake-typecheck-hostmodulechecktypestheoremskernel,
  slakeTypecheckHostModuleCheckTypesTheoremsKernelReady,
  kernelCheckLiveHostModuleCheckTypesTheoremsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-TYPES-THEOREMS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTypesTheoremsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckTypesTheoremsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTypesTheoremsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_THEOREMS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-THEOREMS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckTypesTheoremsKernel : String :=
  "slake-typecheck-hostmodulechecktypestheoremskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckTypesTheoremsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesTheoremsKernelSource.liveHostModuleCheckTypesTheoremsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTypesTheoremsKernelReady. -/
def slakeTypecheckHostModuleCheckTypesTheoremsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesTheoremsKernelSource.hostFrontLiveHostModuleCheckTypesTheoremsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckTypesTheoremsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTypesTheoremsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckTypesTheoremsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTypesTheoremsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckTypesTheoremsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTypesTheoremsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTypesTheoremsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesTheoremsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckTypesTheoremsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesTheoremsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesTheoremsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTypesTheoremsKernelSource.main args
