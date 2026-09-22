/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelEmit.
  Short role: named driver for just slake-typecheck-kernelemit.
  Ready is HostFrontLiveKernelEmit parse plus HostKernel.kernelCheck of live
  KernelEmit.lean, not := true, not lake build SystemsLean.KernelEmit.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-EMIT,
  SLAKE_TYPECHECK_KERNEL_EMIT_V0, slake-typecheck-kernelemit,
  slakeTypecheckKernelEmitReady, kernelCheckLiveKernelEmitSource,
  PARSE-LIVE-KERNEL-EMIT, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelEmit
  Checkable writer: just slake-typecheck-kernelemit (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelEmit

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-EMIT"

/-- Named just recipe. Not lake build SystemsLean.KernelEmit. -/
def justRecipeSlakeTypecheckKernelEmit : String :=
  "slake-typecheck-kernelemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelEmitRel : String :=
  SystemsLean.HostFrontLiveKernelEmit.liveKernelEmitRel

/-- Ready names HostFrontLiveKernelEmit parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelEmitReady,
    kernelCheckLiveKernelEmitSource. -/
def slakeTypecheckKernelEmitReady : Bool :=
  SystemsLean.HostFrontLiveKernelEmit.hostFrontLiveKernelEmitReady

/-- Honesty: this command is not lake build of KernelEmit. -/
def slakeTypecheckKernelEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelEmitFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelEmit.lean.
    Ready is HostFrontLiveKernelEmit.hostFrontLiveKernelEmitReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelEmit} =="
  IO.println s!"  host={hostId} file={liveKernelEmitRel}"
  unless (!slakeTypecheckKernelEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelEmit.main args
