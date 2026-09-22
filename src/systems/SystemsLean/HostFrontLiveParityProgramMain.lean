/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-PROGRAM.
  Root for optional lean --run of live ParityProgram.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityProgram.
  Greppable: SystemsLean.HostFrontLiveParityProgramMain,
  HostFrontLiveParityProgramMain, HOST-FRONT-LIVE-PARITY-PROGRAM,
  SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_V0,
  PARSE-LIVE-PARITY-PROGRAM, PARITY-PROGRAM-THEOREM,
  parseLiveParityProgramSource,
  kernelCheckLiveParityProgramSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityProgramMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityProgram

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityProgram.main args
