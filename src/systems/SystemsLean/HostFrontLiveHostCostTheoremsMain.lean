/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-COST-THEOREMS.
  Root for optional lean --run of live HostCostTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostCostTheorems.
  Unique needles (trailing newline so HostFrontLiveHostCost is not a prefix):
  HostFrontLiveHostCostTheoremsMain
  PARSE-LIVE-HOST-COST-THEOREMS
  HOST-FRONT-LIVE-HOST-COST-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_COST_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveHostCostTheoremsMain,
  parseLiveHostCostTheoremsSource,
  kernelCheckLiveHostCostTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostCostTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostCostTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostCostTheorems.main args
