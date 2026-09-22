/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-COMPOSE.
  Root for optional lean --run of live HostCompose.lean parse plus
  HostKernel.kernelCheck. Not an emit driver.
  Body lives in SystemsLean.HostFrontLiveHostCompose.
  Greppable: SystemsLean.HostFrontLiveHostComposeMain,
  HostFrontLiveHostComposeMain, HOST-FRONT-LIVE-HOST-COMPOSE,
  SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_V0,
  PARSE-LIVE-HOST-COMPOSE, HOST-COMPOSE-THEOREM,
  parseLiveHostComposeSource,
  kernelCheckLiveHostComposeSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostComposeMain
  Not FullHost. Not Lake-gone.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is HostCompose.lean. It is not HostComposeTheorems.lean.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostCompose

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostCompose.main args
