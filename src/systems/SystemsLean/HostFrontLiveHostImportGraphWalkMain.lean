/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH-WALK.
  Root for optional lean --run of live HostImportGraphWalk.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraphWalk.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphWalkMain
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain):
  HostFrontLiveHostImportGraphWalkMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-WALK
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-WALK
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_WALK_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphWalkMain,
  parseLiveHostImportGraphWalkSource,
  kernelCheckLiveHostImportGraphWalkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphWalkMain
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Extra wrap HostFrontLiveHostImportGraph parses
  HostImportGraph.lean only. Extra wrap HostFrontLiveHostImportGraphSeeds
  parses HostImportGraphSeeds.lean only.
  Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraphWalk

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraphWalk.main args
