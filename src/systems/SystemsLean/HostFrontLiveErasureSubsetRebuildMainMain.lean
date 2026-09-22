/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-ERASURE-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live ErasureSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveErasureSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveErasureSubsetRebuildMain is not a prefix):
  HostFrontLiveErasureSubsetRebuildMainMain
  PARSE-LIVE-ERASURE-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-ERASURE-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_ERASURE_SUBSET_REBUILD_MAIN_V0
  ERASURE-SUBSET-REBUILD-MAIN
  HOST-ERASURE-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveErasureSubsetRebuildMainMain,
  parseLiveErasureSubsetRebuildMainSource,
  kernelCheckLiveErasureSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveErasureSubsetRebuildMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not ErasureSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  This wrap is not HostFrontLiveErasure. Do not steal HostFrontLiveErasureMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveErasureSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveErasureSubsetRebuildMain.main args
