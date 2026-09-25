/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86.
  Root for optional lean --run of live SlakeHostToolElfMeasureFieldsX86.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86Main,
  HostFrontLiveSlakeHostToolElfMeasureFieldsX86Main,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86,
  HOST-HOST-TOOL-MEASURE-FIELDS-X86,
  parseLiveSlakeHostToolElfMeasureFieldsX86Source,
  kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86Main
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86.main args
