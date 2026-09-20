/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CHECKERS.
  Root for optional lean --run of live HostModuleCheckCheckers.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCheckers.
  Greppable: SystemsLean.HostFrontLiveCheckersMain,
  HostFrontLiveCheckersMain, HOST-FRONT-LIVE-CHECKERS,
  SLAKE_HOST_FRONT_LIVE_CHECKERS_V0, PARSE-LIVE-CHECKERS,
  parseLiveCheckersSource, kernelCheckLiveCheckersSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCheckersMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCheckers

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCheckers.main args
