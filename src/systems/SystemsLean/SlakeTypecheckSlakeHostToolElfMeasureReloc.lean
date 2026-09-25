/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.SlakeHostToolElfMeasureReloc.
  Short role: named driver for just slake-typecheck-slakehosttoolelfmeasurereloc.
  Ready is HostFrontLiveSlakeHostToolElfMeasureReloc parse plus
  HostKernel.kernelCheck of live SlakeHostToolElfMeasureReloc.lean,
  not a hardcoded true, not lake build
  SystemsLean.SlakeHostToolElfMeasureReloc.
  liveRel is SlakeHostToolElfMeasureReloc.lean.
  This wrap is SlakeHostToolElfMeasureReloc.lean.
  It is not SlakeHostToolElfMeasure.lean.
  It does not compile the product imports.
  Not a backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_RELOC,
  slake-typecheck-slakehosttoolelfmeasurereloc,
  slakeTypecheckSlakeHostToolElfMeasureRelocReady,
  kernelCheckLiveSlakeHostToolElfMeasureRelocSource,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMeasureReloc
  Checkable writer: just slake-typecheck-slakehosttoolelfmeasurereloc
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MEASURE_RELOC"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MEASURE-RELOC"

/-- Named just recipe. Not lake build SystemsLean.SlakeHostToolElfMeasureReloc. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMeasureReloc : String :=
  "slake-typecheck-slakehosttoolelfmeasurereloc"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMeasureRelocRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc.liveSlakeHostToolElfMeasureRelocRel

/-- Ready names HostFrontLiveSlakeHostToolElfMeasureReloc parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckSlakeHostToolElfMeasureRelocReady,
    kernelCheckLiveSlakeHostToolElfMeasureRelocSource. -/
def slakeTypecheckSlakeHostToolElfMeasureRelocReady : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc.hostFrontLiveSlakeHostToolElfMeasureRelocReady

/-- Honesty: this command is not lake build of SlakeHostToolElfMeasureReloc. -/
def slakeTypecheckSlakeHostToolElfMeasureRelocDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureRelocFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def slakeTypecheckSlakeHostToolElfMeasureRelocFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMeasureRelocOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMeasureReloc.lean.
    Ready is hostFrontLiveSlakeHostToolElfMeasureRelocReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMeasureReloc.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMeasureReloc} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc.liveRel}"
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMeasureRelocRel}"
  unless (!slakeTypecheckSlakeHostToolElfMeasureRelocFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureRelocFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMeasureRelocOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMeasureReloc.main args
