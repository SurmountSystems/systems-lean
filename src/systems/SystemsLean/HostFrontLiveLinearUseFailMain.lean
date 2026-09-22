/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-USE-FAIL.
  Root for optional lean --run of live LinearUseFail.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearUseFail.
  Greppable: SystemsLean.HostFrontLiveLinearUseFailMain, HostFrontLiveLinearUseFailMain,
  HOST-FRONT-LIVE-LINEAR-USE-FAIL, SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_V0,
  PARSE-LIVE-LINEAR-USE-FAIL,
  parseLiveLinearUseFailSource, kernelCheckLiveLinearUseFailSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearUseFailMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearUseFail

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearUseFail.main args
