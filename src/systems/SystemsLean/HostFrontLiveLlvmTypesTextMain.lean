/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-TYPES-TEXT.
  Root for optional lean --run of live LlvmTypesText.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmTypesText.
  Greppable: SystemsLean.HostFrontLiveLlvmTypesTextMain,
  HostFrontLiveLlvmTypesTextMain, HOST-FRONT-LIVE-LLVM-TYPES-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_TEXT_V0,
  PARSE-LIVE-LLVM-TYPES-TEXT,
  parseLiveLlvmTypesTextSource,
  kernelCheckLiveLlvmTypesTextSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmTypesTextMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmTypesText

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmTypesText.main args
