/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNELLINEARTERM.
  Root for optional lean --run of live HostModuleCheckKernelLinearTerm.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelLinearTerm.
  Greppable: SystemsLean.HostFrontLiveKernelLinearTermMain,
  HostFrontLiveKernelLinearTermMain, HOST-FRONT-LIVE-KERNELLINEARTERM,
  SLAKE_HOST_FRONT_LIVE_KERNELLINEARTERM_V0, PARSE-LIVE-KERNELLINEARTERM,
  parseLiveKernelLinearTermSource, kernelCheckLiveKernelLinearTermSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelLinearTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelLinearTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelLinearTerm.main args
