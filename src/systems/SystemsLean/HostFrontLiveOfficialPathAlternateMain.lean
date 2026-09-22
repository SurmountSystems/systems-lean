/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OFFICIAL-PATH-ALTERNATE.
  Root for optional lean --run of live OfficialPathAlternate.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveOfficialPathAlternate.
  Greppable: SystemsLean.HostFrontLiveOfficialPathAlternateMain,
  HostFrontLiveOfficialPathAlternateMain, HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE,
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_V0,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE, OFFICIAL-PATH-ALTERNATE-THEOREM,
  parseLiveOfficialPathAlternateSource,
  kernelCheckLiveOfficialPathAlternateSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternateMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveOfficialPathAlternate

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOfficialPathAlternate.main args
