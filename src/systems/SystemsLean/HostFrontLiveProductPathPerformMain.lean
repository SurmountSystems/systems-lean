/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-PERFORM.
  Root for optional lean --run of live ProductPathPerform.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathPerform.
  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathPerformMain
  PARSE-LIVE-PRODUCT-PATH-PERFORM
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_V0
  Greppable: SystemsLean.HostFrontLiveProductPathPerformMain,
  parseLiveProductPathPerformSource,
  kernelCheckLiveProductPathPerformSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathPerformMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathPerform

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathPerform.main args
