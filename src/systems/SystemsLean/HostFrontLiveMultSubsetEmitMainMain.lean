/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live MultSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMultSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveMultSubsetEmitMain is not a prefix):
  HostFrontLiveMultSubsetEmitMainMain
  PARSE-LIVE-MULT-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-MULT-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_MULT_SUBSET_EMIT_MAIN_V0
  MULT-SUBSET-EMIT-MAIN
  HOST-MULT-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveMultSubsetEmitMainMain,
  parseLiveMultSubsetEmitMainSource,
  kernelCheckLiveMultSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultSubsetEmitMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMultSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultSubsetEmitMain.main args
