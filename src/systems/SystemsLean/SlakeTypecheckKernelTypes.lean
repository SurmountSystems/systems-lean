/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.KernelTypes.
  Short role: named driver for just slake-typecheck-kerneltypes.
  Ready is HostFrontLiveKernelTypes parse plus HostKernel.kernelCheck of live
  KernelTypes.lean, not := true, not lake build SystemsLean.KernelTypes.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-KERNEL-TYPES,
  SLAKE_TYPECHECK_KERNEL_TYPES_V0, slake-typecheck-kerneltypes,
  slakeTypecheckKernelTypesReady, kernelCheckLiveKernelTypesSource,
  PARSE-LIVE-KERNEL-TYPES, SKELETON.
  Module: SystemsLean.SlakeTypecheckKernelTypes
  Checkable writer: just slake-typecheck-kerneltypes (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveKernelTypes

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_KERNEL_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-KERNEL-TYPES"

/-- Named just recipe. Not lake build SystemsLean.KernelTypes. -/
def justRecipeSlakeTypecheckKernelTypes : String :=
  "slake-typecheck-kerneltypes"

/-- Live file relative to repo root. Dual-pin path. -/
def liveKernelTypesRel : String :=
  SystemsLean.HostFrontLiveKernelTypes.liveKernelTypesRel

/-- Live basename. Exact equality. No slash. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveKernelTypes.liveRel

/-- Ready names HostFrontLiveKernelTypes parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckKernelTypesReady,
    kernelCheckLiveKernelTypesSource. -/
def slakeTypecheckKernelTypesReady : Bool :=
  SystemsLean.HostFrontLiveKernelTypes.hostFrontLiveKernelTypesReady

/-- Honesty: this command is not lake build of KernelTypes. -/
def slakeTypecheckKernelTypesDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckKernelTypesFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckKernelTypesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live KernelTypes.lean.
    Ready is HostFrontLiveKernelTypes.hostFrontLiveKernelTypesReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveKernelTypes.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckKernelTypes} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveKernelTypesRel}"
  unless (liveRel == "KernelTypes.lean") do
    IO.eprintln "error: liveRel must be KernelTypes.lean"
    return 1
  unless (!slakeTypecheckKernelTypesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckKernelTypesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveKernelTypes.main args
