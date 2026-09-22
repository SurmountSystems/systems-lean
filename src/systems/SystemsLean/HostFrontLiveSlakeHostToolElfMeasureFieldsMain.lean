/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS.
  Root for optional lean --run of live SlakeHostToolElfMeasureFields.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsMain, HostFrontLiveSlakeHostToolElfMeasureFieldsMain,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS, SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS,
  parseLiveSlakeHostToolElfMeasureFieldsSource, kernelCheckLiveSlakeHostToolElfMeasureFieldsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields.main args
