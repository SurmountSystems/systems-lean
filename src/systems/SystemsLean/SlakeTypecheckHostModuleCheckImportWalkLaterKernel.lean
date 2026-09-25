/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportWalkLaterKernel.
  Short role: named driver for the HostModuleCheckImportWalkLaterKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportWalkLaterKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportWalkLaterKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportWalkLaterKernel.
  liveRel is HostModuleCheckImportWalkLaterKernel.lean.
  This wrap is HostModuleCheckImportWalkLaterKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-WALK-LATER-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_WALK_LATER_KERNEL,
  slake-typecheck-hostmodulecheckimportwalklaterkernel,
  slakeTypecheckHostModuleCheckImportWalkLaterKernelReady,
  kernelCheckLiveHostModuleCheckImportWalkLaterKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-WALK-LATER-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportWalkLaterKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportWalkLaterKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportWalkLaterKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_WALK_LATER_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-WALK-LATER-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportWalkLaterKernel : String :=
  "slake-typecheck-hostmodulecheckimportwalklaterkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportWalkLaterKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportWalkLaterKernelSource.liveHostModuleCheckImportWalkLaterKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportWalkLaterKernelReady. -/
def slakeTypecheckHostModuleCheckImportWalkLaterKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportWalkLaterKernelSource.hostFrontLiveHostModuleCheckImportWalkLaterKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportWalkLaterKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportWalkLaterKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportWalkLaterKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportWalkLaterKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportWalkLaterKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportWalkLaterKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportWalkLaterKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportWalkLaterKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportWalkLaterKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportWalkLaterKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportWalkLaterKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportWalkLaterKernelSource.main args
