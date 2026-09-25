/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphModsLater.
  Short role: named driver for just slake-typecheck-hostimportgraphmodslater.
  Ready is HostFrontLiveHostImportGraphModsLater parse plus HostKernel.kernelCheck
  of live HostImportGraphModsLater.lean, not := true, not lake build
  SystemsLean.HostImportGraphModsLater.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not steal HostFrontLiveHostImportGraphMods (liveRel is
  HostImportGraphMods.lean).
  Do not steal HostFrontLiveHostImportGraphModel (liveRel is
  HostImportGraphModel.lean). Do not steal HostFrontLiveHostImportGraphLoadOk
  (liveRel is HostImportGraphLoadOk.lean). Do not edit occupancy leftover
  HostFrontLiveImportLoadOkLater. Do not steal mill wrap
  HostFrontLiveHostImportGraphMain.
  Unique needles (each id is the whole line, so a shorter id is not this driver):
  SlakeTypecheckHostImportGraphModsLater
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MODS-LATER
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MODS_LATER_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-MODS-LATER
  slake-typecheck-hostimportgraphmodslater
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphmodslater,
  slakeTypecheckHostImportGraphModsLaterReady,
  kernelCheckLiveHostImportGraphModsLaterSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphModsLater
  Checkable writer: just slake-typecheck-hostimportgraphmodslater
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphModsLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_MODS_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-MODS-LATER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphModsLater. -/
def justRecipeSlakeTypecheckHostImportGraphModsLater : String :=
  "slake-typecheck-hostimportgraphmodslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphModsLaterRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphModsLater.liveHostImportGraphModsLaterRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphModsLater.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphModsLater.liveRel

/-- Ready names HostFrontLiveHostImportGraphModsLater parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphModsLaterReady,
    kernelCheckLiveHostImportGraphModsLaterSource. -/
def slakeTypecheckHostImportGraphModsLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphModsLater.hostFrontLiveHostImportGraphModsLaterReady

/-- Honesty: this command is not lake build of HostImportGraphModsLater. -/
def slakeTypecheckHostImportGraphModsLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphModsLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphModsLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphModsLater.lean.
    Ready is HostFrontLiveHostImportGraphModsLater.hostFrontLiveHostImportGraphModsLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphModsLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphModsLater} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphModsLaterRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphModsLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphModsLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphModsLater.main args
