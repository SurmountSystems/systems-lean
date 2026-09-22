/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH-DRIVER.
  Root for optional lean --run of live HostImportGraphDriver.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraphDriver.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphDriverMain
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain):
  HostFrontLiveHostImportGraphDriverMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-DRIVER
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-DRIVER
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_DRIVER_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphDriverMain,
  parseLiveHostImportGraphDriverSource,
  kernelCheckLiveHostImportGraphDriverSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphDriverMain
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap.
  Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraphDriver

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraphDriver.main args
