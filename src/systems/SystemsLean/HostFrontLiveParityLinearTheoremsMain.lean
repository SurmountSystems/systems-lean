/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-LINEAR-THEOREMS.
  Root for optional lean --run of live ParityLinearTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityLinearTheorems.
  Greppable: SystemsLean.HostFrontLiveParityLinearTheoremsMain,
  HostFrontLiveParityLinearTheoremsMain, HOST-FRONT-LIVE-PARITY-LINEAR-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_THEOREMS_V0,
  PARSE-LIVE-PARITY-LINEAR-THEOREMS, PARITY-LINEAR-THEOREM,
  parseLiveParityLinearTheoremsSource,
  kernelCheckLiveParityLinearTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityLinearTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityLinearTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityLinearTheorems.main args
