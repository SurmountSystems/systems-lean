/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN.
  Root for optional lean --run of live SlakeHostToolElfMeasureGreen.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreenMain, HostFrontLiveSlakeHostToolElfMeasureGreenMain,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN, SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_GREEN_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN,
  parseLiveSlakeHostToolElfMeasureGreenSource, kernelCheckLiveSlakeHostToolElfMeasureGreenSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreenMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen.main args
