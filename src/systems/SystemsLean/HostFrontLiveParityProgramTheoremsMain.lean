/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-PROGRAM-THEOREMS.
  Root for optional lean --run of live ParityProgramTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityProgramTheorems.
  Greppable: SystemsLean.HostFrontLiveParityProgramTheoremsMain,
  HostFrontLiveParityProgramTheoremsMain, HOST-FRONT-LIVE-PARITY-PROGRAM-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_THEOREMS_V0,
  PARSE-LIVE-PARITY-PROGRAM-THEOREMS, PARITY-PROGRAM-THEOREM,
  parseLiveParityProgramTheoremsSource,
  kernelCheckLiveParityProgramTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityProgramTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityProgramTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityProgramTheorems.main args
