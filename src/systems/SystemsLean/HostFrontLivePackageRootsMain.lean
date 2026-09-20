/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PACKAGE-ROOTS.
  Root for optional lean --run of live HostPackageRoots.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLivePackageRoots.
  Greppable: SystemsLean.HostFrontLivePackageRootsMain, HostFrontLivePackageRootsMain,
  HOST-FRONT-LIVE-PACKAGE-ROOTS, SLAKE_HOST_FRONT_LIVE_PACKAGE_ROOTS_V0,
  PARSE-LIVE-PACKAGE-ROOTS, parseLivePackageRootsSource,
  kernelCheckLivePackageRootsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLivePackageRootsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLivePackageRoots

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLivePackageRoots.main args
