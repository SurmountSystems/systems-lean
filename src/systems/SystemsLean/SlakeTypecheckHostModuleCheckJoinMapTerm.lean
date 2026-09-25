/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckJoinMapTerm.
  Short role: named driver for the HostModuleCheckJoinMapTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckJoinMapTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckJoinMapTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckJoinMapTerm.
  liveRel is HostModuleCheckJoinMapTerm.lean.
  This wrap is HostModuleCheckJoinMapTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-JOIN-MAP-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_JOIN_MAP_TERM,
  slake-typecheck-hostmodulecheckjoinmapterm,
  slakeTypecheckHostModuleCheckJoinMapTermReady,
  kernelCheckLiveHostModuleCheckJoinMapTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-JOIN-MAP-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckJoinMapTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckJoinMapTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckJoinMapTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_JOIN_MAP_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-JOIN-MAP-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckJoinMapTerm : String :=
  "slake-typecheck-hostmodulecheckjoinmapterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckJoinMapTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckJoinMapTermSource.liveHostModuleCheckJoinMapTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckJoinMapTermReady. -/
def slakeTypecheckHostModuleCheckJoinMapTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckJoinMapTermSource.hostFrontLiveHostModuleCheckJoinMapTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckJoinMapTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckJoinMapTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckJoinMapTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckJoinMapTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckJoinMapTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckJoinMapTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckJoinMapTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckJoinMapTermRel}"
  unless (!slakeTypecheckHostModuleCheckJoinMapTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckJoinMapTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckJoinMapTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckJoinMapTermSource.main args
