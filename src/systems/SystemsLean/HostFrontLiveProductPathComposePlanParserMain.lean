/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN.
  Root for optional lean --run of live ProductPathComposePlan.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathComposePlan.
  Unique needles (trailing newline so HostFrontLiveProductPathComposePlanParserMain
  is not a prefix of mill wrap HostFrontLiveProductPathComposePlanMain):
  HostFrontLiveProductPathComposePlanParserMain
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN
  HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_V0
  Greppable: SystemsLean.HostFrontLiveProductPathComposePlanParserMain,
  parseLiveProductPathComposePlanSource,
  kernelCheckLiveProductPathComposePlanSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathComposePlanParserMain
  Mill wrap HostFrontLiveProductPathComposePlanMain parses
  ProductPathComposePlanMain.lean only. Do not steal it. Not mill remill.
  Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathComposePlan

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathComposePlan.main args
