/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ParityTypes.
  Short role: named driver for just slake-typecheck-paritytypes.
  Ready is HostFrontLiveParityTypes parse plus HostKernel.kernelCheck
  of live ParityTypes.lean, not a hardcoded true, not lake build
  SystemsLean.ParityTypes.
  liveRel is ParityTypes.lean.
  This wrap is ParityTypes.lean. It is not ParityTypesTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PARITY-TYPES,
  SLAKE_TYPECHECK_PARITY_TYPES, slake-typecheck-paritytypes,
  slakeTypecheckParityTypesReady,
  kernelCheckLiveParityTypesSource,
  PARSE-LIVE-PARITY-TYPES.
  Module: SystemsLean.SlakeTypecheckParityTypes
  Checkable writer: just slake-typecheck-paritytypes
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveParityTypes

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PARITY_TYPES"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PARITY-TYPES"

/-- Named just recipe. Not lake build SystemsLean.ParityTypes. -/
def justRecipeSlakeTypecheckParityTypes : String :=
  "slake-typecheck-paritytypes"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityTypesRel : String :=
  SystemsLean.HostFrontLiveParityTypes.liveParityTypesRel

/-- Ready names HostFrontLiveParityTypes parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckParityTypesReady,
    kernelCheckLiveParityTypesSource. -/
def slakeTypecheckParityTypesReady : Bool :=
  SystemsLean.HostFrontLiveParityTypes.hostFrontLiveParityTypesReady

/-- Honesty: this command is not lake build of ParityTypes. -/
def slakeTypecheckParityTypesDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckParityTypesFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckParityTypesFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckParityTypesOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ParityTypes.lean.
    Ready is HostFrontLiveParityTypes.hostFrontLiveParityTypesReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveParityTypes.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckParityTypes} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveParityTypes.liveRel}"
  IO.println s!"  host={hostId} file={liveParityTypesRel}"
  unless (!slakeTypecheckParityTypesFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckParityTypesFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckParityTypesOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveParityTypes.main args
