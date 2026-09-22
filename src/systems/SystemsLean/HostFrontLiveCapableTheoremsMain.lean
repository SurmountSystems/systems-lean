/-
  SYSTEMS_LEAN_HOST partial. Thin driver for PARSE-LIVE-CAPABLE-THEOREMS.
  Root for optional lean --run of live CapableTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableTheorems.
  Greppable: SystemsLean.HostFrontLiveCapableTheoremsMain,
  HostFrontLiveCapableTheoremsMain, HOST-FRONT-LIVE-CAPABLE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-THEOREMS, CAPABLE-GAP-THEOREM,
  parseLiveCapableTheoremsSource,
  kernelCheckLiveCapableTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableTheorems.main args
