/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT.
  Root for optional lean --run of live Mult.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMult.
  Greppable: SystemsLean.HostFrontLiveMultMain, HostFrontLiveMultMain,
  HOST-FRONT-LIVE-MULT, SLAKE_HOST_FRONT_LIVE_MULT_V0, PARSE-LIVE-MULT,
  parseLiveMultSource, kernelCheckLiveMultSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMult

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMult.main args
