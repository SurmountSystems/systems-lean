/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EXTRACT-SUBSET-REBUILD-MAIN.
  Root for optional lean --run of live ExtractSubsetRebuildMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveExtractSubsetRebuildMain.
  Unique needles (trailing newline so HostFrontLiveExtractSubsetRebuildMain is not a prefix):
  HostFrontLiveExtractSubsetRebuildMainMain
  PARSE-LIVE-EXTRACT-SUBSET-REBUILD-MAIN
  HOST-FRONT-LIVE-EXTRACT-SUBSET-REBUILD-MAIN
  SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_REBUILD_MAIN_V0
  EXTRACT-SUBSET-REBUILD-MAIN
  HOST-EXTRACT-SUBSET-REBUILD-MAIN
  Greppable: SystemsLean.HostFrontLiveExtractSubsetRebuildMainMain,
  parseLiveExtractSubsetRebuildMainSource,
  kernelCheckLiveExtractSubsetRebuildMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveExtractSubsetRebuildMainMain
  Not mill remill (just twenty-sixth-host-tool / inventory table row 39).
  Mill stays 69 of 69. Occupancy 49. Not occupancy name 50. Not FullHost.
  This wrap parses ExtractSubsetRebuildMain.lean only. Do not wrap ExtractSubsetRebuild.lean.
  This wrap is not ExtractSubsetEmitMain. Do not steal HostFrontLiveExtractMain.
  Do not steal HostFrontLiveExtract. Not Linear. Not ComposeSubsetEmit. Not IrGraph.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveExtractSubsetRebuildMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveExtractSubsetRebuildMain.main args
