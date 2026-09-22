/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPILE-PATH-GRAPH.
  Root for optional lean --run of live CompilePathGraph.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCompilePathGraph.
  Unique needles (trailing newline so HostFrontLiveCompilePathGraph is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathGraphMain
  PARSE-LIVE-COMPILE-PATH-GRAPH
  HOST-FRONT-LIVE-COMPILE-PATH-GRAPH
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_GRAPH_V0
  Greppable: SystemsLean.HostFrontLiveCompilePathGraphMain,
  parseLiveCompilePathGraphSource,
  kernelCheckLiveCompilePathGraphSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCompilePathGraphMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCompilePathGraph

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCompilePathGraph.main args
