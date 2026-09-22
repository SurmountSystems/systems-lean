/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS.
  Root for optional lean --run of live ProductPathWriteHcTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathWriteHcTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveProductPathWriteHcTheoremsMain
  PARSE-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITE-HC-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITE_HC_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathWriteHcTheoremsMain,
  parseLiveProductPathWriteHcTheoremsSource,
  kernelCheckLiveProductPathWriteHcTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriteHcTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathWriteHcTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriteHcTheorems.main args
