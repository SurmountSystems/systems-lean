/-
  SYSTEMS_LEAN_HOST partial. Thin driver for PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS.
  Root for optional lean --run of live ProductOutKernelTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductOutKernelTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a shorter
  ProductOutKernel needle is not a prefix hit):
  HostFrontLiveProductOutKernelTheoremsMain
  PARSE-LIVE-PRODUCT-OUT-KERNEL-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-OUT-KERNEL-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_OUT_KERNEL_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductOutKernelTheoremsMain,
  parseLiveProductOutKernelTheoremsSource,
  kernelCheckLiveProductOutKernelTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductOutKernelTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductOutKernelTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductOutKernelTheorems.main args
