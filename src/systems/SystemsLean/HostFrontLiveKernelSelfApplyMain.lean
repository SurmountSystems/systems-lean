/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-SELF-APPLY.
  Root for optional lean --run of live KernelSelfApply.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelSelfApply.
  Greppable: SystemsLean.HostFrontLiveKernelSelfApplyMain, HostFrontLiveKernelSelfApplyMain,
  HOST-FRONT-LIVE-KERNEL-SELF-APPLY, SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_V0,
  PARSE-LIVE-KERNEL-SELF-APPLY,
  parseLiveKernelSelfApplySource, kernelCheckLiveKernelSelfApplySource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelSelfApplyMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelSelfApply

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelSelfApply.main args
