/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CHECKERS-LATER.
  Root for optional lean --run of live HostModuleCheckCheckersLater.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCheckersLater.
  Greppable: SystemsLean.HostFrontLiveCheckersLaterMain,
  HostFrontLiveCheckersLaterMain, HOST-FRONT-LIVE-CHECKERS-LATER,
  SLAKE_HOST_FRONT_LIVE_CHECKERS_LATER_V0, PARSE-LIVE-CHECKERS-LATER,
  parseLiveCheckersLaterSource, kernelCheckLiveCheckersLaterSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCheckersLaterMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCheckersLater

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCheckersLater.main args
