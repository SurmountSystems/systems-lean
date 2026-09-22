/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelMult.
  Short role: named driver for just slake-typecheck-kernelmult.
  Ready is HostFrontLiveKernelMult parse plus HostKernel.kernelCheck of live
  KernelMult.lean, not := true, not lake build SystemsLean.KernelMult.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNELMULT,
  SLAKE_TYPECHECK_KERNELMULT_V0, slake-typecheck-kernelmult,
  slakeTypecheckKernelMultReady, kernelCheckLiveKernelMultSource,
  PARSE-LIVE-KERNELMULT, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelMult
  Checkable writer: just slake-typecheck-kernelmult (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelMult

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNELMULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNELMULT"

/-- Named just recipe. Not lake build SystemsLean.KernelMult. -/
def justRecipeSlakeTypecheckKernelMult : String :=
  "slake-typecheck-kernelmult"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelMultRel : String :=
  SystemsLean.HostFrontLiveKernelMult.liveKernelMultRel

/-- Ready names HostFrontLiveKernelMult parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelMultReady,
    kernelCheckLiveKernelMultSource. -/
def slakeTypecheckKernelMultReady : Bool :=
  SystemsLean.HostFrontLiveKernelMult.hostFrontLiveKernelMultReady

/-- Honesty: this command is not lake build of KernelMult. -/
def slakeTypecheckKernelMultDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelMultFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelMultOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelMult.lean.
    Ready is HostFrontLiveKernelMult.hostFrontLiveKernelMultReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelMult.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelMult} =="
  IO.println s!"  host={hostId} file={liveKernelMultRel}"
  unless (!slakeTypecheckKernelMultFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelMultOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelMult.main args
