/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostKernel.
  Short role: named driver for just slake-typecheck-hostkernel.
  Ready is HostFrontLiveHostKernel parse plus HostKernel.kernelCheck of live
  HostKernel.lean, not := true, not lake build SystemsLean.HostKernel.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOSTKERNEL,
  SLAKE_TYPECHECK_HOSTKERNEL_V0, slake-typecheck-hostkernel,
  slakeTypecheckHostKernelReady, kernelCheckLiveHostKernelSource,
  PARSE-LIVE-HOSTKERNEL, SKELETON.
  Module: SystemsLean.SlakeTypecheckHostKernel
  Checkable writer: just slake-typecheck-hostkernel (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOSTKERNEL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOSTKERNEL"

/-- Named just recipe. Not lake build SystemsLean.HostKernel. -/
def justRecipeSlakeTypecheckHostKernel : String :=
  "slake-typecheck-hostkernel"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostKernelRel : String :=
  SystemsLean.HostFrontLiveHostKernel.liveHostKernelRel

/-- Ready names HostFrontLiveHostKernel parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostKernelReady,
    kernelCheckLiveHostKernelSource. -/
def slakeTypecheckHostKernelReady : Bool :=
  SystemsLean.HostFrontLiveHostKernel.hostFrontLiveHostKernelReady

/-- Honesty: this command is not lake build of HostKernel. -/
def slakeTypecheckHostKernelDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostKernelFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostKernelOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostKernel.lean.
    Ready is HostFrontLiveHostKernel.hostFrontLiveHostKernelReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostKernel.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostKernel} =="
  IO.println s!"  host={hostId} file={liveHostKernelRel}"
  unless (!slakeTypecheckHostKernelFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostKernelOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostKernel.main args
