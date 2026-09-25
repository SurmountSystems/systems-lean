/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportLoadOkLaterKernel.
  Short role: named driver for the HostModuleCheckImportLoadOkLaterKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportLoadOkLaterKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportLoadOkLaterKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportLoadOkLaterKernel.
  liveRel is HostModuleCheckImportLoadOkLaterKernel.lean.
  This wrap is HostModuleCheckImportLoadOkLaterKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-LOAD-OK-LATER-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_LOAD_OK_LATER_KERNEL,
  slake-typecheck-hostmodulecheckimportloadoklaterkernel,
  slakeTypecheckHostModuleCheckImportLoadOkLaterKernelReady,
  kernelCheckLiveHostModuleCheckImportLoadOkLaterKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-LOAD-OK-LATER-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportLoadOkLaterKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportLoadOkLaterKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportLoadOkLaterKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_LOAD_OK_LATER_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-LOAD-OK-LATER-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportLoadOkLaterKernel : String :=
  "slake-typecheck-hostmodulecheckimportloadoklaterkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportLoadOkLaterKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportLoadOkLaterKernelSource.liveHostModuleCheckImportLoadOkLaterKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportLoadOkLaterKernelReady. -/
def slakeTypecheckHostModuleCheckImportLoadOkLaterKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportLoadOkLaterKernelSource.hostFrontLiveHostModuleCheckImportLoadOkLaterKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportLoadOkLaterKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportLoadOkLaterKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportLoadOkLaterKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportLoadOkLaterKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportLoadOkLaterKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportLoadOkLaterKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportLoadOkLaterKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportLoadOkLaterKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportLoadOkLaterKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportLoadOkLaterKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportLoadOkLaterKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportLoadOkLaterKernelSource.main args
