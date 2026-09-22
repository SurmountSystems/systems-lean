/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-EMIT-THEOREMS.
  Root for optional lean --run of live KernelEmitTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelEmitTheorems.
  Greppable: SystemsLean.HostFrontLiveKernelEmitTheoremsMain,
  HostFrontLiveKernelEmitTheoremsMain, HOST-FRONT-LIVE-KERNEL-EMIT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_KERNEL_EMIT_THEOREMS_V0,
  PARSE-LIVE-KERNEL-EMIT-THEOREMS,
  parseLiveKernelEmitTheoremsSource,
  kernelCheckLiveKernelEmitTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelEmitTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelEmitTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelEmitTheorems.main args
