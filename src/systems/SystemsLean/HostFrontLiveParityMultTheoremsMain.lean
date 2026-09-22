/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-MULT-THEOREMS.
  Root for optional lean --run of live ParityMultTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityMultTheorems.
  Greppable: SystemsLean.HostFrontLiveParityMultTheoremsMain,
  HostFrontLiveParityMultTheoremsMain, HOST-FRONT-LIVE-PARITY-MULT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PARITY_MULT_THEOREMS_V0,
  PARSE-LIVE-PARITY-MULT-THEOREMS, PARITY-MULT-THEOREM,
  parseLiveParityMultTheoremsSource,
  kernelCheckLiveParityMultTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityMultTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityMultTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityMultTheorems.main args
