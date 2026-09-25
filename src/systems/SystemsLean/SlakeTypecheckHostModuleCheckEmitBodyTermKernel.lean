/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitBodyTermKernel.
  Short role: named driver for the HostModuleCheckEmitBodyTermKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckEmitBodyTermKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckEmitBodyTermKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckEmitBodyTermKernel.
  liveRel is HostModuleCheckEmitBodyTermKernel.lean.
  This wrap is HostModuleCheckEmitBodyTermKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-EMIT-BODY-TERM-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_EMIT_BODY_TERM_KERNEL,
  slake-typecheck-hostmodulecheckemitbodytermkernel,
  slakeTypecheckHostModuleCheckEmitBodyTermKernelReady,
  kernelCheckLiveHostModuleCheckEmitBodyTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-EMIT-BODY-TERM-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitBodyTermKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckEmitBodyTermKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTermKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_EMIT_BODY_TERM_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-EMIT-BODY-TERM-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitBodyTermKernel : String :=
  "slake-typecheck-hostmodulecheckemitbodytermkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckEmitBodyTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTermKernelSource.liveHostModuleCheckEmitBodyTermKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckEmitBodyTermKernelReady. -/
def slakeTypecheckHostModuleCheckEmitBodyTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTermKernelSource.hostFrontLiveHostModuleCheckEmitBodyTermKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitBodyTermKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitBodyTermKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckEmitBodyTermKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitBodyTermKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitBodyTermKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitBodyTermKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitBodyTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckEmitBodyTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitBodyTermKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitBodyTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitBodyTermKernelSource.main args
