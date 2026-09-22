/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT.
  Root for optional lean --run of live LinearUseFail/NotEqNot.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearUseFailNotEqNot.
  Unique needles (trailing newline so LinearUseFail and Decide wraps are not a prefix):
  HostFrontLiveLinearUseFailNotEqNotMain
  PARSE-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-NOT-EQ-NOT
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_NOT_EQ_NOT_V0
  Greppable: SystemsLean.HostFrontLiveLinearUseFailNotEqNotMain,
  parseLiveLinearUseFailNotEqNotSource,
  kernelCheckLiveLinearUseFailNotEqNotSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearUseFailNotEqNotMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearUseFailNotEqNot

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearUseFailNotEqNot.main args
