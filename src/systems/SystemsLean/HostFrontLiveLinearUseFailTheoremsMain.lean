/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-USE-FAIL-THEOREMS.
  Root for optional lean --run of live LinearUseFailTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearUseFailTheorems.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailTheoremsMain
  PARSE-LIVE-LINEAR-USE-FAIL-THEOREMS
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-THEOREMS
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveLinearUseFailTheoremsMain,
  parseLiveLinearUseFailTheoremsSource,
  kernelCheckLiveLinearUseFailTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearUseFailTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearUseFailTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearUseFailTheorems.main args
