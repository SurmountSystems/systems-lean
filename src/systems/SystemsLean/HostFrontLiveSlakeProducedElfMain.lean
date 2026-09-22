/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-PRODUCED-ELF.
  Root for optional lean --run of live SlakeProducedElf.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeProducedElf.
  Unique needles (trailing newline so HostFrontLiveSlakeProducedElf is not a prefix):
  HostFrontLiveSlakeProducedElfMain
  PARSE-LIVE-SLAKE-PRODUCED-ELF
  HOST-FRONT-LIVE-SLAKE-PRODUCED-ELF
  SLAKE_HOST_FRONT_LIVE_SLAKE_PRODUCED_ELF_V0
  SLAKE-PRODUCED-ELF
  Greppable: SystemsLean.HostFrontLiveSlakeProducedElfMain,
  parseLiveSlakeProducedElfSource,
  kernelCheckLiveSlakeProducedElfSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeProducedElfMain
  Not mill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeProducedElf

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeProducedElf.main args
