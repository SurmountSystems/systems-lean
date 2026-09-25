/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC.
  Root for optional lean --run of live SlakeHostToolElfMeasureReloc.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureRelocMain,
  HostFrontLiveSlakeHostToolElfMeasureRelocMain,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_RELOC_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC,
  parseLiveSlakeHostToolElfMeasureRelocSource,
  kernelCheckLiveSlakeHostToolElfMeasureRelocSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureRelocMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc.main args
