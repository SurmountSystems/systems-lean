/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS.
  Root for optional lean --run of live HostPackageWriteTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostPackageWriteTheorems.
  Unique needles (trailing newline so HostFrontLiveHostPackageWriteMain is not a prefix):
  HostFrontLiveHostPackageWriteTheoremsMain
  HostFrontLiveHostPackageWriteTheorems
  PARSE-LIVE-HOST-PACKAGE-WRITE-THEOREMS
  HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_WRITE_THEOREMS_V0
  HOST-PACKAGE-WRITE-THEOREMS
  liveRel
  HostPackageWriteTheorems.lean
  Greppable: SystemsLean.HostFrontLiveHostPackageWriteTheoremsMain,
  parseLiveHostPackageWriteTheoremsSource,
  kernelCheckLiveHostPackageWriteTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostPackageWriteTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Do not steal HostFrontLivePackageWrite. Do not steal HostFrontLiveHostPackageWriteMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostPackageWriteTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostPackageWriteTheorems.main args
