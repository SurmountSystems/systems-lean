/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportModelKernel.
  Short role: named driver for the HostModuleCheckImportModelKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportModelKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportModelKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportModelKernel.
  liveRel is HostModuleCheckImportModelKernel.lean.
  This wrap is HostModuleCheckImportModelKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-MODEL-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_MODEL_KERNEL,
  slake-typecheck-hostmodulecheckimportmodelkernel,
  slakeTypecheckHostModuleCheckImportModelKernelReady,
  kernelCheckLiveHostModuleCheckImportModelKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-MODEL-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportModelKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportModelKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportModelKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_MODEL_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-MODEL-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportModelKernel : String :=
  "slake-typecheck-hostmodulecheckimportmodelkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportModelKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportModelKernelSource.liveHostModuleCheckImportModelKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportModelKernelReady. -/
def slakeTypecheckHostModuleCheckImportModelKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportModelKernelSource.hostFrontLiveHostModuleCheckImportModelKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportModelKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportModelKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportModelKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportModelKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportModelKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportModelKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportModelKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportModelKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportModelKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportModelKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportModelKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportModelKernelSource.main args
