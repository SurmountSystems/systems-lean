/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-RESIDUAL-THEOREMS.
  Root for optional lean --run of live DualResidualTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not DualResidual.lean.
  Body lives in SystemsLean.HostFrontLiveDualResidualTheorems.
  Greppable: SystemsLean.HostFrontLiveDualResidualTheoremsMain,
  HostFrontLiveDualResidualTheoremsMain, HOST-FRONT-LIVE-DUAL-RESIDUAL-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_THEOREMS_V0,
  PARSE-LIVE-DUAL-RESIDUAL-THEOREMS,
  parseLiveDualResidualTheoremsSource,
  kernelCheckLiveDualResidualTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualResidualTheoremsMain
  Not FullHost. FullBackend stays false. Not a claim-bool flip.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveDualResidualTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualResidualTheorems.main args
