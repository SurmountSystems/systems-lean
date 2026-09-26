/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckGraphSubsetRebuildTerm.
  Short role: named driver for the HostModuleCheckGraphSubsetRebuildTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckGraphSubsetRebuildTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm.
  liveRel is HostModuleCheckGraphSubsetRebuildTerm.lean.
  This wrap is HostModuleCheckGraphSubsetRebuildTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_GRAPH_SUBSET_REBUILD_TERM,
  slake-typecheck-hostmodulecheckgraphsubsetrebuildterm,
  slakeTypecheckHostModuleCheckGraphSubsetRebuildTermReady,
  kernelCheckLiveHostModuleCheckGraphSubsetRebuildTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckGraphSubsetRebuildTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckGraphSubsetRebuildTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_GRAPH_SUBSET_REBUILD_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-GRAPH-SUBSET-REBUILD-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckGraphSubsetRebuildTerm : String :=
  "slake-typecheck-hostmodulecheckgraphsubsetrebuildterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckGraphSubsetRebuildTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource.liveHostModuleCheckGraphSubsetRebuildTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckGraphSubsetRebuildTermReady. -/
def slakeTypecheckHostModuleCheckGraphSubsetRebuildTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource.hostFrontLiveHostModuleCheckGraphSubsetRebuildTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckGraphSubsetRebuildTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckGraphSubsetRebuildTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckGraphSubsetRebuildTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckGraphSubsetRebuildTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckGraphSubsetRebuildTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckGraphSubsetRebuildTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckGraphSubsetRebuildTermRel}"
  unless (!slakeTypecheckHostModuleCheckGraphSubsetRebuildTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckGraphSubsetRebuildTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckGraphSubsetRebuildTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckGraphSubsetRebuildTermSource.main args
