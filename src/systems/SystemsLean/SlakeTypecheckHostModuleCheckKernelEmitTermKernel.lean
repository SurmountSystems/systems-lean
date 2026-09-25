/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckKernelEmitTermKernel.
  Short role: named driver for the HostModuleCheckKernelEmitTermKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckKernelEmitTermKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckKernelEmitTermKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckKernelEmitTermKernel.
  liveRel is HostModuleCheckKernelEmitTermKernel.lean.
  This wrap is HostModuleCheckKernelEmitTermKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-EMIT-TERM-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_EMIT_TERM_KERNEL,
  slake-typecheck-hostmodulecheckkernelemittermkernel,
  slakeTypecheckHostModuleCheckKernelEmitTermKernelReady,
  kernelCheckLiveHostModuleCheckKernelEmitTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-EMIT-TERM-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelEmitTermKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckKernelEmitTermKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_EMIT_TERM_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-EMIT-TERM-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckKernelEmitTermKernel : String :=
  "slake-typecheck-hostmodulecheckkernelemittermkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckKernelEmitTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermKernelSource.liveHostModuleCheckKernelEmitTermKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckKernelEmitTermKernelReady. -/
def slakeTypecheckHostModuleCheckKernelEmitTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermKernelSource.hostFrontLiveHostModuleCheckKernelEmitTermKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckKernelEmitTermKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelEmitTermKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckKernelEmitTermKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelEmitTermKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckKernelEmitTermKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckKernelEmitTermKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelEmitTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckKernelEmitTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelEmitTermKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelEmitTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelEmitTermKernelSource.main args
