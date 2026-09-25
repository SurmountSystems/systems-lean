/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMeasureGreen.
  Short role: named driver for lean --run of live SlakeHostToolElfMeasureGreen.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMeasureGreen parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMeasureGreen.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMeasureGreen.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_GREEN_V0, slake-typecheck-slakehosttoolelfmeasuregreen,
  slakeTypecheckSlakeHostToolElfMeasureGreenReady, kernelCheckLiveSlakeHostToolElfMeasureGreenSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureGreen
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_GREEN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-GREEN"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMeasureGreen : String :=
  "slake-typecheck-slakehosttoolelfmeasuregreen"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureGreenRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen.liveSlakeHostToolElfMeasureGreenRel

/-- Ready names HostFrontLiveSlakeHostToolElfMeasureGreen parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMeasureGreenReady,
    kernelCheckLiveSlakeHostToolElfMeasureGreenSource. -/
def slakeTypecheckSlakeHostToolElfMeasureGreenReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen.hostFrontLiveSlakeHostToolElfMeasureGreenReady

/-- Honesty: this command is not lake build of SlakeHostToolElfMeasureGreen. -/
def slakeTypecheckSlakeHostToolElfMeasureGreenDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureGreenFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureGreenOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMeasureGreen.lean.
    Ready is HostFrontLiveSlakeHostToolElfMeasureGreen.hostFrontLiveSlakeHostToolElfMeasureGreenReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMeasureGreen.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMeasureGreen} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen.liveRel}"
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureGreenRel}"
  unless (!slakeTypecheckSlakeHostToolElfMeasureGreenFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureGreenOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureGreen.main args
