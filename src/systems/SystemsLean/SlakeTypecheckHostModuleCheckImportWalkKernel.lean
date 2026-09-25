/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportWalkKernel.
  Short role: named driver for the HostModuleCheckImportWalkKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportWalkKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportWalkKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportWalkKernel.
  liveRel is HostModuleCheckImportWalkKernel.lean.
  This wrap is HostModuleCheckImportWalkKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-WALK-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_WALK_KERNEL,
  slake-typecheck-hostmodulecheckimportwalkkernel,
  slakeTypecheckHostModuleCheckImportWalkKernelReady,
  kernelCheckLiveHostModuleCheckImportWalkKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-WALK-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportWalkKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportWalkKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportWalkKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_WALK_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-WALK-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportWalkKernel : String :=
  "slake-typecheck-hostmodulecheckimportwalkkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportWalkKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportWalkKernelSource.liveHostModuleCheckImportWalkKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportWalkKernelReady. -/
def slakeTypecheckHostModuleCheckImportWalkKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportWalkKernelSource.hostFrontLiveHostModuleCheckImportWalkKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportWalkKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportWalkKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportWalkKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportWalkKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportWalkKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportWalkKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportWalkKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportWalkKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportWalkKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportWalkKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportWalkKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportWalkKernelSource.main args
