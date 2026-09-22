/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMeasureFields.
  Short role: named driver for lean --run of live SlakeHostToolElfMeasureFields.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMeasureFields parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMeasureFields.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMeasureFields.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0, slake-typecheck-slakehosttoolelfmeasurefields,
  slakeTypecheckSlakeHostToolElfMeasureFieldsReady, kernelCheckLiveSlakeHostToolElfMeasureFieldsSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureFields
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMeasureFields : String :=
  "slake-typecheck-slakehosttoolelfmeasurefields"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureFieldsRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields.liveSlakeHostToolElfMeasureFieldsRel

/-- Ready names HostFrontLiveSlakeHostToolElfMeasureFields parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMeasureFieldsReady,
    kernelCheckLiveSlakeHostToolElfMeasureFieldsSource. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields.hostFrontLiveSlakeHostToolElfMeasureFieldsReady

/-- Honesty: this command is not lake build of SlakeHostToolElfMeasureFields. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMeasureFields.lean.
    Ready is HostFrontLiveSlakeHostToolElfMeasureFields.hostFrontLiveSlakeHostToolElfMeasureFieldsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMeasureFields.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMeasureFields} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureFieldsRel}"
  unless (!slakeTypecheckSlakeHostToolElfMeasureFieldsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureFieldsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFields.main args
