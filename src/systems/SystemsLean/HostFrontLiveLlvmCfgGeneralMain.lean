/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-GENERAL.
  Root for optional lean --run of live LlvmCfgGeneral.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgGeneral.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgGeneralMain,
  HostFrontLiveLlvmCfgGeneralMain, HOST-FRONT-LIVE-LLVM-CFG-GENERAL,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_GENERAL_V0,
  PARSE-LIVE-LLVM-CFG-GENERAL, GENERAL-CFG-CONSTRUCTION-PARTIAL,
  parseLiveLlvmCfgGeneralSource,
  kernelCheckLiveLlvmCfgGeneralSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgGeneralMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgGeneral

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgGeneral.main args
