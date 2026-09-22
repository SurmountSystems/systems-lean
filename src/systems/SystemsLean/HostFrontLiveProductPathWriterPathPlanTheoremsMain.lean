/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN-THEOREMS.
  Root for optional lean --run of live ProductPathWriterPathPlanTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems.
  Greppable: SystemsLean.HostFrontLiveProductPathWriterPathPlanTheoremsMain,
  HostFrontLiveProductPathWriterPathPlanTheoremsMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_WRITER_PATH_PLAN_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-PLAN-THEOREMS, WRITER-PATH-PLAN-THEOREM,
  parseLiveProductPathWriterPathPlanTheoremsSource,
  kernelCheckLiveProductPathWriterPathPlanTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathWriterPathPlanTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathWriterPathPlanTheorems.main args
