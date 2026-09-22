/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86.
  Root for optional lean --run of live SlakeHostToolElfMeasureX86.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86Main, HostFrontLiveSlakeHostToolElfMeasureX86Main,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86, SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86,
  parseLiveSlakeHostToolElfMeasureX86Source, kernelCheckLiveSlakeHostToolElfMeasureX86Source, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86Main
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86.main args
