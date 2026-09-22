/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-GRAPH-MAIN.
  Root for optional lean --run of live HostGraphMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostGraphMain.
  Unique needles (trailing newline so HostFrontLiveHostGraphMain is not a prefix):
  HostFrontLiveHostGraphMainMain
  PARSE-LIVE-HOST-GRAPH-MAIN
  HOST-FRONT-LIVE-HOST-GRAPH-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveHostGraphMainMain,
  parseLiveHostGraphMainSource,
  kernelCheckLiveHostGraphMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostGraphMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostGraphMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostGraphMain.main args
