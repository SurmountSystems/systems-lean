/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMeasure.
  Short role: named driver for lean --run of live SlakeHostToolElfMeasure.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMeasure parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMeasure.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMeasure.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Not SlakeHostToolElfMeasureGreen. Not SlakeHostToolElfMeasureFields.
  Do not import SystemsLean.SelfHostComplete.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_V0, slake-typecheck-slakehosttoolelfmeasure,
  slakeTypecheckSlakeHostToolElfMeasureReady, kernelCheckLiveSlakeHostToolElfMeasureSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMeasure
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasure

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMeasure : String :=
  "slake-typecheck-slakehosttoolelfmeasure"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasure.liveSlakeHostToolElfMeasureRel

/-- Ready names HostFrontLiveSlakeHostToolElfMeasure parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMeasureReady,
    kernelCheckLiveSlakeHostToolElfMeasureSource. -/
def slakeTypecheckSlakeHostToolElfMeasureReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasure.hostFrontLiveSlakeHostToolElfMeasureReady

/-- Honesty: this command is not lake build of SlakeHostToolElfMeasure. -/
def slakeTypecheckSlakeHostToolElfMeasureDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMeasure.lean.
    Ready is HostFrontLiveSlakeHostToolElfMeasure.hostFrontLiveSlakeHostToolElfMeasureReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMeasure.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMeasure} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureRel}"
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfMeasure.liveRel}"
  unless (!slakeTypecheckSlakeHostToolElfMeasureFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasure.main args
