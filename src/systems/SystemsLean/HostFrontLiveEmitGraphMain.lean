/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-GRAPH.
  Root for optional lean --run of live EmitGraph.lean parse plus
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitGraph.
  Unique needles (trailing newline so a longer name is not a prefix hit):
  HostFrontLiveEmitGraphMain
  PARSE-LIVE-EMIT-GRAPH
  HOST-FRONT-LIVE-EMIT-GRAPH
  SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_V0
  EmitGraph.lean
  Greppable: SystemsLean.HostFrontLiveEmitGraphMain,
  parseLiveEmitGraphSource,
  kernelCheckLiveEmitGraphSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitGraphMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Mill stays 69 of 69.
  Not FullHost. slakeOwnsPackageTypecheck stays false. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveEmitGraph

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitGraph.main args
