/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckImportModsKernel.
  Short role: named driver for the HostModuleCheckImportModsKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckImportModsKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckImportModsKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckImportModsKernel.
  liveRel is HostModuleCheckImportModsKernel.lean.
  This wrap is HostModuleCheckImportModsKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-MODS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_MODS_KERNEL,
  slake-typecheck-hostmodulecheckimportmodskernel,
  slakeTypecheckHostModuleCheckImportModsKernelReady,
  kernelCheckLiveHostModuleCheckImportModsKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-IMPORT-MODS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckImportModsKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckImportModsKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckImportModsKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_IMPORT_MODS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-IMPORT-MODS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckImportModsKernel : String :=
  "slake-typecheck-hostmodulecheckimportmodskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckImportModsKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckImportModsKernelSource.liveHostModuleCheckImportModsKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckImportModsKernelReady. -/
def slakeTypecheckHostModuleCheckImportModsKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckImportModsKernelSource.hostFrontLiveHostModuleCheckImportModsKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckImportModsKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckImportModsKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckImportModsKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckImportModsKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckImportModsKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckImportModsKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckImportModsKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckImportModsKernelRel}"
  unless (!slakeTypecheckHostModuleCheckImportModsKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportModsKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckImportModsKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckImportModsKernelSource.main args
