/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-RESIDUAL-SHRINK.
  Root for optional lean --run of live HostResidualShrink.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostResidualShrink.
  Unique needles (trailing newline so HostFrontLiveHostResidualShrink is not a prefix):
  HostFrontLiveHostResidualShrinkMain
  PARSE-LIVE-HOST-RESIDUAL-SHRINK
  HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK
  SLAKE_HOST_FRONT_LIVE_HOST_RESIDUAL_SHRINK_V0
  Greppable: SystemsLean.HostFrontLiveHostResidualShrinkMain,
  parseLiveHostResidualShrinkSource,
  kernelCheckLiveHostResidualShrinkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostResidualShrinkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostResidualShrink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostResidualShrink.main args
