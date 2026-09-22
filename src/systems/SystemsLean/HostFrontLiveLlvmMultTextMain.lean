/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-MULT-TEXT.
  Root for optional lean --run of live LlvmMultText.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmMultText.
  Greppable: SystemsLean.HostFrontLiveLlvmMultTextMain,
  HostFrontLiveLlvmMultTextMain, HOST-FRONT-LIVE-LLVM-MULT-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_MULT_TEXT_V0,
  PARSE-LIVE-LLVM-MULT-TEXT, LLVM-MULT-TEXT-THEOREM,
  parseLiveLlvmMultTextSource,
  kernelCheckLiveLlvmMultTextSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmMultTextMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmMultText

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmMultText.main args
