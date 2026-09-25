/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelMultTheorems.
  Short role: named driver for just slake-typecheck-kernelmulttheorems.
  Ready is HostFrontLiveKernelMultTheorems parse plus HostKernel.kernelCheck
  of live KernelMultTheorems.lean, not := true, not lake build
  SystemsLean.KernelMultTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-MULT-THEOREMS,
  SLAKE_TYPECHECK_KERNEL_MULT_THEOREMS_V0, slake-typecheck-kernelmulttheorems,
  slakeTypecheckKernelMultTheoremsReady,
  kernelCheckLiveKernelMultTheoremsSource,
  PARSE-LIVE-KERNEL-MULT-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelMultTheorems
  Checkable writer: just slake-typecheck-kernelmulttheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelMultTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_MULT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-MULT-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.KernelMultTheorems. -/
def justRecipeSlakeTypecheckKernelMultTheorems : String :=
  "slake-typecheck-kernelmulttheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelMultTheoremsRel : String :=
  SystemsLean.HostFrontLiveKernelMultTheorems.liveKernelMultTheoremsRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveKernelMultTheorems.liveRel

/-- Ready names HostFrontLiveKernelMultTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckKernelMultTheoremsReady,
    kernelCheckLiveKernelMultTheoremsSource. -/
def slakeTypecheckKernelMultTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveKernelMultTheorems.hostFrontLiveKernelMultTheoremsReady

/-- Honesty: this command is not lake build of KernelMultTheorems. -/
def slakeTypecheckKernelMultTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelMultTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelMultTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelMultTheorems.lean.
    Ready is HostFrontLiveKernelMultTheorems.hostFrontLiveKernelMultTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelMultTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelMultTheorems} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveKernelMultTheoremsRel}"
  unless (liveRel == "KernelMultTheorems.lean") do
    IO.eprintln "error: liveRel must be KernelMultTheorems.lean"
    return 1
  unless (!slakeTypecheckKernelMultTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelMultTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelMultTheorems.main args
