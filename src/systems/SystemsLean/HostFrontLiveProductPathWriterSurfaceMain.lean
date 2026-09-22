/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE.
  Root for optional lean --run of live ProductPathWriterSurface.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a remill.
  Body lives in SystemsLean.HostFrontLiveProductPathWriterSurface.
  Greppable: SystemsLean.HostFrontLiveProductPathWriterSurfaceMain,
  HostFrontLiveProductPathWriterSurfaceMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE,
  parseLiveProductPathWriterSurfaceSource,
  kernelCheckLiveProductPathWriterSurfaceSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriterSurfaceMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathWriterSurface

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriterSurface.main args
