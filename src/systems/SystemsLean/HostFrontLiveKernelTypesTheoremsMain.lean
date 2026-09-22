/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-TYPES-THEOREMS.
  Root for optional lean --run of live KernelTypesTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelTypesTheorems.
  Greppable: SystemsLean.HostFrontLiveKernelTypesTheoremsMain,
  HostFrontLiveKernelTypesTheoremsMain, HOST-FRONT-LIVE-KERNEL-TYPES-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_TYPES_THEOREMS_V0,
  PARSE-LIVE-KERNEL-TYPES-THEOREMS,
  parseLiveKernelTypesTheoremsSource,
  kernelCheckLiveKernelTypesTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelTypesTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelTypesTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelTypesTheorems.main args
