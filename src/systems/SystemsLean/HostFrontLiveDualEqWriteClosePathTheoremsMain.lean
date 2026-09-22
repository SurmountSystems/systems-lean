/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-THEOREMS.
  Root for optional lean --run of live DualEqWriteClosePathTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems.
  Greppable: SystemsLean.HostFrontLiveDualEqWriteClosePathTheoremsMain,
  HostFrontLiveDualEqWriteClosePathTheoremsMain,
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CLOSE_PATH_THEOREMS_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-THEOREMS, CLOSE-PATH-THEOREM,
  parseLiveDualEqWriteClosePathTheoremsSource,
  kernelCheckLiveDualEqWriteClosePathTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteClosePathTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteClosePathTheorems.main args
