/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FIRST-SURFACE-MAIN.
  Root for optional lean --run of live FirstSurfaceMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveFirstSurfaceMain.
  Unique needles (trailing newline so HostFrontLiveFirstSurfaceMain is not a prefix):
  HostFrontLiveFirstSurfaceMainMain
  PARSE-LIVE-FIRST-SURFACE-MAIN
  HOST-FRONT-LIVE-FIRST-SURFACE-MAIN
  SLAKE_HOST_FRONT_LIVE_FIRST_SURFACE_MAIN_V0
  FIRST-SURFACE-MAIN
  Greppable: SystemsLean.HostFrontLiveFirstSurfaceMainMain,
  parseLiveFirstSurfaceMainSource,
  kernelCheckLiveFirstSurfaceMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFirstSurfaceMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Occupancy leftover HostModuleCheckFirstSurfaceTerm is not this wrap.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveFirstSurfaceMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFirstSurfaceMain.main args
