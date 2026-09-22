/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-HONESTY.
  Root for optional lean --run of live LlvmCfgHonesty.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgHonesty.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgHonestyMain,
  HostFrontLiveLlvmCfgHonestyMain, HOST-FRONT-LIVE-LLVM-CFG-HONESTY,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_HONESTY_V0,
  PARSE-LIVE-LLVM-CFG-HONESTY, LLVM-CFG-HONESTY,
  parseLiveLlvmCfgHonestySource,
  kernelCheckLiveLlvmCfgHonestySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgHonestyMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgHonesty

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgHonesty.main args
