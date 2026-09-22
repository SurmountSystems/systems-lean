/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live LinearSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveLinearSubsetRebuildMain is not a prefix):
  HostFrontLiveLinearSubsetRebuildMainMain
  PARSE-LIVE-LINEAR-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-LINEAR-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_LINEAR_SUBSET_REBUILD_MAIN_V0
  LINEAR-SUBSET-REBUILD-MAIN
  HOST-LINEAR-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveLinearSubsetRebuildMainMain,
  parseLiveLinearSubsetRebuildMainSource,
  kernelCheckLiveLinearSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearSubsetRebuildMainMain
  Not mill 33 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearSubsetRebuildMain.main args
