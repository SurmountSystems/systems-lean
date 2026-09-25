/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-UNIT-DF.
  Root for optional lean --run of live LlvmCfgUnitDf.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgUnitDf.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgUnitDfMain,
  HostFrontLiveLlvmCfgUnitDfMain, HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_UNIT_DF_V0,
  PARSE-LIVE-LLVM-CFG-UNIT-DF,
  parseLiveLlvmCfgUnitDfSource,
  kernelCheckLiveLlvmCfgUnitDfSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgUnitDfMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgUnitDf

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgUnitDf.main args
