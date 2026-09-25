/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-BARS.
  Root for optional lean --run of live ProductPathBars.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductPathBars.
  Greppable: SystemsLean.HostFrontLiveProductPathBarsMain,
  HostFrontLiveProductPathBarsMain, HOST-FRONT-LIVE-PRODUCT-PATH-BARS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_BARS_V0,
  PARSE-LIVE-PRODUCT-PATH-BARS,
  parseLiveProductPathBarsSource,
  kernelCheckLiveProductPathBarsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathBarsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathBars

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathBars.main args
