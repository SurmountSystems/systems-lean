/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PROGRAM-SUBSET-REBUILD.
  Root for optional lean --run of live ProgramSubsetRebuild.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveProgramSubsetRebuild.
  This wrap is ProgramSubsetRebuild.lean. It is not ProgramSubsetRebuildMain.lean.
  Greppable: SystemsLean.HostFrontLiveProgramSubsetRebuildMain,
  HostFrontLiveProgramSubsetRebuildMain, HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD,
  SLAKE_HOST_FRONT_LIVE_PROGRAM_SUBSET_REBUILD_V0,
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD, PROGRAM-SUBSET-REBUILD,
  parseLiveProgramSubsetRebuildSource,
  kernelCheckLiveProgramSubsetRebuildSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProgramSubsetRebuildMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProgramSubsetRebuild

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProgramSubsetRebuild.main args
