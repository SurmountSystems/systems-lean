/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS.
  Root for optional lean --run of live HostModuleCheckTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not HostModuleCheck.lean.
  Body lives in SystemsLean.HostFrontLiveHostModuleCheckTheorems.
  Greppable: SystemsLean.HostFrontLiveHostModuleCheckTheoremsMain,
  HostFrontLiveHostModuleCheckTheoremsMain, HOST-MODULE-CHECK-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_THEOREMS_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS,
  parseLiveHostModuleCheckTheoremsSource,
  kernelCheckLiveHostModuleCheckTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostModuleCheckTheoremsMain
  Not FullHost. FullBackend stays false. Not a claim-bool flip.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostModuleCheckTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostModuleCheckTheorems.main args
