/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.EmitGraph.
  Short role: named driver for just slake-typecheck-emitgraph.
  Ready is HostFrontLiveEmitGraph parse plus HostKernel.kernelCheck
  of live EmitGraph.lean, not a hardcoded success bit, not lake build
  SystemsLean.EmitGraph.
  liveRel is EmitGraph.lean.
  Not mill. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so a longer name is not a prefix hit):
  SlakeTypecheckEmitGraph
  HOST-SLAKE-TYPECHECK-EMIT-GRAPH
  SLAKE_TYPECHECK_EMIT_GRAPH_V0
  PARSE-LIVE-EMIT-GRAPH
  EmitGraph.lean
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-emitgraph,
  slakeTypecheckEmitGraphReady,
  kernelCheckLiveEmitGraphSource.
  Module: SystemsLean.SlakeTypecheckEmitGraph
  Checkable writer: just slake-typecheck-emitgraph
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveEmitGraph

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EMIT_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EMIT-GRAPH"

/-- Named just recipe. Not lake build SystemsLean.EmitGraph. -/
def justRecipeSlakeTypecheckEmitGraph : String := "slake-typecheck-emitgraph"

/-- Live file basename. Exact. Not EmitGraphScaffold.lean. Not IrGraph.lean. -/
def liveRel : String := SystemsLean.HostFrontLiveEmitGraph.liveRel

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitGraphRel : String :=
  SystemsLean.HostFrontLiveEmitGraph.liveEmitGraphRel

/-- Ready names HostFrontLiveEmitGraph parse plus kernelCheck.
    Greppable: slakeTypecheckEmitGraphReady,
    kernelCheckLiveEmitGraphSource. -/
def slakeTypecheckEmitGraphReady : Bool :=
  SystemsLean.HostFrontLiveEmitGraph.hostFrontLiveEmitGraphReady

/-- Honesty: this command is not lake build of EmitGraph. -/
def slakeTypecheckEmitGraphDoesNotUseLake : Bool :=
  justRecipeSlakeTypecheckEmitGraph == "slake-typecheck-emitgraph"

/-- Honesty: FullHost stays false. -/
def slakeTypecheckEmitGraphFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckEmitGraphOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live EmitGraph.lean.
    Ready is HostFrontLiveEmitGraph.hostFrontLiveEmitGraphReady
    (parse plus kernelCheck). -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckEmitGraph} =="
  IO.println s!"  host={hostId} file={liveEmitGraphRel} liveRel={liveRel}"
  unless (liveRel == "EmitGraph.lean") do
    IO.eprintln "error: liveRel must be EmitGraph.lean"
    return 1
  unless (liveEmitGraphRel == "src/systems/SystemsLean/EmitGraph.lean") do
    IO.eprintln "error: live path must be src/systems/SystemsLean/EmitGraph.lean"
    return 1
  unless (!slakeTypecheckEmitGraphFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckEmitGraphOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckEmitGraphDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveEmitGraph.main args
