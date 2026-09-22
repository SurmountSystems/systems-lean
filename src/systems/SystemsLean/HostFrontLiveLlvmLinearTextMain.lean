/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-LINEAR-TEXT.
  Root for optional lean --run of live LlvmLinearText.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmLinearText.
  Greppable: SystemsLean.HostFrontLiveLlvmLinearTextMain,
  HostFrontLiveLlvmLinearTextMain, HOST-FRONT-LIVE-LLVM-LINEAR-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_TEXT_V0,
  PARSE-LIVE-LLVM-LINEAR-TEXT,
  parseLiveLlvmLinearTextSource,
  kernelCheckLiveLlvmLinearTextSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmLinearTextMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmLinearText

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmLinearText.main args
