/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.SlakeHostToolElfMeasureFieldsX86.
  Short role: named driver for just
  slake-typecheck-slakehosttoolelfmeasurefieldsx86.
  Ready is HostFrontLiveSlakeHostToolElfMeasureFieldsX86 parse plus
  HostKernel.kernelCheck of live SlakeHostToolElfMeasureFieldsX86.lean,
  not a hardcoded true, not lake build
  SystemsLean.SlakeHostToolElfMeasureFieldsX86.
  liveRel is SlakeHostToolElfMeasureFieldsX86.lean.
  This wrap is SlakeHostToolElfMeasureFieldsX86.lean.
  It is not SlakeHostToolElfMeasure.lean.
  It is not SlakeHostToolElfMeasureFields.lean.
  It is not SlakeHostToolElfMeasureX86.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86,
  slake-typecheck-slakehosttoolelfmeasurefieldsx86,
  slakeTypecheckSlakeHostToolElfMeasureFieldsX86Ready,
  kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureFieldsX86
  Checkable writer: just slake-typecheck-slakehosttoolelfmeasurefieldsx86
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_FIELDS_X86"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-FIELDS-X86"

/-- Named just recipe. Not lake build
    SystemsLean.SlakeHostToolElfMeasureFieldsX86. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMeasureFieldsX86 : String :=
  "slake-typecheck-slakehosttoolelfmeasurefieldsx86"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureFieldsX86Rel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86.liveSlakeHostToolElfMeasureFieldsX86Rel

/-- Ready names HostFrontLiveSlakeHostToolElfMeasureFieldsX86 parse plus
    kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckSlakeHostToolElfMeasureFieldsX86Ready,
    kernelCheckLiveSlakeHostToolElfMeasureFieldsX86Source. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsX86Ready : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86.hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready

/-- Honesty: this command is not lake build of the live module. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsX86DoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsX86FullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsX86FullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureFieldsX86OwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    SlakeHostToolElfMeasureFieldsX86.lean.
    Ready is HostFrontLiveSlakeHostToolElfMeasureFieldsX86
    .hostFrontLiveSlakeHostToolElfMeasureFieldsX86Ready
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated
    inside HostFrontLiveSlakeHostToolElfMeasureFieldsX86.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMeasureFieldsX86} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86.liveRel}"
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureFieldsX86Rel}"
  unless (!slakeTypecheckSlakeHostToolElfMeasureFieldsX86FullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureFieldsX86FullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureFieldsX86OwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckSlakeHostToolElfMeasureFieldsX86Ready do
    IO.eprintln "error: slakeTypecheckSlakeHostToolElfMeasureFieldsX86Ready false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureFieldsX86.main args
