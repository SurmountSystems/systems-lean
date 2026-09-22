/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS.
  Root for optional lean --run of live CapableComposeTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableComposeTheorems.
  This wrap is CapableComposeTheorems.lean. It is not CapableCompose.lean.
  Greppable: SystemsLean.HostFrontLiveCapableComposeTheoremsMain,
  HostFrontLiveCapableComposeTheoremsMain, HOST-FRONT-LIVE-CAPABLE-COMPOSE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS, COMPOSE-THEOREM,
  parseLiveCapableComposeTheoremsSource,
  kernelCheckLiveCapableComposeTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableComposeTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableComposeTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableComposeTheorems.main args
