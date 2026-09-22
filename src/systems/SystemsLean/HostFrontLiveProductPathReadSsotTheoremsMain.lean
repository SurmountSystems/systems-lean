/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS.
  Root for optional lean --run of live ProductPathReadSsotTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathReadSsotTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveProductPathReadSsotTheoremsMain
  PARSE-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-READ-SSOT-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_READ_SSOT_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathReadSsotTheoremsMain,
  parseLiveProductPathReadSsotTheoremsSource,
  kernelCheckLiveProductPathReadSsotTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathReadSsotTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathReadSsotTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathReadSsotTheorems.main args
