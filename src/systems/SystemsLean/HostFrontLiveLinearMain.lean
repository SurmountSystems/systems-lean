/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR.
  Root for optional lean --run of live Linear.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not full product module emit.
  Body lives in SystemsLean.HostFrontLiveLinear.
  Greppable: SystemsLean.HostFrontLiveLinearMain,
  HostFrontLiveLinearMain, HOST-FRONT-LIVE-LINEAR,
  SLAKE_HOST_FRONT_LIVE_LINEAR_V0,
  PARSE-LIVE-LINEAR, liveRel,
  parseLiveLinearSource,
  kernelCheckLiveLinearSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearMain
  Not FullHost. FullBackend stays false. Not full product module emit.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLinear

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinear.main args
