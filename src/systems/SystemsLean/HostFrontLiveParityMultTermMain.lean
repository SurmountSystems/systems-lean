/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-MULT-TERM.
  Root for optional lean --run of live HostModuleCheckParityMultTerm.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveParityMultTerm.
  Greppable: SystemsLean.HostFrontLiveParityMultTermMain, HostFrontLiveParityMultTermMain,
  HOST-FRONT-LIVE-PARITY-MULT-TERM, SLAKE_HOST_FRONT_LIVE_PARITY_MULT_TERM_V0,
  PARSE-LIVE-PARITY-MULT-TERM, parseLiveParityMultTermSource,
  kernelCheckLiveParityMultTermSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityMultTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveParityMultTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityMultTerm.main args
