/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-FS-DEEPEN.
  Root for optional lean --run of live MultFsDeepen.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveMultFsDeepen.
  Greppable: SystemsLean.HostFrontLiveMultFsDeepenMain,
  HostFrontLiveMultFsDeepenMain, HOST-FRONT-LIVE-MULT-FS-DEEPEN,
  SLAKE_HOST_FRONT_LIVE_MULT_FS_DEEPEN_V0,
  PARSE-LIVE-MULT-FS-DEEPEN, MULT-FS-DEEPEN,
  parseLiveMultFsDeepenSource,
  kernelCheckLiveMultFsDeepenSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultFsDeepenMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveMultFsDeepen

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultFsDeepen.main args
