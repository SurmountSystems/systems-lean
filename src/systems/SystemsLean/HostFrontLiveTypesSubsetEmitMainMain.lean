/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-TYPES-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live TypesSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveTypesSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveTypesSubsetEmitMain is not a prefix):
  HostFrontLiveTypesSubsetEmitMainMain
  PARSE-LIVE-TYPES-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-TYPES-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_TYPES_SUBSET_EMIT_MAIN_V0
  TYPES-SUBSET-EMIT-MAIN
  HOST-TYPES-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveTypesSubsetEmitMainMain,
  parseLiveTypesSubsetEmitMainSource,
  kernelCheckLiveTypesSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveTypesSubsetEmitMainMain
  Not mill 34 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not GraphSubsetEmitMain. Do not steal HostFrontLiveTypesMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveTypesSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveTypesSubsetEmitMain.main args
