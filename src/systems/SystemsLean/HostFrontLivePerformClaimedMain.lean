/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PERFORM-CLAIMED.
  Root for optional lean --run of live PerformClaimed.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLivePerformClaimed.
  Unique needles (trailing newline so HostFrontLivePerformClaimed is not a prefix):
  HostFrontLivePerformClaimedMain
  PARSE-LIVE-PERFORM-CLAIMED
  HOST-FRONT-LIVE-PERFORM-CLAIMED
  SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_V0
  Greppable: SystemsLean.HostFrontLivePerformClaimedMain,
  parseLivePerformClaimedSource,
  kernelCheckLivePerformClaimedSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePerformClaimedMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLivePerformClaimed

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePerformClaimed.main args
