/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-GRAPH-THEOREMS.
  Root for optional lean --run of live HostGraphTheorems.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveGraphTheorems.
  Greppable: SystemsLean.HostFrontLiveGraphTheoremsMain, HostFrontLiveGraphTheoremsMain,
  HOST-FRONT-LIVE-GRAPH-THEOREMS, SLAKE_HOST_FRONT_LIVE_GRAPH_THEOREMS_V0,
  PARSE-LIVE-GRAPH-THEOREMS, parseLiveGraphTheoremsSource,
  kernelCheckLiveGraphTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveGraphTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveGraphTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveGraphTheorems.main args
