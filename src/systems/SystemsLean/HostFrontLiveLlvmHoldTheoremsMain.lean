/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-HOLD-THEOREMS.
  Root for optional lean --run of live LlvmHoldTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmHoldTheorems.
  Greppable: SystemsLean.HostFrontLiveLlvmHoldTheoremsMain,
  HostFrontLiveLlvmHoldTheoremsMain, HOST-FRONT-LIVE-LLVM-HOLD-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_THEOREMS_V0,
  PARSE-LIVE-LLVM-HOLD-THEOREMS, LLVM-HOLD-THEOREM,
  parseLiveLlvmHoldTheoremsSource,
  kernelCheckLiveLlvmHoldTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmHoldTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmHoldTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmHoldTheorems.main args
