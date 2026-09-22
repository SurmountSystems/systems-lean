/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS.
  Root for optional lean --run of live KernelSelfApplyTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelSelfApplyTheorems.
  Unique needles (trailing newline so HostFrontLiveKernelSelfApplyTheoremsMain is
  not a prefix hit on KernelSelfApply wrap HostFrontLiveKernelSelfApplyMain):
  HostFrontLiveKernelSelfApplyTheoremsMain
  PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS
  HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS
  SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveKernelSelfApplyTheoremsMain,
  HostFrontLiveKernelSelfApplyTheoremsMain, HOST-FRONT-LIVE-KERNEL-SELF-APPLY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_SELF_APPLY_THEOREMS_V0,
  PARSE-LIVE-KERNEL-SELF-APPLY-THEOREMS,
  parseLiveKernelSelfApplyTheoremsSource,
  kernelCheckLiveKernelSelfApplyTheoremsSource,
  liveRel,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelSelfApplyTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Not HostFrontLiveKernelSelfApplyMain (that wrap parses KernelSelfApply.lean).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelSelfApplyTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelSelfApplyTheorems.main args
