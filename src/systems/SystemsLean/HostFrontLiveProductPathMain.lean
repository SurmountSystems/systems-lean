/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH.
  Root for optional lean --run of live ProductPath.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductPath.
  Greppable: SystemsLean.HostFrontLiveProductPathMain,
  HostFrontLiveProductPathMain, HOST-FRONT-LIVE-PRODUCT-PATH,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_V0,
  PARSE-LIVE-PRODUCT-PATH, PRODUCT-PATH-THEOREM,
  parseLiveProductPathSource,
  kernelCheckLiveProductPathSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPath

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPath.main args
