/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphModsLater.
  Short role: named driver for just slake-typecheck-importmodslater.
  Ready is HostFrontLiveImportModsLater parse plus HostKernel.kernelCheck of live
  HostImportGraphModsLater.lean, not := true, not lake build
  SystemsLean.HostImportGraphModsLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-MODS-LATER,
  SLAKE_TYPECHECK_IMPORT_MODS_LATER_V0, slake-typecheck-importmodslater,
  slakeTypecheckImportModsLaterReady, kernelCheckLiveImportModsLaterSource,
  PARSE-LIVE-IMPORT-MODS-LATER, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportModsLater
  Checkable writer: just slake-typecheck-importmodslater (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportModsLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_MODS_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-MODS-LATER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphModsLater. -/
def justRecipeSlakeTypecheckImportModsLater : String :=
  "slake-typecheck-importmodslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportModsLaterRel : String :=
  SystemsLean.HostFrontLiveImportModsLater.liveImportModsLaterRel

/-- Ready names HostFrontLiveImportModsLater parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportModsLaterReady,
    kernelCheckLiveImportModsLaterSource. -/
def slakeTypecheckImportModsLaterReady : Bool :=
  SystemsLean.HostFrontLiveImportModsLater.hostFrontLiveImportModsLaterReady

/-- Honesty: this command is not lake build of HostImportGraphModsLater. -/
def slakeTypecheckImportModsLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportModsLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportModsLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphModsLater.lean.
    Ready is HostFrontLiveImportModsLater.hostFrontLiveImportModsLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveImportModsLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportModsLater} =="
  IO.println s!"  host={hostId} file={liveImportModsLaterRel}"
  unless (!slakeTypecheckImportModsLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportModsLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportModsLater.main args
