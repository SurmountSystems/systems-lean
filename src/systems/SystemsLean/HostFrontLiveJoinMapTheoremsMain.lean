/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-JOIN-MAP-THEOREMS.
  Root for optional lean --run of live JoinMapTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveJoinMapTheorems.
  Greppable: SystemsLean.HostFrontLiveJoinMapTheoremsMain,
  HostFrontLiveJoinMapTheoremsMain, HOST-FRONT-LIVE-JOIN-MAP-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_JOIN_MAP_THEOREMS_V0,
  PARSE-LIVE-JOIN-MAP-THEOREMS,
  parseLiveJoinMapTheoremsSource,
  kernelCheckLiveJoinMapTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveJoinMapTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveJoinMapTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveJoinMapTheorems.main args
