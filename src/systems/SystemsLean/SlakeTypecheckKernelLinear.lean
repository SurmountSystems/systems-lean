/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelLinear.
  Short role: named driver for just slake-typecheck-kernellinear.
  Ready is HostFrontLiveKernelLinear parse plus HostKernel.kernelCheck of live
  KernelLinear.lean, not := true, not lake build SystemsLean.KernelLinear.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-LINEAR,
  SLAKE_TYPECHECK_KERNEL_LINEAR_V0, slake-typecheck-kernellinear,
  slakeTypecheckKernelLinearReady, kernelCheckLiveKernelLinearSource,
  PARSE-LIVE-KERNEL-LINEAR, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelLinear
  Checkable writer: just slake-typecheck-kernellinear (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelLinear

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-LINEAR"

/-- Named just recipe. Not lake build SystemsLean.KernelLinear. -/
def justRecipeSlakeTypecheckKernelLinear : String :=
  "slake-typecheck-kernellinear"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelLinearRel : String :=
  SystemsLean.HostFrontLiveKernelLinear.liveKernelLinearRel

/-- Ready names HostFrontLiveKernelLinear parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelLinearReady,
    kernelCheckLiveKernelLinearSource. -/
def slakeTypecheckKernelLinearReady : Bool :=
  SystemsLean.HostFrontLiveKernelLinear.hostFrontLiveKernelLinearReady

/-- Honesty: this command is not lake build of KernelLinear. -/
def slakeTypecheckKernelLinearDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelLinearFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelLinearOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelLinear.lean.
    Ready is HostFrontLiveKernelLinear.hostFrontLiveKernelLinearReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelLinear.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelLinear} =="
  IO.println s!"  host={hostId} file={liveKernelLinearRel}"
  unless (!slakeTypecheckKernelLinearFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelLinearOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelLinear.main args
