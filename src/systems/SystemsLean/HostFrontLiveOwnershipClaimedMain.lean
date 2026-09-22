/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OWNERSHIP-CLAIMED.
  Root for optional lean --run of live OwnershipClaimed.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveOwnershipClaimed.
  Unique needles (trailing newline so HostFrontLiveOwnershipClaimed is not a prefix
  of a Theorems peel):
  HostFrontLiveOwnershipClaimedMain
  PARSE-LIVE-OWNERSHIP-CLAIMED
  HOST-FRONT-LIVE-OWNERSHIP-CLAIMED
  SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_V0
  OWNERSHIP-CLAIMED
  Greppable: SystemsLean.HostFrontLiveOwnershipClaimedMain,
  parseLiveOwnershipClaimedSource,
  kernelCheckLiveOwnershipClaimedSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOwnershipClaimedMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveOwnershipClaimed

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOwnershipClaimed.main args
