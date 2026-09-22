/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-MULT-THEOREMS.
  Root for optional lean --run of live KernelMultTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelMultTheorems.
  Greppable: SystemsLean.HostFrontLiveKernelMultTheoremsMain,
  HostFrontLiveKernelMultTheoremsMain, HOST-FRONT-LIVE-KERNEL-MULT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_MULT_THEOREMS_V0,
  PARSE-LIVE-KERNEL-MULT-THEOREMS,
  parseLiveKernelMultTheoremsSource,
  kernelCheckLiveKernelMultTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelMultTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelMultTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelMultTheorems.main args
