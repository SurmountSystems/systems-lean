/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF.
  Root for optional lean --run of live SlakeHostToolElf.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElf.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMain, HostFrontLiveSlakeHostToolElfMain,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF, SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF,
  parseLiveSlakeHostToolElfSource, kernelCheckLiveSlakeHostToolElfSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElf

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElf.main args
