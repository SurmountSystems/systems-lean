/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH.
  Root for optional lean --run of live HostImportGraph.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraph.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphParserMain
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain):
  HostFrontLiveHostImportGraphParserMain
  PARSE-LIVE-HOST-IMPORT-GRAPH
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphParserMain,
  parseLiveHostImportGraphSource,
  kernelCheckLiveHostImportGraphSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphParserMain
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not invent HostFrontLiveImportGraph.lean.
  Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraph

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraph.main args
