/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-JOINMAP.
  Root for optional lean --run of live JoinMap.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveJoinMap.
  Greppable: SystemsLean.HostFrontLiveJoinMapMain,
  HostFrontLiveJoinMapMain, HOST-FRONT-LIVE-JOINMAP,
  SLAKE_HOST_FRONT_LIVE_JOINMAP_V0, PARSE-LIVE-JOINMAP,
  parseLiveJoinMapSource, kernelCheckLiveJoinMapSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveJoinMapMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveJoinMap

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveJoinMap.main args
