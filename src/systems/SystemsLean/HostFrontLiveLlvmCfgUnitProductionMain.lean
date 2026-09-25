/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION.
  Root for optional lean --run of live LlvmCfgUnitProduction.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgUnitProduction.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgUnitProductionMain,
  HostFrontLiveLlvmCfgUnitProductionMain,
  HOST-FRONT-LIVE-LLVM-CFG-UNIT-PRODUCTION,
  LLVM-CFG-UNIT-PRODUCTION,
  PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION,
  parseLiveLlvmCfgUnitProductionSource,
  kernelCheckLiveLlvmCfgUnitProductionSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgUnitProductionMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgUnitProduction

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgUnitProduction.main args
