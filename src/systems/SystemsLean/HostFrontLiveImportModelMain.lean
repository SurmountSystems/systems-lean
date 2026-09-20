/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IMPORT-MODEL.
  Root for optional lean --run of live HostImportGraphModel.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveImportModel.
  Greppable: SystemsLean.HostFrontLiveImportModelMain,
  HostFrontLiveImportModelMain, HOST-FRONT-LIVE-IMPORT-MODEL,
  SLAKE_HOST_FRONT_LIVE_IMPORT_MODEL_V0, PARSE-LIVE-IMPORT-MODEL,
  parseLiveImportModelSource, kernelCheckLiveImportModelSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveImportModelMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveImportModel

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveImportModel.main args
