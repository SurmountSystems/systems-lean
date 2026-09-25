/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostGraph.
  Short role: named driver for lean --run of HostGraph.lean.
  Ready is HostFrontLiveHostGraph parse plus HostKernel.kernelCheck of live
  HostGraph.lean, not := true, not lake build SystemsLean.HostGraph.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-HOST-GRAPH,
  SLAKE_TYPECHECK_HOST_GRAPH_V0, slake-typecheck-hostgraph,
  slakeTypecheckHostGraphReady, kernelCheckLiveHostGraphSource,
  PARSE-LIVE-HOST-GRAPH.
  Module: SystemsLean.SlakeTypecheckHostGraph
  Checkable writer: lean --run SlakeTypecheckHostGraph (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostGraph

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-GRAPH"

/-- Named recipe. Not lake build SystemsLean.HostGraph. -/
def justRecipeSlakeTypecheckHostGraph : String :=
  "slake-typecheck-hostgraph"

/-- Live file relative to repo root. -/
def liveHostGraphRel : String :=
  SystemsLean.HostFrontLiveHostGraph.liveHostGraphRel

/-- Ready names HostFrontLiveHostGraph parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckHostGraphReady,
    kernelCheckLiveHostGraphSource. -/
def slakeTypecheckHostGraphReady : Bool :=
  SystemsLean.HostFrontLiveHostGraph.hostFrontLiveHostGraphReady

/-- Honesty: this command is not lake build of HostGraph. -/
def slakeTypecheckHostGraphDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostGraphFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostGraphOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostGraph.lean.
    Ready is HostFrontLiveHostGraph.hostFrontLiveHostGraphReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostGraph.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostGraph} =="
  IO.println s!"  host={hostId} file={liveHostGraphRel}"
  unless (!slakeTypecheckHostGraphFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostGraphOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostGraph.main args
