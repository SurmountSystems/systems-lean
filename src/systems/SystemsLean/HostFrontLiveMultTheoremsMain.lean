/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-THEOREMS.
  Root for optional lean --run of live MultTheorems.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMultTheorems.
  Greppable: SystemsLean.HostFrontLiveMultTheoremsMain, HostFrontLiveMultTheoremsMain,
  HOST-FRONT-LIVE-MULT-THEOREMS, SLAKE_HOST_FRONT_LIVE_MULT_THEOREMS_V0,
  PARSE-LIVE-MULT-THEOREMS, parseLiveMultTheoremsSource,
  kernelCheckLiveMultTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMultTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultTheorems.main args
