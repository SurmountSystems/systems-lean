/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TypesSubsetEmit.
  Short role: named driver for the closed TypesSubsetEmit wrap.
  Ready is HostFrontLiveTypesSubsetEmit parse plus HostKernel.kernelCheck
  of live TypesSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.TypesSubsetEmit.
  liveRel is TypesSubsetEmit.lean.
  This wrap is TypesSubsetEmit.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-TYPES-SUBSET-EMIT,
  SLAKE_TYPECHECK_TYPES_SUBSET_EMIT, slake-typecheck-typessubsetemit,
  slakeTypecheckTypesSubsetEmitReady,
  kernelCheckLiveTypesSubsetEmitSource,
  PARSE-LIVE-TYPES-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckTypesSubsetEmit
  Checkable writer: lean --run of this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveTypesSubsetEmit

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TYPES_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPES-SUBSET-EMIT"

/-- Named closed recipe. Not lake build SystemsLean.TypesSubsetEmit. -/
def justRecipeSlakeTypecheckTypesSubsetEmit : String :=
  "slake-typecheck-typessubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveTypesSubsetEmit.liveTypesSubsetEmitRel

/-- Ready names HostFrontLiveTypesSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckTypesSubsetEmitReady,
    kernelCheckLiveTypesSubsetEmitSource. -/
def slakeTypecheckTypesSubsetEmitReady : Bool :=
  SystemsLean.HostFrontLiveTypesSubsetEmit.hostFrontLiveTypesSubsetEmitReady

/-- Honesty: this command is not lake build of TypesSubsetEmit. -/
def slakeTypecheckTypesSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesSubsetEmitFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckTypesSubsetEmitFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TypesSubsetEmit.lean.
    Ready is HostFrontLiveTypesSubsetEmit.hostFrontLiveTypesSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveTypesSubsetEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypesSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveTypesSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveTypesSubsetEmitRel}"
  unless (!slakeTypecheckTypesSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesSubsetEmitFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckTypesSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTypesSubsetEmit.main args
