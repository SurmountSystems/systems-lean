/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live MultSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMultSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveMultSubsetRebuildMain is not a prefix):
  HostFrontLiveMultSubsetRebuildMainMain
  PARSE-LIVE-MULT-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-MULT-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_REBUILD_MAIN_V0
  MULT-SUBSET-REBUILD-MAIN
  HOST-MULT-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveMultSubsetRebuildMainMain,
  parseLiveMultSubsetRebuildMainSource,
  kernelCheckLiveMultSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultSubsetRebuildMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMultSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultSubsetRebuildMain.main args
