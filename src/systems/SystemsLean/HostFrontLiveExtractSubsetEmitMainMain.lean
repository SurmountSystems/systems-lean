/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EXTRACT-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live ExtractSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveExtractSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveExtractSubsetEmitMain is not a prefix):
  HostFrontLiveExtractSubsetEmitMainMain
  PARSE-LIVE-EXTRACT-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_EXTRACT_SUBSET_EMIT_MAIN_V0
  EXTRACT-SUBSET-EMIT-MAIN
  HOST-EXTRACT-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveExtractSubsetEmitMainMain,
  parseLiveExtractSubsetEmitMainSource,
  kernelCheckLiveExtractSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveExtractSubsetEmitMainMain
  Not mill 38 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not GraphSubsetEmitMain. Do not steal HostFrontLiveExtractMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveExtractSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveExtractSubsetEmitMain.main args
