/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-GRAPH-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live GraphSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveGraphSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveGraphSubsetEmitMain is not a prefix):
  HostFrontLiveGraphSubsetEmitMainMain
  PARSE-LIVE-GRAPH-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-GRAPH-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_GRAPH_SUBSET_EMIT_MAIN_V0
  GRAPH-SUBSET-EMIT-MAIN
  HOST-GRAPH-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveGraphSubsetEmitMainMain,
  parseLiveGraphSubsetEmitMainSource,
  kernelCheckLiveGraphSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveGraphSubsetEmitMainMain
  Not mill 33 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveGraphSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveGraphSubsetEmitMain.main args
