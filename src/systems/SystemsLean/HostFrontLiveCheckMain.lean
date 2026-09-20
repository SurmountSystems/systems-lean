/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-CHECK.
  Root for optional lean --run of live HostCheck.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCheck.
  Greppable: SystemsLean.HostFrontLiveCheckMain, HostFrontLiveCheckMain,
  HOST-FRONT-LIVE-CHECK, SLAKE_HOST_FRONT_LIVE_CHECK_V0, PARSE-LIVE-HOST-CHECK,
  parseLiveHostCheckSource, kernelCheckLiveHostCheckSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCheckMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCheck

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCheck.main args
