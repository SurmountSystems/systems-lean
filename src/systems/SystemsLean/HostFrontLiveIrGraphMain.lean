/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-IRGRAPH.
  Root for optional lean --run of live IrGraph.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not full product module emit.
  Body lives in SystemsLean.HostFrontLiveIrGraph.
  Greppable: SystemsLean.HostFrontLiveIrGraphMain,
  HostFrontLiveIrGraphMain, HOST-FRONT-LIVE-IRGRAPH,
  SLAKE_HOST_FRONT_LIVE_IRGRAPH_V0,
  PARSE-LIVE-IRGRAPH, liveRel,
  parseLiveIrGraphSource,
  kernelCheckLiveIrGraphSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveIrGraphMain
  Not FullHost. FullBackend stays false. Not full product module emit.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveIrGraph

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveIrGraph.main args
