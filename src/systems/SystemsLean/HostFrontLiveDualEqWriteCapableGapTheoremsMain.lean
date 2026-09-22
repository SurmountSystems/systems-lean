/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS.
  Root for optional lean --run of live DualEqWriteCapableGapTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems.
  Greppable: SystemsLean.HostFrontLiveDualEqWriteCapableGapTheoremsMain,
  HostFrontLiveDualEqWriteCapableGapTheoremsMain,
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_THEOREMS_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS, CAPABLE-GAP-THEOREM,
  parseLiveDualEqWriteCapableGapTheoremsSource,
  kernelCheckLiveDualEqWriteCapableGapTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteCapableGapTheoremsMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems.main args
