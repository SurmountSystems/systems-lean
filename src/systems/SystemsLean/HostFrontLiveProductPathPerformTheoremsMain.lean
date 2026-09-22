/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-PERFORM-THEOREMS.
  Root for optional lean --run of live ProductPathPerformTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathPerformTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a
  shorter ProductPathPerform wrap is not a prefix hit):
  HostFrontLiveProductPathPerformTheoremsMain
  PARSE-LIVE-PRODUCT-PATH-PERFORM-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathPerformTheoremsMain,
  parseLiveProductPathPerformTheoremsSource,
  kernelCheckLiveProductPathPerformTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathPerformTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathPerformTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathPerformTheorems.main args
