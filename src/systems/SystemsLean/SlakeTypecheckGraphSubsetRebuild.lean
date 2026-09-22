/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.GraphSubsetRebuild.
  Short role: named driver for the closed GraphSubsetRebuild check.
  Ready is HostFrontLiveGraphSubsetRebuild parse plus HostKernel.kernelCheck
  of live GraphSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.GraphSubsetRebuild.
  liveRel is GraphSubsetRebuild.lean.
  This wrap is GraphSubsetRebuild.lean. It is not GraphSubsetRebuildMain.lean.
  It is not Linear.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-REBUILD,
  SLAKE_TYPECHECK_GRAPH_SUBSET_REBUILD, slake-typecheck-graphsubsetrebuild,
  slakeTypecheckGraphSubsetRebuildReady,
  kernelCheckLiveGraphSubsetRebuildSource,
  PARSE-LIVE-GRAPH-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckGraphSubsetRebuild
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveGraphSubsetRebuild

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-REBUILD"

/-- Named check. Not lake build SystemsLean.GraphSubsetRebuild. -/
def justRecipeSlakeTypecheckGraphSubsetRebuild : String :=
  "slake-typecheck-graphsubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveGraphSubsetRebuild.liveGraphSubsetRebuildRel

/-- Ready names HostFrontLiveGraphSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckGraphSubsetRebuildReady,
    kernelCheckLiveGraphSubsetRebuildSource. -/
def slakeTypecheckGraphSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveGraphSubsetRebuild.hostFrontLiveGraphSubsetRebuildReady

/-- Honesty: this command is not lake build of GraphSubsetRebuild. -/
def slakeTypecheckGraphSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckGraphSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live GraphSubsetRebuild.lean.
    Ready is HostFrontLiveGraphSubsetRebuild.hostFrontLiveGraphSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveGraphSubsetRebuild.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraphSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveGraphSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveGraphSubsetRebuildRel}"
  unless (!slakeTypecheckGraphSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckGraphSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGraphSubsetRebuild.main args
