/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PACKAGEWRITE.
  Root for optional lean --run of live HostPackageWrite.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLivePackageWrite.
  Greppable: SystemsLean.HostFrontLivePackageWriteMain, HostFrontLivePackageWriteMain,
  HOST-FRONT-LIVE-PACKAGEWRITE, SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_V0,
  PARSE-LIVE-PACKAGEWRITE, parseLivePackageWriteSource,
  kernelCheckLivePackageWriteSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePackageWriteMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLivePackageWrite

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePackageWrite.main args
