/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SUBSET-FRONT.
  Root for optional lean --run of live SubsetFront.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveSubsetFront.
  Greppable: SystemsLean.HostFrontLiveSubsetFrontMain,
  HostFrontLiveSubsetFrontMain, HOST-FRONT-LIVE-SUBSET-FRONT,
  SLAKE_HOST_FRONT_LIVE_SUBSET_FRONT_V0,
  PARSE-LIVE-SUBSET-FRONT, SUBSET-FRONT-THEOREM,
  parseLiveSubsetFrontSource,
  kernelCheckLiveSubsetFrontSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSubsetFrontMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSubsetFront

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSubsetFront.main args
