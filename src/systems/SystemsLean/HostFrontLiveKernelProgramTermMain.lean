/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNELPROGRAMTERM.
  Root for optional lean --run of live HostModuleCheckKernelProgramTerm.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelProgramTerm.
  Greppable: SystemsLean.HostFrontLiveKernelProgramTermMain,
  HostFrontLiveKernelProgramTermMain, HOST-FRONT-LIVE-KERNELPROGRAMTERM,
  SLAKE_HOST_FRONT_LIVE_KERNELPROGRAMTERM_V0, PARSE-LIVE-KERNELPROGRAMTERM,
  parseLiveKernelProgramTermSource, kernelCheckLiveKernelProgramTermSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelProgramTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelProgramTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelProgramTerm.main args
