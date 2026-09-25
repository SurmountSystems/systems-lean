/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-PROGRAM-TEXT.
  Root for optional lean --run of live LlvmProgramText.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmProgramText.
  Greppable: SystemsLean.HostFrontLiveLlvmProgramTextMain,
  HostFrontLiveLlvmProgramTextMain, HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_TEXT_V0,
  PARSE-LIVE-LLVM-PROGRAM-TEXT,
  parseLiveLlvmProgramTextSource,
  kernelCheckLiveLlvmProgramTextSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmProgramTextMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmProgramText

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmProgramText.main args
