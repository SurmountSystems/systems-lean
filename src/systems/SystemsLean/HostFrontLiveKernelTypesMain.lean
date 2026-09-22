/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-TYPES.
  Root for optional lean --run of live KernelTypes.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelTypes.
  Greppable: SystemsLean.HostFrontLiveKernelTypesMain,
  HostFrontLiveKernelTypesMain, HOST-FRONT-LIVE-KERNEL-TYPES,
  SLAKE_HOST_FRONT_LIVE_KERNEL_TYPES_V0, PARSE-LIVE-KERNEL-TYPES,
  parseLiveKernelTypesSource, kernelCheckLiveKernelTypesSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelTypesMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelTypes

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelTypes.main args
