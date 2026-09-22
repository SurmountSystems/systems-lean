/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH-SEEDS.
  Root for optional lean --run of live HostImportGraphSeeds.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraphSeeds.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphSeedsMain
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain):
  HostFrontLiveHostImportGraphSeedsMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-SEEDS
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-SEEDS
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_SEEDS_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphSeedsMain,
  parseLiveHostImportGraphSeedsSource,
  kernelCheckLiveHostImportGraphSeedsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphSeedsMain
  Mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraphSeeds

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraphSeeds.main args
