/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-WRITE-HC-LOAD.
  Root for optional lean --run of live CapableWriteHcLoad.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableWriteHcLoad.
  Greppable: SystemsLean.HostFrontLiveCapableWriteHcLoadMain,
  HostFrontLiveCapableWriteHcLoadMain, HOST-FRONT-LIVE-CAPABLE-WRITE-HC-LOAD,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_LOAD_V0,
  PARSE-LIVE-CAPABLE-WRITE-HC-LOAD, DUAL-SSOT-EQUALITY,
  parseLiveCapableWriteHcLoadSource,
  kernelCheckLiveCapableWriteHcLoadSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableWriteHcLoadMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableWriteHcLoad

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableWriteHcLoad.main args
