/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS.
  Root for optional lean --run of live DualEqWriteParityTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteParityTheorems.
  Greppable: SystemsLean.HostFrontLiveDualEqWriteParityTheoremsMain,
  HostFrontLiveDualEqWriteParityTheoremsMain,
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_THEOREMS_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS, WRITE-PARITY-THEOREM,
  parseLiveDualEqWriteParityTheoremsSource,
  kernelCheckLiveDualEqWriteParityTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteParityTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveDualEqWriteParityTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteParityTheorems.main args
