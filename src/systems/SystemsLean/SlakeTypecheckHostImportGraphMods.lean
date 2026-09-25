/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphMods.
  Short role: named driver for just slake-typecheck-hostimportgraphmods.
  Ready is HostFrontLiveHostImportGraphMods parse plus HostKernel.kernelCheck
  of live HostImportGraphMods.lean, not := true, not lake build
  SystemsLean.HostImportGraphMods.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not steal HostFrontLiveHostImportGraphModel (liveRel is
  HostImportGraphModel.lean). Do not steal HostFrontLiveHostImportGraphLoadOk
  (liveRel is HostImportGraphLoadOk.lean). Do not edit occupancy leftover
  HostFrontLiveImportLoadOkLater. Do not steal mill wrap
  HostFrontLiveHostImportGraphMain.
  Unique needles (each id is the whole line, so a shorter id is not this driver):
  SlakeTypecheckHostImportGraphMods
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MODS
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MODS_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-MODS
  slake-typecheck-hostimportgraphmods
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphmods,
  slakeTypecheckHostImportGraphModsReady,
  kernelCheckLiveHostImportGraphModsSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphMods
  Checkable writer: just slake-typecheck-hostimportgraphmods
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphMods

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MODS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MODS"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphMods. -/
def justRecipeSlakeTypecheckHostImportGraphMods : String :=
  "slake-typecheck-hostimportgraphmods"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphModsRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphMods.liveHostImportGraphModsRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphMods.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphMods.liveRel

/-- Ready names HostFrontLiveHostImportGraphMods parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphModsReady,
    kernelCheckLiveHostImportGraphModsSource. -/
def slakeTypecheckHostImportGraphModsReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphMods.hostFrontLiveHostImportGraphModsReady

/-- Honesty: this command is not lake build of HostImportGraphMods. -/
def slakeTypecheckHostImportGraphModsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphModsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphModsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphMods.lean.
    Ready is HostFrontLiveHostImportGraphMods.hostFrontLiveHostImportGraphModsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphMods.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphMods} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphModsRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphModsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphModsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphMods.main args
