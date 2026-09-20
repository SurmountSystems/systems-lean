/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-LOADOKLATER.
  Root for optional lean --run of live HostImportGraphLoadOkLater.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportLoadOkLater.
  Greppable: SystemsLean.HostFrontLiveImportLoadOkLaterMain,
  HostFrontLiveImportLoadOkLaterMain, HOST-FRONT-LIVE-IMPORT-LOADOKLATER,
  SLAKE_HOST_FRONT_LIVE_IMPORT_LOADOKLATER_V0, PARSE-LIVE-IMPORT-LOADOKLATER,
  parseLiveImportLoadOkLaterSource, kernelCheckLiveImportLoadOkLaterSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportLoadOkLaterMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportLoadOkLater

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportLoadOkLater.main args
