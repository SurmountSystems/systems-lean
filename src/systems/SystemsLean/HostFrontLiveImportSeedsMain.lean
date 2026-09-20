/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-SEEDS.
  Root for optional lean --run of live HostImportGraphSeeds.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportSeeds.
  Greppable: SystemsLean.HostFrontLiveImportSeedsMain,
  HostFrontLiveImportSeedsMain, HOST-FRONT-LIVE-IMPORT-SEEDS,
  SLAKE_HOST_FRONT_LIVE_IMPORT_SEEDS_V0, PARSE-LIVE-IMPORT-SEEDS,
  parseLiveImportSeedsSource, kernelCheckLiveImportSeedsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportSeedsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportSeeds

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportSeeds.main args
