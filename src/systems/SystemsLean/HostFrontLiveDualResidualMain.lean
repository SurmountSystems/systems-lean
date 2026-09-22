/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-RESIDUAL.
  Root for optional lean --run of live DualResidual.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualResidual.
  Unique needles (trailing newline so DualResidualTheorems wrap is not a prefix):
  HostFrontLiveDualResidualMain
  PARSE-LIVE-DUAL-RESIDUAL
  HOST-FRONT-LIVE-DUAL-RESIDUAL
  SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_V0
  Greppable: SystemsLean.HostFrontLiveDualResidualMain, HostFrontLiveDualResidualMain,
  HOST-FRONT-LIVE-DUAL-RESIDUAL, SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_V0,
  PARSE-LIVE-DUAL-RESIDUAL,
  parseLiveDualResidualSource, kernelCheckLiveDualResidualSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualResidualMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualResidual

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualResidual.main args
