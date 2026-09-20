/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-LINEAR-TERM.
  Root for optional lean --run of live HostModuleCheckParityLinearTerm.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveParityLinearTerm.
  Greppable: SystemsLean.HostFrontLiveParityLinearTermMain, HostFrontLiveParityLinearTermMain,
  HOST-FRONT-LIVE-PARITY-LINEAR-TERM, SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_TERM_V0,
  PARSE-LIVE-PARITY-LINEAR-TERM, parseLiveParityLinearTermSource,
  kernelCheckLiveParityLinearTermSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityLinearTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveParityLinearTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityLinearTerm.main args
