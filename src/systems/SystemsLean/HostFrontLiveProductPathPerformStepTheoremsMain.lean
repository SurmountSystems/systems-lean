/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS.
  Root for optional lean --run of live ProductPathPerformStepTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveProductPathPerformStepTheorems.
  Greppable: SystemsLean.HostFrontLiveProductPathPerformStepTheoremsMain,
  HostFrontLiveProductPathPerformStepTheoremsMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS,
  PRODUCT-PATH-PERFORM-STEP-THEOREMS-THEOREM,
  parseLiveProductPathPerformStepTheoremsSource,
  kernelCheckLiveProductPathPerformStepTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathPerformStepTheoremsMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathPerformStepTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathPerformStepTheorems.main args
