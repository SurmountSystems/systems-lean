/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SUBSET-PACKAGE-JOIN.
  Root for optional lean --run of live SubsetPackageJoin.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveSubsetPackageJoin.
  Greppable: SystemsLean.HostFrontLiveSubsetPackageJoinMain,
  HostFrontLiveSubsetPackageJoinMain, HOST-FRONT-LIVE-SUBSET-PACKAGE-JOIN,
  SUBSET-PACKAGE-JOIN,
  PARSE-LIVE-SUBSET-PACKAGE-JOIN,
  parseLiveSubsetPackageJoinSource,
  kernelCheckLiveSubsetPackageJoinSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSubsetPackageJoinMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSubsetPackageJoin

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSubsetPackageJoin.main args
