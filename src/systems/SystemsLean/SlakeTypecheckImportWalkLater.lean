/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphWalkLater.
  Short role: named driver for just slake-typecheck-importwalklater.
  Ready is HostFrontLiveImportWalkLater parse plus HostKernel.kernelCheck of live
  HostImportGraphWalkLater.lean, not := true, not lake build
  SystemsLean.HostImportGraphWalkLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-WALKLATER,
  SLAKE_TYPECHECK_IMPORT_WALKLATER_V0, slake-typecheck-importwalklater,
  slakeTypecheckImportWalkLaterReady, kernelCheckLiveImportWalkLaterSource,
  PARSE-LIVE-IMPORT-WALK-LATER, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportWalkLater
  Checkable writer: just slake-typecheck-importwalklater (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportWalkLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_WALKLATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-WALKLATER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphWalkLater. -/
def justRecipeSlakeTypecheckImportWalkLater : String :=
  "slake-typecheck-importwalklater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportWalkLaterRel : String :=
  SystemsLean.HostFrontLiveImportWalkLater.liveImportWalkLaterRel

/-- Ready names HostFrontLiveImportWalkLater parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportWalkLaterReady,
    kernelCheckLiveImportWalkLaterSource. -/
def slakeTypecheckImportWalkLaterReady : Bool :=
  SystemsLean.HostFrontLiveImportWalkLater.hostFrontLiveImportWalkLaterReady

/-- Honesty: this command is not lake build of HostImportGraphWalkLater. -/
def slakeTypecheckImportWalkLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportWalkLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportWalkLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphWalkLater.lean.
    Ready is HostFrontLiveImportWalkLater.hostFrontLiveImportWalkLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveImportWalkLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportWalkLater} =="
  IO.println s!"  host={hostId} file={liveImportWalkLaterRel}"
  unless (!slakeTypecheckImportWalkLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportWalkLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportWalkLater.main args
