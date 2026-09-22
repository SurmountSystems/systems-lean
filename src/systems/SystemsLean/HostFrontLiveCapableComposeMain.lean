/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-COMPOSE.
  Root for optional lean --run of live CapableCompose.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveCapableCompose.
  Greppable: SystemsLean.HostFrontLiveCapableComposeMain,
  HostFrontLiveCapableComposeMain, HOST-FRONT-LIVE-CAPABLE-COMPOSE,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_V0,
  PARSE-LIVE-CAPABLE-COMPOSE, COMPOSE-THEOREM,
  parseLiveCapableComposeSource,
  kernelCheckLiveCapableComposeSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableComposeMain
  Not FullHost. FullBackend stays false.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableCompose

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableCompose.main args
