/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMeasureX86.
  Short role: named driver for lean --run of live SlakeHostToolElfMeasureX86.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMeasureX86 parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMeasureX86.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMeasureX86.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Not SlakeHostToolElfMeasureGreen. Not SlakeHostToolElfMeasureFields.
  Do not import SystemsLean.SelfHostComplete.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-X86,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0, slake-typecheck-slakehosttoolelfmeasurex86,
  slakeTypecheckSlakeHostToolElfMeasureX86Ready, kernelCheckLiveSlakeHostToolElfMeasureX86Source,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-X86, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureX86
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_X86_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-X86"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMeasureX86 : String :=
  "slake-typecheck-slakehosttoolelfmeasurex86"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureX86Rel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86.liveSlakeHostToolElfMeasureX86Rel

/-- Ready names HostFrontLiveSlakeHostToolElfMeasureX86 parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMeasureX86Ready,
    kernelCheckLiveSlakeHostToolElfMeasureX86Source. -/
def slakeTypecheckSlakeHostToolElfMeasureX86Ready : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86.hostFrontLiveSlakeHostToolElfMeasureX86Ready

/-- Honesty: this command is not lake build of SlakeHostToolElfMeasureX86. -/
def slakeTypecheckSlakeHostToolElfMeasureX86DoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureX86FullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureX86OwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMeasureX86.lean.
    Ready is HostFrontLiveSlakeHostToolElfMeasureX86.hostFrontLiveSlakeHostToolElfMeasureX86Ready
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMeasureX86.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMeasureX86} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureX86Rel}"
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86.liveRel}"
  unless (!slakeTypecheckSlakeHostToolElfMeasureX86FullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureX86OwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureX86.main args
