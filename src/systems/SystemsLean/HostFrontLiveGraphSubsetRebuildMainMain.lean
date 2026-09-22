/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-GRAPH-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live GraphSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveGraphSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveGraphSubsetRebuildMain is not a prefix):
  HostFrontLiveGraphSubsetRebuildMainMain
  PARSE-LIVE-GRAPH-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-GRAPH-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_GRAPH_SUBSET_REBUILD_MAIN_V0
  GRAPH-SUBSET-REBUILD-MAIN
  HOST-GRAPH-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveGraphSubsetRebuildMainMain,
  parseLiveGraphSubsetRebuildMainSource,
  kernelCheckLiveGraphSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveGraphSubsetRebuildMainMain
  Not mill 33 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveGraphSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveGraphSubsetRebuildMain.main args
