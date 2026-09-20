/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PACKAGEWRITE-THEOREMS.
  Root for optional lean --run of live HostPackageWriteTheorems.lean parse +
  kernelCheck. Body lives in SystemsLean.HostFrontLivePackageWriteTheorems.
  Greppable: SystemsLean.HostFrontLivePackageWriteTheoremsMain,
  HostFrontLivePackageWriteTheoremsMain,
  HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_THEOREMS_V0,
  PARSE-LIVE-PACKAGEWRITE-THEOREMS, parseLivePackageWriteTheoremsSource,
  kernelCheckLivePackageWriteTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePackageWriteTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLivePackageWriteTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePackageWriteTheorems.main args
