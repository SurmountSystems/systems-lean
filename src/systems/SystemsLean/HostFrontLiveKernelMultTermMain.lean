/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNELMULTTERM.
  Root for optional lean --run of live HostModuleCheckKernelMultTerm.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelMultTerm.
  Greppable: SystemsLean.HostFrontLiveKernelMultTermMain,
  HostFrontLiveKernelMultTermMain, HOST-FRONT-LIVE-KERNELMULTTERM,
  SLAKE_HOST_FRONT_LIVE_KERNELMULTTERM_V0, PARSE-LIVE-KERNELMULTTERM,
  parseLiveKernelMultTermSource, kernelCheckLiveKernelMultTermSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelMultTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelMultTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelMultTerm.main args
