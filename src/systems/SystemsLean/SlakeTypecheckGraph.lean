/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostGraph.
  Short role: named driver for just slake-typecheck-graph.
  Ready is HostFrontLiveGraph parse plus HostKernel.kernelCheck of live
  HostGraph.lean, not := true, not lake build SystemsLean.HostGraph.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-GRAPH,
  SLAKE_TYPECHECK_GRAPH_V0, slake-typecheck-graph, slakeTypecheckGraphReady,
  kernelCheckLiveHostGraphSource, PARSE-LIVE-HOST-GRAPH, SKELETON.
  Module: SystemsLean.SlakeTypecheckGraph
  Checkable writer: just slake-typecheck-graph (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveGraph

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH"

/-- Named just recipe. Not lake build SystemsLean.HostGraph. -/
def justRecipeSlakeTypecheckGraph : String := "slake-typecheck-graph"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostGraphRel : String := SystemsLean.HostFrontLiveGraph.liveHostGraphRel

/-- Ready names HostFrontLiveGraph parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckGraphReady, kernelCheckLiveHostGraphSource. -/
def slakeTypecheckGraphReady : Bool :=
  SystemsLean.HostFrontLiveGraph.hostFrontLiveGraphReady

/-- Honesty: this command is not lake build of HostGraph. -/
def slakeTypecheckGraphDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostGraph.lean.
    Ready is HostFrontLiveGraph.hostFrontLiveGraphReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveGraph.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraph} =="
  IO.println s!"  host={hostId} file={liveHostGraphRel}"
  unless (!slakeTypecheckGraphFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGraph.main args
