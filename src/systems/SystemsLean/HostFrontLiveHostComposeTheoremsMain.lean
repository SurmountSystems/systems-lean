/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-COMPOSE-THEOREMS.
  Root for optional lean --run of live HostComposeTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveHostComposeTheorems.
  Greppable: SystemsLean.HostFrontLiveHostComposeTheoremsMain,
  HostFrontLiveHostComposeTheoremsMain, HOST-FRONT-LIVE-HOST-COMPOSE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_THEOREMS_V0,
  PARSE-LIVE-HOST-COMPOSE-THEOREMS, HOST-COMPOSE-THEOREM,
  parseLiveHostComposeTheoremsSource,
  kernelCheckLiveHostComposeTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostComposeTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostComposeTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostComposeTheorems.main args
