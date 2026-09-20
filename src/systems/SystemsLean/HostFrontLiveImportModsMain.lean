/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-MODS.
  Root for optional lean --run of live HostImportGraphMods.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportMods.
  Greppable: SystemsLean.HostFrontLiveImportModsMain,
  HostFrontLiveImportModsMain, HOST-FRONT-LIVE-IMPORT-MODS,
  SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_V0, PARSE-LIVE-IMPORT-MODS,
  parseLiveImportModsSource, kernelCheckLiveImportModsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportModsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportMods

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportMods.main args
