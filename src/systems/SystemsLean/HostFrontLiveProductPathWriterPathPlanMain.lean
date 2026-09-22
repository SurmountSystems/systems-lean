/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN.
  Root for optional lean --run of live ProductPathWriterPathPlan.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathWriterPathPlan.
  Greppable: SystemsLean.HostFrontLiveProductPathWriterPathPlanMain, HostFrontLiveProductPathWriterPathPlanMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN, SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_PLAN_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN,
  parseLiveProductPathWriterPathPlanSource, kernelCheckLiveProductPathWriterPathPlanSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriterPathPlanMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathWriterPathPlan

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriterPathPlan.main args
