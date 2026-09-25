/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-CFG-FIXTURE.
  Root for optional lean --run of live LlvmCfgFixture.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmCfgFixture.
  Greppable: SystemsLean.HostFrontLiveLlvmCfgFixtureMain,
  HostFrontLiveLlvmCfgFixtureMain, HOST-FRONT-LIVE-LLVM-CFG-FIXTURE,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_FIXTURE_V0,
  PARSE-LIVE-LLVM-CFG-FIXTURE, LLVM-CFG-FIXTURE,
  parseLiveLlvmCfgFixtureSource,
  kernelCheckLiveLlvmCfgFixtureSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmCfgFixtureMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmCfgFixture

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmCfgFixture.main args
