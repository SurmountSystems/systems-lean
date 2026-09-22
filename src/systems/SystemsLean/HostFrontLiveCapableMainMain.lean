/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-MAIN.
  Root for optional lean --run of live CapableMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCapableMain.
  Unique needles (trailing newline so HostFrontLiveCapableMain is not a prefix):
  HostFrontLiveCapableMainMain
  PARSE-LIVE-CAPABLE-MAIN
  HOST-FRONT-LIVE-CAPABLE-MAIN
  SLAKE_HOST_FRONT_LIVE_CAPABLE_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveCapableMainMain,
  parseLiveCapableMainSource,
  kernelCheckLiveCapableMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableMainMain
  Not mill 5 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCapableMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableMain.main args
