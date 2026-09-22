/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-TYPES-THEOREMS.
  Root for optional lean --run of live ParityTypesTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityTypesTheorems.
  Greppable: SystemsLean.HostFrontLiveParityTypesTheoremsMain,
  HostFrontLiveParityTypesTheoremsMain, HOST-FRONT-LIVE-PARITY-TYPES-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_THEOREMS_V0,
  PARSE-LIVE-PARITY-TYPES-THEOREMS, PARITY-TYPES-THEOREM,
  parseLiveParityTypesTheoremsSource,
  kernelCheckLiveParityTypesTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityTypesTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityTypesTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityTypesTheorems.main args
