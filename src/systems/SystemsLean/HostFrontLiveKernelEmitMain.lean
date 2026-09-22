/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNEL-EMIT.
  Root for optional lean --run of live KernelEmit.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelEmit.
  Greppable: SystemsLean.HostFrontLiveKernelEmitMain,
  HostFrontLiveKernelEmitMain, HOST-FRONT-LIVE-KERNEL-EMIT,
  SLAKE_HOST_FRONT_LIVE_KERNEL_EMIT_V0, PARSE-LIVE-KERNEL-EMIT,
  parseLiveKernelEmitSource, kernelCheckLiveKernelEmitSource,
  liveRel, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelEmitMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelEmit

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelEmit.main args
