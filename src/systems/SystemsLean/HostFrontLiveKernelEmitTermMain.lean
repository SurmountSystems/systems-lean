/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-KERNELEMITTERM.
  Root for optional lean --run of live HostModuleCheckKernelEmitTerm.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveKernelEmitTerm.
  Greppable: SystemsLean.HostFrontLiveKernelEmitTermMain,
  HostFrontLiveKernelEmitTermMain, HOST-FRONT-LIVE-KERNELEMITTERM,
  SLAKE_HOST_FRONT_LIVE_KERNELEMITTERM_V0, PARSE-LIVE-KERNELEMITTERM,
  parseLiveKernelEmitTermSource, kernelCheckLiveKernelEmitTermSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveKernelEmitTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveKernelEmitTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveKernelEmitTerm.main args
