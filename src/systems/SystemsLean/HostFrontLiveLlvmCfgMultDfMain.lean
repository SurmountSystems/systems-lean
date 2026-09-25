/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-MULT-DF.
  Root for optional lean --run of live LlvmCfgMultDf.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgMultDf.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgMultDfMain,
  HostFrontLiveLlvmCfgMultDfMain, HOST-FRONT-LIVE-LLVM-CFG-MULT-DF,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_MULT_DF_V0,
  PARSE-LIVE-LLVM-CFG-MULT-DF, LLVM-CFG-MULT-DF,
  parseLiveLlvmCfgMultDfSource,
  kernelCheckLiveLlvmCfgMultDfSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgMultDfMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgMultDf

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgMultDf.main args
