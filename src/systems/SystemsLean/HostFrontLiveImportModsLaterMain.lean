/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-MODS-LATER.
  Root for optional lean --run of live HostImportGraphModsLater.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportModsLater.
  Greppable: SystemsLean.HostFrontLiveImportModsLaterMain,
  HostFrontLiveImportModsLaterMain, HOST-FRONT-LIVE-IMPORT-MODS-LATER,
  SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_LATER_V0, PARSE-LIVE-IMPORT-MODS-LATER,
  parseLiveImportModsLaterSource, kernelCheckLiveImportModsLaterSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportModsLaterMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportModsLater

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportModsLater.main args
