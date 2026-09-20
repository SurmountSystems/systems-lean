/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-ERASURE-THEOREMS.
  Root for optional lean --run of live ErasureTheorems.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveErasureTheorems.
  Greppable: SystemsLean.HostFrontLiveErasureTheoremsMain, HostFrontLiveErasureTheoremsMain,
  HOST-FRONT-LIVE-ERASURE-THEOREMS, SLAKE_HOST_FRONT_LIVE_ERASURE_THEOREMS_V0,
  PARSE-LIVE-ERASURE-THEOREMS, parseLiveErasureTheoremsSource,
  kernelCheckLiveErasureTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveErasureTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveErasureTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveErasureTheorems.main args
