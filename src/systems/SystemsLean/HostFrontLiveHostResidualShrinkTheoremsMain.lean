/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS.
  Root for optional lean --run of live HostResidualShrinkTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostResidualShrinkTheorems.
  Unique needles (trailing newline so HostFrontLiveHostResidualShrink is not a prefix):
  HostFrontLiveHostResidualShrinkTheoremsMain
  PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS
  HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_RESIDUAL_SHRINK_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveHostResidualShrinkTheoremsMain,
  parseLiveHostResidualShrinkTheoremsSource,
  kernelCheckLiveHostResidualShrinkTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostResidualShrinkTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostResidualShrinkTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostResidualShrinkTheorems.main args
