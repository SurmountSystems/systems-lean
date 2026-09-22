/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PERFORM-CLAIMED-THEOREMS.
  Root for optional lean --run of live PerformClaimedTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLivePerformClaimedTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLivePerformClaimedTheoremsMain
  PARSE-LIVE-PERFORM-CLAIMED-THEOREMS
  HOST-FRONT-LIVE-PERFORM-CLAIMED-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PERFORM_CLAIMED_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLivePerformClaimedTheoremsMain,
  parseLivePerformClaimedTheoremsSource,
  kernelCheckLivePerformClaimedTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePerformClaimedTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLivePerformClaimedTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePerformClaimedTheorems.main args
