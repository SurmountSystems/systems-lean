/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-WALK.
  Root for optional lean --run of live HostImportGraphWalk.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportWalk.
  Greppable: SystemsLean.HostFrontLiveImportWalkMain,
  HostFrontLiveImportWalkMain, HOST-FRONT-LIVE-IMPORT-WALK,
  SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_V0, PARSE-LIVE-IMPORT-WALK,
  parseLiveImportWalkSource, kernelCheckLiveImportWalkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportWalkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportWalk

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportWalk.main args
