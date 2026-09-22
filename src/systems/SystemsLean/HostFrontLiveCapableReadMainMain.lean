/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-READ-MAIN.
  Root for optional lean --run of live CapableReadMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCapableReadMain.
  Unique needles (trailing newline so HostFrontLiveCapableReadMain is not a prefix):
  HostFrontLiveCapableReadMainMain
  PARSE-LIVE-CAPABLE-READ-MAIN
  HOST-FRONT-LIVE-CAPABLE-READ-MAIN
  SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_MAIN_V0
  CAPABLE-READ-MAIN
  Greppable: SystemsLean.HostFrontLiveCapableReadMainMain,
  parseLiveCapableReadMainSource,
  kernelCheckLiveCapableReadMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableReadMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCapableReadMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableReadMain.main args
