/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphMods.
  Short role: named driver for just slake-typecheck-importmods.
  Ready is HostFrontLiveImportMods parse plus HostKernel.kernelCheck of live
  HostImportGraphMods.lean, not := true, not lake build
  SystemsLean.HostImportGraphMods.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-MODS,
  SLAKE_TYPECHECK_IMPORT_MODS_V0, slake-typecheck-importmods,
  slakeTypecheckImportModsReady, kernelCheckLiveImportModsSource,
  PARSE-LIVE-IMPORT-MODS, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportMods
  Checkable writer: just slake-typecheck-importmods (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportMods

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_MODS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-MODS"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphMods. -/
def justRecipeSlakeTypecheckImportMods : String := "slake-typecheck-importmods"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportModsRel : String :=
  SystemsLean.HostFrontLiveImportMods.liveImportModsRel

/-- Ready names HostFrontLiveImportMods parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportModsReady, kernelCheckLiveImportModsSource. -/
def slakeTypecheckImportModsReady : Bool :=
  SystemsLean.HostFrontLiveImportMods.hostFrontLiveImportModsReady

/-- Honesty: this command is not lake build of HostImportGraphMods. -/
def slakeTypecheckImportModsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportModsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportModsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphMods.lean.
    Ready is HostFrontLiveImportMods.hostFrontLiveImportModsReady (parse plus kernelCheck),
    not := true. Evaluated inside HostFrontLiveImportMods.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportMods} =="
  IO.println s!"  host={hostId} file={liveImportModsRel}"
  unless (!slakeTypecheckImportModsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportModsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportMods.main args
