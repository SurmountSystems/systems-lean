/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-COMPOSE-SUBSET-REBUILD.
  Root for optional lean --run of live ComposeSubsetRebuild.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveComposeSubsetRebuild.
  This wrap is ComposeSubsetRebuild.lean. It is not ComposeSubsetRebuildMain.lean.
  Greppable: SystemsLean.HostFrontLiveComposeSubsetRebuildMain,
  HostFrontLiveComposeSubsetRebuildMain, HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD,
  SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_REBUILD_V0,
  PARSE-LIVE-COMPOSE-SUBSET-REBUILD, COMPOSE-SUBSET-REBUILD,
  parseLiveComposeSubsetRebuildSource,
  kernelCheckLiveComposeSubsetRebuildSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveComposeSubsetRebuildMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveComposeSubsetRebuild

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveComposeSubsetRebuild.main args
