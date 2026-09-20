/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-WALK-LATER.
  Root for optional lean --run of live HostImportGraphWalkLater.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportWalkLater.
  Greppable: SystemsLean.HostFrontLiveImportWalkLaterMain,
  HostFrontLiveImportWalkLaterMain, HOST-FRONT-LIVE-IMPORT-WALK-LATER,
  SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_LATER_V0, PARSE-LIVE-IMPORT-WALK-LATER,
  parseLiveImportWalkLaterSource, kernelCheckLiveImportWalkLaterSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportWalkLaterMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportWalkLater

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportWalkLater.main args
