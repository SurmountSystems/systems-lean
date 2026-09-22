/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-LOAD.
  Root for optional lean --run of live DualEqWriteLoad.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteLoad.
  Greppable: SystemsLean.HostFrontLiveDualEqWriteLoadMain,
  HostFrontLiveDualEqWriteLoadMain, HOST-FRONT-LIVE-DUAL-EQ-WRITE-LOAD,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_LOAD_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-LOAD,
  parseLiveDualEqWriteLoadSource,
  kernelCheckLiveDualEqWriteLoadSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteLoadMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveDualEqWriteLoad

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteLoad.main args
