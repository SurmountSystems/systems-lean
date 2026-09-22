/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNELMULT.
  Root for optional lean --run of live KernelMult.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelMult.
  Greppable: SystemsLean.HostFrontLiveKernelMultMain, HostFrontLiveKernelMultMain,
  HOST-FRONT-LIVE-KERNELMULT, SLAKE_HOST_FRONT_LIVE_KERNELMULT_V0, PARSE-LIVE-KERNELMULT,
  parseLiveKernelMultSource, kernelCheckLiveKernelMultSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelMultMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelMult

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelMult.main args
