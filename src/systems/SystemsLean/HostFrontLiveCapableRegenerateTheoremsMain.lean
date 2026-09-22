/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS.
  Root for optional lean --run of live CapableRegenerateTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableRegenerateTheorems.
  Greppable: SystemsLean.HostFrontLiveCapableRegenerateTheoremsMain,
  HostFrontLiveCapableRegenerateTheoremsMain,
  HOST-FRONT-LIVE-CAPABLE-REGENERATE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS, REGENERATE-THEOREM,
  parseLiveCapableRegenerateTheoremsSource,
  kernelCheckLiveCapableRegenerateTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableRegenerateTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableRegenerateTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableRegenerateTheorems.main args
