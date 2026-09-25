/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportSeedsKernel.
  Short role: named driver for the HostModuleCheckImportSeedsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportSeedsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportSeedsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportSeedsKernel.
  liveRel is HostModuleCheckImportSeedsKernel.lean.
  This wrap is HostModuleCheckImportSeedsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-SEEDS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_SEEDS_KERNEL,
  slake-typecheck-hostmodulecheckimportseedskernel,
  slakeTypecheckHostModuleCheckImportSeedsKernelReady,
  kernelCheckLiveHostModuleCheckImportSeedsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-SEEDS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportSeedsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportSeedsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportSeedsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_SEEDS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-SEEDS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportSeedsKernel : String :=
  "slake-typecheck-hostmodulecheckimportseedskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportSeedsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportSeedsKernelSource.liveHostModuleCheckImportSeedsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportSeedsKernelReady. -/
def slakeTypecheckHostModuleCheckImportSeedsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportSeedsKernelSource.hostFrontLiveHostModuleCheckImportSeedsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportSeedsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportSeedsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportSeedsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportSeedsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportSeedsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportSeedsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportSeedsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportSeedsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportSeedsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportSeedsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportSeedsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportSeedsKernelSource.main args
