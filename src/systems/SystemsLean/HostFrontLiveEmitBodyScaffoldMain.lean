/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-HOLD.
  Root for optional lean --run of live LlvmHold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmHold.
  Greppable: SystemsLean.HostFrontLiveLlvmHoldMain,
  HostFrontLiveLlvmHoldMain, HOST-FRONT-LIVE-LLVM-HOLD,
  SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_V0,
  PARSE-LIVE-LLVM-HOLD, LLVM-HOLD-THEOREM,
  parseLiveLlvmHoldSource,
  kernelCheckLiveLlvmHoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmHoldMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmHold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmHold.main args
