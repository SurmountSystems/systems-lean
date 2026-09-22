/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS.
  Root for optional lean --run of live ProductPathComposePlanTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathComposePlanTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveProductPathComposePlanTheoremsMain
  PARSE-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-COMPOSE-PLAN-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_COMPOSE_PLAN_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathComposePlanTheoremsMain,
  parseLiveProductPathComposePlanTheoremsSource,
  kernelCheckLiveProductPathComposePlanTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathComposePlanTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathComposePlanTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathComposePlanTheorems.main args
