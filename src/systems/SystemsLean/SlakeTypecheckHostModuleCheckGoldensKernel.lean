/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckGoldensKernel.
  Short role: named driver for the HostModuleCheckGoldensKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckGoldensKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckGoldensKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckGoldensKernel.
  liveRel is HostModuleCheckGoldensKernel.lean.
  This wrap is HostModuleCheckGoldensKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-GOLDENS-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_GOLDENS_KERNEL,
  slake-typecheck-hostmodulecheckgoldenskernel,
  slakeTypecheckHostModuleCheckGoldensKernelReady,
  kernelCheckLiveHostModuleCheckGoldensKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-GOLDENS-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckGoldensKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckGoldensKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckGoldensKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_GOLDENS_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-GOLDENS-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckGoldensKernel : String :=
  "slake-typecheck-hostmodulecheckgoldenskernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckGoldensKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckGoldensKernelSource.liveHostModuleCheckGoldensKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckGoldensKernelReady. -/
def slakeTypecheckHostModuleCheckGoldensKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckGoldensKernelSource.hostFrontLiveHostModuleCheckGoldensKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckGoldensKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckGoldensKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckGoldensKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckGoldensKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckGoldensKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckGoldensKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckGoldensKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckGoldensKernelRel}"
  unless (!slakeTypecheckHostModuleCheckGoldensKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckGoldensKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckGoldensKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckGoldensKernelSource.main args
