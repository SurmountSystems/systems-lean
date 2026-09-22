/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.Types.
  Short role: named driver for just slake-typecheck-types.
  Ready is HostFrontLiveTypes parse plus HostKernel.kernelCheck of live
  Types.lean, not := true, not lake build SystemsLean.Types.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-TYPES,
  SLAKE_TYPECHECK_TYPES_V0, slake-typecheck-types, slakeTypecheckTypesReady,
  kernelCheckLiveTypesSource, PARSE-LIVE-TYPES, SKELETON.
  Module: SystemsLean.SlakeTypecheckTypes
  Checkable writer: just slake-typecheck-types (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveTypes

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPES"

/-- Named just recipe. Not lake build SystemsLean.Types. -/
def justRecipeSlakeTypecheckTypes : String := "slake-typecheck-types"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesRel : String := SystemsLean.HostFrontLiveTypes.liveTypesRel

/-- Ready names HostFrontLiveTypes parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckTypesReady, kernelCheckLiveTypesSource. -/
def slakeTypecheckTypesReady : Bool :=
  SystemsLean.HostFrontLiveTypes.hostFrontLiveTypesReady

/-- Honesty: this command is not lake build of Types. -/
def slakeTypecheckTypesDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live Types.lean.
    Ready is HostFrontLiveTypes.hostFrontLiveTypesReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveTypes.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypes} =="
  IO.println s!"  host={hostId} file={liveTypesRel}"
  unless (!slakeTypecheckTypesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTypes.main args
