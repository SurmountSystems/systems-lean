/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-LINEAR.
  Root for optional lean --run of live KernelLinear.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelLinear.
  Greppable: SystemsLean.HostFrontLiveKernelLinearMain, HostFrontLiveKernelLinearMain,
  HOST-FRONT-LIVE-KERNEL-LINEAR, SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_V0,
  PARSE-LIVE-KERNEL-LINEAR, parseLiveKernelLinearSource,
  kernelCheckLiveKernelLinearSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelLinearMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelLinear

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelLinear.main args
