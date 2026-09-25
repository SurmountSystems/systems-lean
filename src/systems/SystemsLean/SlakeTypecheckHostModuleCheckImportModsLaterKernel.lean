/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportModsLaterKernel.
  Short role: named driver for the HostModuleCheckImportModsLaterKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportModsLaterKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportModsLaterKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportModsLaterKernel.
  liveRel is HostModuleCheckImportModsLaterKernel.lean.
  This wrap is HostModuleCheckImportModsLaterKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-MODS-LATER-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_MODS_LATER_KERNEL,
  slake-typecheck-hostmodulecheckimportmodslaterkernel,
  slakeTypecheckHostModuleCheckImportModsLaterKernelReady,
  kernelCheckLiveHostModuleCheckImportModsLaterKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-MODS-LATER-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportModsLaterKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportModsLaterKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportModsLaterKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_MODS_LATER_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-MODS-LATER-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportModsLaterKernel : String :=
  "slake-typecheck-hostmodulecheckimportmodslaterkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportModsLaterKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportModsLaterKernelSource.liveHostModuleCheckImportModsLaterKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportModsLaterKernelReady. -/
def slakeTypecheckHostModuleCheckImportModsLaterKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportModsLaterKernelSource.hostFrontLiveHostModuleCheckImportModsLaterKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportModsLaterKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportModsLaterKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportModsLaterKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportModsLaterKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportModsLaterKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportModsLaterKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportModsLaterKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportModsLaterKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportModsLaterKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportModsLaterKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportModsLaterKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportModsLaterKernelSource.main args
