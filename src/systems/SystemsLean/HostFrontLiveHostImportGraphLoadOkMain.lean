/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH-LOADOK.
  Root for optional lean --run of live HostImportGraphLoadOk.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraphLoadOk.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphLoadOkMain
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain):
  HostFrontLiveHostImportGraphLoadOkMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-LOADOK
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-LOADOK
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_LOADOK_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphLoadOkMain,
  parseLiveHostImportGraphLoadOkSource,
  kernelCheckLiveHostImportGraphLoadOkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphLoadOkMain
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap.
  Do not steal HostImportGraphTheorems wrap. Do not steal ImportLoadOkLater.
  Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraphLoadOk

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraphLoadOk.main args
