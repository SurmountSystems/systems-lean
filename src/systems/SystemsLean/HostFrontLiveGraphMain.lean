/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-GRAPH.
  Root for optional lean --run of live HostGraph.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveGraph.
  Greppable: SystemsLean.HostFrontLiveGraphMain, HostFrontLiveGraphMain,
  HOST-FRONT-LIVE-GRAPH, SLAKE_HOST_FRONT_LIVE_GRAPH_V0, PARSE-LIVE-HOST-GRAPH,
  parseLiveHostGraphSource, kernelCheckLiveHostGraphSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveGraphMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveGraph

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveGraph.main args
