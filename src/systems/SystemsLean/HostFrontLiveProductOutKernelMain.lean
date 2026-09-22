/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-OUT-KERNEL.
  Root for optional lean --run of live ProductOutKernel.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductOutKernel.
  Greppable: SystemsLean.HostFrontLiveProductOutKernelMain,
  HostFrontLiveProductOutKernelMain, HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_V0,
  PARSE-LIVE-PRODUCT-OUT-KERNEL, PRODUCT-OUT-THEOREM,
  parseLiveProductOutKernelSource,
  kernelCheckLiveProductOutKernelSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductOutKernelMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductOutKernel

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductOutKernel.main args
