/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PERFORM-CLAIMED-MAIN.
  Root for optional lean --run of live PerformClaimedMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostPerformClaimedMain.
  Unique needles (trailing newline so HostFrontLiveHostPerformClaimedMain is not a prefix):
  HostFrontLiveHostPerformClaimedMainMain
  PARSE-LIVE-PERFORM-CLAIMED-MAIN
  HOST-FRONT-LIVE-PERFORM-CLAIMED-MAIN
  SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_MAIN_V0
  PERFORM-CLAIMED-MAIN
  HOST-PERFORM-CLAIMED-MAIN
  Greppable: SystemsLean.HostFrontLiveHostPerformClaimedMainMain,
  parseLivePerformClaimedMainSource,
  kernelCheckLivePerformClaimedMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostPerformClaimedMainMain
  Not mill 18 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Do not steal HostFrontLivePerformClaimedMain (library companion).
  Do not wrap PerformClaimed.lean. Do not wrap OfficialPathMain or OfficialRetireMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostPerformClaimedMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostPerformClaimedMain.main args
