/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN.
  Root for optional lean --run of live HostImportGraphMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraphMain.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphMain is not a prefix):
  HostFrontLiveHostImportGraphMainMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-MAIN
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphMainMain,
  parseLiveHostImportGraphMainSource,
  kernelCheckLiveHostImportGraphMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraphMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraphMain.main args
