/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-USECHECK.
  Root for optional lean --run of live UseCheck.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveUseCheck.
  Greppable: SystemsLean.HostFrontLiveUseCheckMain, HostFrontLiveUseCheckMain,
  HOST-FRONT-LIVE-USECHECK, SLAKE_HOST_FRONT_LIVE_USECHECK_V0, PARSE-LIVE-USECHECK,
  parseLiveUseCheckSource, kernelCheckLiveUseCheckSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveUseCheckMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveUseCheck

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveUseCheck.main args
