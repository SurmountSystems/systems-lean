/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-MAIN.
  Root for optional lean --run of live ProductPathComposePlanMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathComposePlanMain.
  Unique needles (trailing newline so HostFrontLiveProductPathComposePlanMain is not a prefix):
  HostFrontLiveProductPathComposePlanMainMain
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-MAIN
  HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-MAIN
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_MAIN_V0
  PRODUCT-PATH-COMPOSE-PLAN-MAIN
  HOST-PRODUCT-PATH-COMPOSE-PLAN-MAIN
  Greppable: SystemsLean.HostFrontLiveProductPathComposePlanMainMain,
  parseLiveProductPathComposePlanMainSource,
  kernelCheckLiveProductPathComposePlanMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathComposePlanMainMain
  Not mill 21 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Short name is free because HostFrontLiveProductPathComposePlan (library wrap) does not exist.
  Do not mint HostFrontLiveHostProductPathComposePlanMain. Do not wrap ProductPathComposePlan.lean.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathComposePlanMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathComposePlanMain.main args
