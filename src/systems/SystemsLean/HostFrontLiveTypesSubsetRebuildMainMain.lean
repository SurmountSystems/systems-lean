/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-TYPES-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live TypesSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveTypesSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveTypesSubsetRebuildMain is not a prefix):
  HostFrontLiveTypesSubsetRebuildMainMain
  PARSE-LIVE-TYPES-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-TYPES-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_TYPES_SUBSET_REBUILD_MAIN_V0
  TYPES-SUBSET-REBUILD-MAIN
  HOST-TYPES-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveTypesSubsetRebuildMainMain,
  parseLiveTypesSubsetRebuildMainSource,
  kernelCheckLiveTypesSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveTypesSubsetRebuildMainMain
  Not mill 35 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not TypesSubsetEmitMain. Do not steal HostFrontLiveTypesMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveTypesSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveTypesSubsetRebuildMain.main args
