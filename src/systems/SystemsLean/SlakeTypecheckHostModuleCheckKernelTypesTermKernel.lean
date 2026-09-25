/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckKernelTypesTermKernel.
  Short role: named driver for the HostModuleCheckKernelTypesTermKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckKernelTypesTermKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckKernelTypesTermKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckKernelTypesTermKernel.
  liveRel is HostModuleCheckKernelTypesTermKernel.lean.
  This wrap is HostModuleCheckKernelTypesTermKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-TYPES-TERM-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_TYPES_TERM_KERNEL,
  slake-typecheck-hostmodulecheckkerneltypesttermkernel,
  slakeTypecheckHostModuleCheckKernelTypesTermKernelReady,
  kernelCheckLiveHostModuleCheckKernelTypesTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-TYPES-TERM-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelTypesTermKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckKernelTypesTermKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelTypesTermKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_TYPES_TERM_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-TYPES-TERM-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckKernelTypesTermKernel : String :=
  "slake-typecheck-hostmodulecheckkerneltypesttermkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckKernelTypesTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelTypesTermKernelSource.liveHostModuleCheckKernelTypesTermKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckKernelTypesTermKernelReady. -/
def slakeTypecheckHostModuleCheckKernelTypesTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelTypesTermKernelSource.hostFrontLiveHostModuleCheckKernelTypesTermKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckKernelTypesTermKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelTypesTermKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckKernelTypesTermKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelTypesTermKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckKernelTypesTermKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckKernelTypesTermKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelTypesTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelTypesTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckKernelTypesTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelTypesTermKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelTypesTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelTypesTermKernelSource.main args
