/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS.
  Root for optional lean --run of live OfficialPathAlternateTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveOfficialPathAlternateTheorems.
  Greppable: SystemsLean.HostFrontLiveOfficialPathAlternateTheoremsMain,
  HostFrontLiveOfficialPathAlternateTheoremsMain,
  HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_THEOREMS_V0,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS,
  OFFICIAL-PATH-ALTERNATE-THEOREM,
  parseLiveOfficialPathAlternateTheoremsSource,
  kernelCheckLiveOfficialPathAlternateTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternateTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveOfficialPathAlternateTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOfficialPathAlternateTheorems.main args
