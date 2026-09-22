/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelTypesTheorems.
  Short role: named driver for just slake-typecheck-kerneltypestheorems.
  Ready is HostFrontLiveKernelTypesTheorems parse plus HostKernel.kernelCheck
  of live KernelTypesTheorems.lean, not := true, not lake build
  SystemsLean.KernelTypesTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-TYPES-THEOREMS,
  SLAKE_TYPECHECK_KERNEL_TYPES_THEOREMS_V0, slake-typecheck-kerneltypestheorems,
  slakeTypecheckKernelTypesTheoremsReady,
  kernelCheckLiveKernelTypesTheoremsSource,
  PARSE-LIVE-KERNEL-TYPES-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelTypesTheorems
  Checkable writer: just slake-typecheck-kerneltypestheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelTypesTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_TYPES_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-TYPES-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.KernelTypesTheorems. -/
def justRecipeSlakeTypecheckKernelTypesTheorems : String :=
  "slake-typecheck-kerneltypestheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelTypesTheoremsRel : String :=
  SystemsLean.HostFrontLiveKernelTypesTheorems.liveKernelTypesTheoremsRel

/-- Ready names HostFrontLiveKernelTypesTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckKernelTypesTheoremsReady,
    kernelCheckLiveKernelTypesTheoremsSource. -/
def slakeTypecheckKernelTypesTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveKernelTypesTheorems.hostFrontLiveKernelTypesTheoremsReady

/-- Honesty: this command is not lake build of KernelTypesTheorems. -/
def slakeTypecheckKernelTypesTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelTypesTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelTypesTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelTypesTheorems.lean.
    Ready is HostFrontLiveKernelTypesTheorems.hostFrontLiveKernelTypesTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelTypesTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelTypesTheorems} =="
  IO.println s!"  host={hostId} file={liveKernelTypesTheoremsRel}"
  unless (!slakeTypecheckKernelTypesTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelTypesTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelTypesTheorems.main args
