/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-FULL-BAR-MAIN.
  Root for optional lean --run of live CapableFullBarMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCapableFullBarMain.
  Unique needles (trailing newline so HostFrontLiveCapableFullBarMain is not a prefix):
  HostFrontLiveCapableFullBarMainMain
  PARSE-LIVE-CAPABLE-FULL-BAR-MAIN
  HOST-FRONT-LIVE-CAPABLE-FULL-BAR-MAIN
  SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_MAIN_V0
  CAPABLE-FULL-BAR-MAIN
  Greppable: SystemsLean.HostFrontLiveCapableFullBarMainMain,
  parseLiveCapableFullBarMainSource,
  kernelCheckLiveCapableFullBarMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableFullBarMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCapableFullBarMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableFullBarMain.main args
