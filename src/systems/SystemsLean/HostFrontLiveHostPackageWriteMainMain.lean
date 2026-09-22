/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-PACKAGE-WRITE-MAIN.
  Root for optional lean --run of live HostPackageWriteMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostPackageWriteMain.
  Unique needles (trailing newline so HostFrontLiveHostPackageWriteMain is not a prefix):
  HostFrontLiveHostPackageWriteMainMain
  PARSE-LIVE-HOST-PACKAGE-WRITE-MAIN
  HOST-FRONT-LIVE-HOST-PACKAGE-WRITE-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_PACKAGE_WRITE_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveHostPackageWriteMainMain,
  parseLiveHostPackageWriteMainSource,
  kernelCheckLiveHostPackageWriteMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostPackageWriteMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostPackageWriteMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostPackageWriteMain.main args
