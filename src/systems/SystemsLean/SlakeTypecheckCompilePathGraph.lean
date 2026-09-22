/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CompilePathGraph.
  Short role: named driver for just slake-typecheck-compilepathgraph.
  Ready is HostFrontLiveCompilePathGraph parse plus HostKernel.kernelCheck
  of live CompilePathGraph.lean, not := true, not lake build
  SystemsLean.CompilePathGraph.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so CompilePathGraph drivers are not prefix hits):
  SlakeTypecheckCompilePathGraph
  HOST-SLAKE-TYPECHECK-COMPILE-PATH-GRAPH
  SLAKE_TYPECHECK_COMPILE_PATH_GRAPH_V0
  PARSE-LIVE-COMPILE-PATH-GRAPH
  COMPILE-PATH-GRAPH
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-compilepathgraph,
  slakeTypecheckCompilePathGraphReady,
  kernelCheckLiveCompilePathGraphSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckCompilePathGraph
  Checkable writer: just slake-typecheck-compilepathgraph
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveCompilePathGraph

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPILE_PATH_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPILE-PATH-GRAPH"

/-- Named just recipe. Not lake build SystemsLean.CompilePathGraph. -/
def justRecipeSlakeTypecheckCompilePathGraph : String :=
  "slake-typecheck-compilepathgraph"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathGraphRel : String :=
  SystemsLean.HostFrontLiveCompilePathGraph.liveCompilePathGraphRel

/-- Ready names HostFrontLiveCompilePathGraph parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckCompilePathGraphReady,
    kernelCheckLiveCompilePathGraphSource. -/
def slakeTypecheckCompilePathGraphReady : Bool :=
  SystemsLean.HostFrontLiveCompilePathGraph.hostFrontLiveCompilePathGraphReady

/-- Honesty: this command is not lake build of CompilePathGraph. -/
def slakeTypecheckCompilePathGraphDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCompilePathGraphFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCompilePathGraphOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CompilePathGraph.lean.
    Ready is HostFrontLiveCompilePathGraph.hostFrontLiveCompilePathGraphReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveCompilePathGraph.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCompilePathGraph} =="
  IO.println s!"  host={hostId} file={liveCompilePathGraphRel}"
  unless (!slakeTypecheckCompilePathGraphFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCompilePathGraphOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCompilePathGraph.main args
