/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-ERASURE-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live ErasureSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveErasureSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveErasureSubsetEmitMain is not a prefix):
  HostFrontLiveErasureSubsetEmitMainMain
  PARSE-LIVE-ERASURE-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-ERASURE-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_ERASURE_SUBSET_EMIT_MAIN_V0
  ERASURE-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveErasureSubsetEmitMainMain,
  parseLiveErasureSubsetEmitMainSource,
  kernelCheckLiveErasureSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveErasureSubsetEmitMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveErasureSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveErasureSubsetEmitMain.main args
