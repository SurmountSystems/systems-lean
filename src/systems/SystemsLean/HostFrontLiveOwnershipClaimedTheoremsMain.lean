/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS.
  Root for optional lean --run of live OwnershipClaimedTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveOwnershipClaimedTheorems.
  Unique needles (trailing newline so HostFrontLiveOwnershipClaimed is not a prefix):
  HostFrontLiveOwnershipClaimedTheoremsMain
  HostFrontLiveOwnershipClaimedTheorems
  PARSE-LIVE-OWNERSHIP-CLAIMED-THEOREMS
  HOST-FRONT-LIVE-OWNERSHIP-CLAIMED-THEOREMS
  SLAKE_HOST_FRONT_LIVE_OWNERSHIP_CLAIMED_THEOREMS_V0
  OWNERSHIP-CLAIMED-THEOREMS
  liveRel
  OwnershipClaimedTheorems.lean
  Greppable: SystemsLean.HostFrontLiveOwnershipClaimedTheoremsMain,
  parseLiveOwnershipClaimedTheoremsSource,
  kernelCheckLiveOwnershipClaimedTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOwnershipClaimedTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveOwnershipClaimedTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOwnershipClaimedTheorems.main args
