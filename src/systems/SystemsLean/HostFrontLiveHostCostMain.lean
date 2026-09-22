/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-COST.
  Root for optional lean --run of live HostCost.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostCost.
  Unique needles (trailing newline so HostFrontLiveHostCost is not a prefix):
  HostFrontLiveHostCostMain
  PARSE-LIVE-HOST-COST
  HOST-FRONT-LIVE-HOST-COST
  SLAKE_HOST_FRONT_LIVE_HOST_COST_V0
  Greppable: SystemsLean.HostFrontLiveHostCostMain,
  parseLiveHostCostSource,
  kernelCheckLiveHostCostSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostCostMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostCost

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostCost.main args
