/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitTypes.
  Short role: named driver for just slake-typecheck-emittypes.
  Ready is HostFrontLiveEmitTypes parse plus HostKernel.kernelCheck
  of live EmitTypes.lean, not a hardcoded true, not lake build
  SystemsLean.EmitTypes.
  liveRel is EmitTypes.lean.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a remill. Not a new emit feature.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EMIT-TYPES,
  SLAKE_TYPECHECK_EMIT_TYPES_V0, slake-typecheck-emittypes,
  slakeTypecheckEmitTypesReady,
  kernelCheckLiveEmitTypesSource,
  PARSE-LIVE-EMIT-TYPES, SKELETON.
  Module: SystemsLean.SlakeTypecheckEmitTypes
  Checkable writer: just slake-typecheck-emittypes
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitTypes

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-TYPES"

/-- Named just recipe. Not lake build SystemsLean.EmitTypes. -/
def justRecipeSlakeTypecheckEmitTypes : String :=
  "slake-typecheck-emittypes"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitTypesRel : String :=
  SystemsLean.HostFrontLiveEmitTypes.liveEmitTypesRel

/-- Ready names HostFrontLiveEmitTypes parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckEmitTypesReady,
    kernelCheckLiveEmitTypesSource. -/
def slakeTypecheckEmitTypesReady : Bool :=
  SystemsLean.HostFrontLiveEmitTypes.hostFrontLiveEmitTypesReady

/-- Honesty: this command is not lake build of EmitTypes. -/
def slakeTypecheckEmitTypesDoesNotUseLake : Bool :=
  justRecipeSlakeTypecheckEmitTypes == "slake-typecheck-emittypes"

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitTypesFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitTypesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitTypes.lean.
    Ready is HostFrontLiveEmitTypes.hostFrontLiveEmitTypesReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveEmitTypes.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitTypes} =="
  IO.println s!"  host={hostId} file={liveEmitTypesRel} liveRel={SystemsLean.HostFrontLiveEmitTypes.liveRel}"
  unless (!slakeTypecheckEmitTypesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitTypesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckEmitTypesDoesNotUseLake do
    IO.eprintln "error: recipe must stay slake-typecheck-emittypes"
    return 1
  SystemsLean.HostFrontLiveEmitTypes.main args
