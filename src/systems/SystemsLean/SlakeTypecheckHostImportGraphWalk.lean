/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphWalk.
  Short role: named driver for just slake-typecheck-hostimportgraphwalk.
  Ready is HostFrontLiveHostImportGraphWalk parse plus HostKernel.kernelCheck
  of live HostImportGraphWalk.lean, not := true, not lake build
  SystemsLean.HostImportGraphWalk.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Extra wrap HostFrontLiveHostImportGraph parses
  HostImportGraph.lean only. Extra wrap HostFrontLiveHostImportGraphSeeds
  parses HostImportGraphSeeds.lean only.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphWalk is not a
  prefix of mill wrap SlakeTypecheckHostImportGraphMain or extra wrap
  SlakeTypecheckHostImportGraph):
  SlakeTypecheckHostImportGraphWalk
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-WALK
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_WALK_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-WALK
  slake-typecheck-hostimportgraphwalk
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphwalk,
  slakeTypecheckHostImportGraphWalkReady,
  kernelCheckLiveHostImportGraphWalkSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphWalk
  Checkable writer: just slake-typecheck-hostimportgraphwalk
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphWalk

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_WALK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-WALK"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphWalk. -/
def justRecipeSlakeTypecheckHostImportGraphWalk : String :=
  "slake-typecheck-hostimportgraphwalk"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphWalkRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphWalk.liveHostImportGraphWalkRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphWalk.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphWalk.liveRel

/-- Ready names HostFrontLiveHostImportGraphWalk parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphWalkReady,
    kernelCheckLiveHostImportGraphWalkSource. -/
def slakeTypecheckHostImportGraphWalkReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphWalk.hostFrontLiveHostImportGraphWalkReady

/-- Honesty: this command is not lake build of HostImportGraphWalk. -/
def slakeTypecheckHostImportGraphWalkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphWalkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphWalkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphWalk.lean.
    Ready is HostFrontLiveHostImportGraphWalk.hostFrontLiveHostImportGraphWalkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphWalk.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphWalk} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphWalkRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphWalkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphWalkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphWalk.main args
