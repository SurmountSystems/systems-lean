/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckKernelProgramTermKernel.
  Short role: named driver for the HostModuleCheckKernelProgramTermKernel
  closed subset.
  Ready is HostFrontLiveHostModuleCheckKernelProgramTermKernelSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckKernelProgramTermKernel.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckKernelProgramTermKernel.
  liveRel is HostModuleCheckKernelProgramTermKernel.lean.
  This wrap is HostModuleCheckKernelProgramTermKernel.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-PROGRAM-TERM-KERNEL,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_PROGRAM_TERM_KERNEL,
  slake-typecheck-hostmodulecheckkernelprogramtermkernel,
  slakeTypecheckHostModuleCheckKernelProgramTermKernelReady,
  kernelCheckLiveHostModuleCheckKernelProgramTermKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-PROGRAM-TERM-KERNEL.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckKernelProgramTermKernel
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckKernelProgramTermKernel.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTermKernelSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_KERNEL_PROGRAM_TERM_KERNEL"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-KERNEL-PROGRAM-TERM-KERNEL"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckKernelProgramTermKernel : String :=
  "slake-typecheck-hostmodulecheckkernelprogramtermkernel"

/-- Live file relative to repo root. -/
def liveHostModuleCheckKernelProgramTermKernelRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTermKernelSource.liveHostModuleCheckKernelProgramTermKernelRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckKernelProgramTermKernelReady. -/
def slakeTypecheckHostModuleCheckKernelProgramTermKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTermKernelSource.hostFrontLiveHostModuleCheckKernelProgramTermKernelReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckKernelProgramTermKernelDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckKernelProgramTermKernelFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckKernelProgramTermKernelFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckKernelProgramTermKernelOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckKernelProgramTermKernel.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckKernelProgramTermKernel} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTermKernelSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckKernelProgramTermKernelRel}"
  unless (!slakeTypecheckHostModuleCheckKernelProgramTermKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelProgramTermKernelFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckKernelProgramTermKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckKernelProgramTermKernelSource.main args
