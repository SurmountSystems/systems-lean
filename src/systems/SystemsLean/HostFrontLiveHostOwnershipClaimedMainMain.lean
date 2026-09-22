/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN.
  Root for optional lean --run of live OwnershipClaimedMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostOwnershipClaimedMain.
  Unique needles (trailing newline so HostFrontLiveHostOwnershipClaimedMain is not a prefix):
  HostFrontLiveHostOwnershipClaimedMainMain
  PARSE-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN
  HOST-FRONT-LIVE-HOST-OWNERSHIP-CLAIMED-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_OWNERSHIP_CLAIMED_MAIN_V0
  OWNERSHIP-CLAIMED-MAIN
  HOST-OWNERSHIP-CLAIMED-MAIN
  Greppable: SystemsLean.HostFrontLiveHostOwnershipClaimedMainMain,
  parseLiveHostOwnershipClaimedMainSource,
  kernelCheckLiveHostOwnershipClaimedMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostOwnershipClaimedMainMain
  Not mill 19 remill (just nineteenth-host-tool). Mill stays 69 of 69.
  Occupancy stays 49. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostOwnershipClaimedMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostOwnershipClaimedMain.main args
