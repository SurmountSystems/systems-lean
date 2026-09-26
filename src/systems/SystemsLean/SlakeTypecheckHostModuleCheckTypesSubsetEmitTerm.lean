/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckTypesSubsetEmitTerm.
  Short role: named driver for the HostModuleCheckTypesSubsetEmitTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckTypesSubsetEmitTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm.
  liveRel is HostModuleCheckTypesSubsetEmitTerm.lean.
  This wrap is HostModuleCheckTypesSubsetEmitTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_SUBSET_EMIT_TERM,
  slake-typecheck-hostmodulechecktypessubsetemitterm,
  slakeTypecheckHostModuleCheckTypesSubsetEmitTermReady,
  kernelCheckLiveHostModuleCheckTypesSubsetEmitTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTypesSubsetEmitTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckTypesSubsetEmitTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_TYPES_SUBSET_EMIT_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-TYPES-SUBSET-EMIT-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckTypesSubsetEmitTerm : String :=
  "slake-typecheck-hostmodulechecktypessubsetemitterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckTypesSubsetEmitTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource.liveHostModuleCheckTypesSubsetEmitTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTypesSubsetEmitTermReady. -/
def slakeTypecheckHostModuleCheckTypesSubsetEmitTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource.hostFrontLiveHostModuleCheckTypesSubsetEmitTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckTypesSubsetEmitTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTypesSubsetEmitTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckTypesSubsetEmitTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTypesSubsetEmitTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckTypesSubsetEmitTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTypesSubsetEmitTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesSubsetEmitTermRel}"
  unless (!slakeTypecheckHostModuleCheckTypesSubsetEmitTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesSubsetEmitTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesSubsetEmitTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetEmitTermSource.main args
