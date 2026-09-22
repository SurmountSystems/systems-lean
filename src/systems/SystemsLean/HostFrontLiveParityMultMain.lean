/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-MULT.
  Root for optional lean --run of live ParityMult.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityMult.
  Greppable: SystemsLean.HostFrontLiveParityMultMain,
  HostFrontLiveParityMultMain, HOST-FRONT-LIVE-PARITY-MULT,
  SLAKE_HOST_FRONT_LIVE_PARITY_MULT_V0,
  PARSE-LIVE-PARITY-MULT, PARITY-MULT-THEOREM,
  parseLiveParityMultSource,
  kernelCheckLiveParityMultSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityMultMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityMult

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityMult.main args
