/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP.
  Root for optional lean --run of live ProductPathPerformStep.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathPerformStep.
  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathPerformStepMain
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_V0
  Greppable: SystemsLean.HostFrontLiveProductPathPerformStepMain,
  parseLiveProductPathPerformStepSource,
  kernelCheckLiveProductPathPerformStepSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathPerformStepMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathPerformStep

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathPerformStep.main args
