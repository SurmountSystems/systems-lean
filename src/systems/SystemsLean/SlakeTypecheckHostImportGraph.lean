/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraph.
  Short role: named driver for just slake-typecheck-hostimportgraph.
  Ready is HostFrontLiveHostImportGraph parse plus HostKernel.kernelCheck
  of live HostImportGraph.lean, not := true, not lake build
  SystemsLean.HostImportGraph.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not invent HostFrontLiveImportGraph.lean.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraph is not a
  prefix of mill wrap SlakeTypecheckHostImportGraphMain):
  SlakeTypecheckHostImportGraph
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH
  slake-typecheck-hostimportgraph
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraph,
  slakeTypecheckHostImportGraphReady,
  kernelCheckLiveHostImportGraphSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraph
  Checkable writer: just slake-typecheck-hostimportgraph
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraph

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraph. -/
def justRecipeSlakeTypecheckHostImportGraph : String :=
  "slake-typecheck-hostimportgraph"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphRel : String :=
  SystemsLean.HostFrontLiveHostImportGraph.liveHostImportGraphRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraph.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraph.liveRel

/-- Ready names HostFrontLiveHostImportGraph parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphReady,
    kernelCheckLiveHostImportGraphSource. -/
def slakeTypecheckHostImportGraphReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraph.hostFrontLiveHostImportGraphReady

/-- Honesty: this command is not lake build of HostImportGraph. -/
def slakeTypecheckHostImportGraphDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraph.lean.
    Ready is HostFrontLiveHostImportGraph.hostFrontLiveHostImportGraphReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraph.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraph} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraph.main args
