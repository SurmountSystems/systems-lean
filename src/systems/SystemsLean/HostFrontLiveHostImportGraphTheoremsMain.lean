/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS.
  Root for optional lean --run of live HostImportGraphTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostImportGraphTheorems.
  Unique needles (trailing newline so HostFrontLiveHostImportGraphTheoremsMain
  is not a prefix of mill wrap HostFrontLiveHostImportGraphMain):
  HostFrontLiveHostImportGraphTheoremsMain
  PARSE-LIVE-HOST-IMPORT-GRAPH-THEOREMS
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveHostImportGraphTheoremsMain,
  parseLiveHostImportGraphTheoremsSource,
  kernelCheckLiveHostImportGraphTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostImportGraphTheoremsMain
  mill wrap HostFrontLiveHostImportGraphMain parses HostImportGraphMain.lean
  only. Do not steal it. Do not steal HostFrontLiveHostImportGraph extra wrap.
  Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostImportGraphTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostImportGraphTheorems.main args
