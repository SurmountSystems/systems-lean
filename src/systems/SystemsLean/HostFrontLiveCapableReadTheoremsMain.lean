/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-READ-THEOREMS.
  Root for optional lean --run of live CapableReadTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableReadTheorems.
  Greppable: SystemsLean.HostFrontLiveCapableReadTheoremsMain,
  HostFrontLiveCapableReadTheoremsMain, HOST-FRONT-LIVE-CAPABLE-READ-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-READ-THEOREMS, READ-THEOREM,
  parseLiveCapableReadTheoremsSource,
  kernelCheckLiveCapableReadTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableReadTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableReadTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableReadTheorems.main args
