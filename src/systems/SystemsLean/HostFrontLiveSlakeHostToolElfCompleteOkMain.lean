/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK.
  Root for optional lean --run of live SlakeHostToolElfCompleteOk.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOkMain,
  HostFrontLiveSlakeHostToolElfCompleteOkMain,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_COMPLETE_OK_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-COMPLETE-OK,
  parseLiveSlakeHostToolElfCompleteOkSource,
  kernelCheckLiveSlakeHostToolElfCompleteOkSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOkMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfCompleteOk.main args
