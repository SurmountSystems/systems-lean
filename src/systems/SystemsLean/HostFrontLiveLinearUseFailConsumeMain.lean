/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-USE-FAIL-CONSUME.
  Root for optional lean --run of live LinearUseFail/Consume.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearUseFailConsume.
  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailConsumeMain
  PARSE-LIVE-LINEAR-USE-FAIL-CONSUME
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-CONSUME
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_CONSUME_V0
  Greppable: SystemsLean.HostFrontLiveLinearUseFailConsumeMain,
  parseLiveLinearUseFailConsumeSource,
  kernelCheckLiveLinearUseFailConsumeSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearUseFailConsumeMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearUseFailConsume

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearUseFailConsume.main args
