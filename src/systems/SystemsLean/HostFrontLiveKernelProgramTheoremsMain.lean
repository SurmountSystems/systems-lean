/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-PROGRAM-THEOREMS.
  Root for optional lean --run of live KernelProgramTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelProgramTheorems.
  Greppable: SystemsLean.HostFrontLiveKernelProgramTheoremsMain,
  HostFrontLiveKernelProgramTheoremsMain, HOST-FRONT-LIVE-KERNEL-PROGRAM-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_PROGRAM_THEOREMS_V0,
  PARSE-LIVE-KERNEL-PROGRAM-THEOREMS,
  parseLiveKernelProgramTheoremsSource,
  kernelCheckLiveKernelProgramTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelProgramTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelProgramTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelProgramTheorems.main args
