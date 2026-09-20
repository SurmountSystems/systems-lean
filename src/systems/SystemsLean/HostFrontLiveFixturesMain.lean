/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FIXTURES.
  Root for optional lean --run of live HostModuleCheckFixtures.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveFixtures.
  Greppable: SystemsLean.HostFrontLiveFixturesMain,
  HostFrontLiveFixturesMain, HOST-FRONT-LIVE-FIXTURES,
  SLAKE_HOST_FRONT_LIVE_FIXTURES_V0, PARSE-LIVE-FIXTURES,
  parseLiveFixturesSource, kernelCheckLiveFixturesSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFixturesMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveFixtures

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFixtures.main args
