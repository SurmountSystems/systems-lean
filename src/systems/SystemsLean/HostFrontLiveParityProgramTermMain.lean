/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-PROGRAM-TERM.
  Root for optional lean --run of live HostModuleCheckParityProgramTerm.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveParityProgramTerm.
  Greppable: SystemsLean.HostFrontLiveParityProgramTermMain, HostFrontLiveParityProgramTermMain,
  HOST-FRONT-LIVE-PARITY-PROGRAM-TERM, SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_TERM_V0,
  PARSE-LIVE-PARITY-PROGRAM-TERM, parseLiveParityProgramTermSource,
  kernelCheckLiveParityProgramTermSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityProgramTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveParityProgramTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityProgramTerm.main args
