/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS.
  Root for optional lean --run of live ProductPathWriterSurfaceTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems.
  Greppable: SystemsLean.HostFrontLiveProductPathWriterSurfaceTheoremsMain,
  HostFrontLiveProductPathWriterSurfaceTheoremsMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_SURFACE_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-SURFACE-THEOREMS, WRITER-SURFACE-THEOREM,
  parseLiveProductPathWriterSurfaceTheoremsSource,
  kernelCheckLiveProductPathWriterSurfaceTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriterSurfaceTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriterSurfaceTheorems.main args
