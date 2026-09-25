/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION.
  Root for optional lean --run of live LlvmCfgMultProduction.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgMultProduction.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgMultProductionMain,
  HostFrontLiveLlvmCfgMultProductionMain,
  HOST-FRONT-LIVE-LLVM-CFG-MULT-PRODUCTION,
  LLVM-CFG-MULT-PRODUCTION,
  PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION,
  parseLiveLlvmCfgMultProductionSource,
  kernelCheckLiveLlvmCfgMultProductionSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgMultProductionMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgMultProduction

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgMultProduction.main args
