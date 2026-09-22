/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelEmitTheorems.
  Short role: named driver for just slake-typecheck-kernelemittheorems.
  Ready is HostFrontLiveKernelEmitTheorems parse plus HostKernel.kernelCheck
  of live KernelEmitTheorems.lean, not := true, not lake build
  SystemsLean.KernelEmitTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-EMIT-THEOREMS,
  SLAKE_TYPECHECK_KERNEL_EMIT_THEOREMS_V0, slake-typecheck-kernelemittheorems,
  slakeTypecheckKernelEmitTheoremsReady,
  kernelCheckLiveKernelEmitTheoremsSource,
  PARSE-LIVE-KERNEL-EMIT-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelEmitTheorems
  Checkable writer: just slake-typecheck-kernelemittheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelEmitTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_EMIT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-EMIT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.KernelEmitTheorems. -/
def justRecipeSlakeTypecheckKernelEmitTheorems : String :=
  "slake-typecheck-kernelemittheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelEmitTheoremsRel : String :=
  SystemsLean.HostFrontLiveKernelEmitTheorems.liveKernelEmitTheoremsRel

/-- Ready names HostFrontLiveKernelEmitTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckKernelEmitTheoremsReady,
    kernelCheckLiveKernelEmitTheoremsSource. -/
def slakeTypecheckKernelEmitTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveKernelEmitTheorems.hostFrontLiveKernelEmitTheoremsReady

/-- Honesty: this command is not lake build of KernelEmitTheorems. -/
def slakeTypecheckKernelEmitTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelEmitTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelEmitTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelEmitTheorems.lean.
    Ready is HostFrontLiveKernelEmitTheorems.hostFrontLiveKernelEmitTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelEmitTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelEmitTheorems} =="
  IO.println s!"  host={hostId} file={liveKernelEmitTheoremsRel}"
  unless (!slakeTypecheckKernelEmitTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelEmitTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelEmitTheorems.main args
