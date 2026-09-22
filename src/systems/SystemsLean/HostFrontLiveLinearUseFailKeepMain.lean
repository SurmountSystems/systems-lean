/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-USE-FAIL-KEEP.
  Root for optional lean --run of live LinearUseFail/Keep.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearUseFailKeep.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailKeepMain
  PARSE-LIVE-LINEAR-USE-FAIL-KEEP
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-KEEP
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_KEEP_V0
  Greppable: SystemsLean.HostFrontLiveLinearUseFailKeepMain,
  parseLiveLinearUseFailKeepSource,
  kernelCheckLiveLinearUseFailKeepSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearUseFailKeepMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearUseFailKeep

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearUseFailKeep.main args
