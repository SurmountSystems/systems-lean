/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-MODULE-CHECK-MAIN.
  Root for optional lean --run of live HostModuleCheckMain.lean parse plus
  HostKernel.kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostModuleCheckMain.
  Greppable: SystemsLean.HostFrontLiveHostModuleCheckMainMain,
  parseLiveHostModuleCheckMainSource,
  kernelCheckLiveHostModuleCheckMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostModuleCheckMainMain
  Not a remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostModuleCheckMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostModuleCheckMain.main args
