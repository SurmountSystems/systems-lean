/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-FRONT-MAIN.
  Root for optional lean --run of live HostFrontMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostFrontMain.
  Unique needles (trailing newline so HostFrontLiveHostFrontMain is not a prefix):
  HostFrontLiveHostFrontMainMain
  PARSE-LIVE-HOST-FRONT-MAIN
  HOST-FRONT-LIVE-HOST-FRONT-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_FRONT_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveHostFrontMainMain,
  parseLiveHostFrontMainSource,
  kernelCheckLiveHostFrontMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostFrontMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostFrontMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostFrontMain.main args
