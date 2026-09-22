/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNELPROGRAM.
  Root for optional lean --run of live KernelProgram.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelProgram.
  Greppable: SystemsLean.HostFrontLiveKernelProgramMain,
  HostFrontLiveKernelProgramMain, HOST-FRONT-LIVE-KERNELPROGRAM,
  SLAKE_HOST_FRONT_LIVE_KERNELPROGRAM_V0, PARSE-LIVE-KERNELPROGRAM,
  parseLiveKernelProgramSource, kernelCheckLiveKernelProgramSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelProgramMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelProgram

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelProgram.main args
