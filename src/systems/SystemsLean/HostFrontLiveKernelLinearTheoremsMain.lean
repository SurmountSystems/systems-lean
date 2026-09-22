/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-LINEAR-THEOREMS.
  Root for optional lean --run of live KernelLinearTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelLinearTheorems.
  Unique needles (trailing newline so HostFrontLiveKernelLinearTheoremsMain is
  not a prefix hit on KernelLinear wrap HostFrontLiveKernelLinearMain):
  HostFrontLiveKernelLinearTheoremsMain
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS
  HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS
  SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveKernelLinearTheoremsMain,
  HostFrontLiveKernelLinearTheoremsMain, HOST-FRONT-LIVE-KERNEL-LINEAR-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_LINEAR_THEOREMS_V0,
  PARSE-LIVE-KERNEL-LINEAR-THEOREMS,
  parseLiveKernelLinearTheoremsSource,
  kernelCheckLiveKernelLinearTheoremsSource,
  liveRel,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelLinearTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Not HostFrontLiveKernelLinearMain (that wrap parses KernelLinear.lean).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelLinearTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelLinearTheorems.main args
