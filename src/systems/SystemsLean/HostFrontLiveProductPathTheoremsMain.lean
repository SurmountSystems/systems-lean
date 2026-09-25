/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCTPATHTHEOREMS.
  Root for optional lean --run of live ProductPathTheorems.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLiveProductPathTheorems.
  Product ids PRODUCT-PATH-THEOREM and PRODUCT-PATH-SMOKE are not changed.
  Greppable: SystemsLean.HostFrontLiveProductPathTheoremsMain,
  HostFrontLiveProductPathTheoremsMain,
  HOST-FRONT-LIVE-PRODUCTPATHTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCTPATHTHEOREMS_V0,
  PARSE-LIVE-PRODUCTPATHTHEOREMS, parseLiveProductPathTheoremsSource,
  kernelCheckLiveProductPathTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathTheoremsMain
  Not mill 70. Not occupancy name 50. Occupancy stays 49. Not FullHost.
  Host tools stay 69 of 69. Not Lake-gone.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathTheorems.main args
