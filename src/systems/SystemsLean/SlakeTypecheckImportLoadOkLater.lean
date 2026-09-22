/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphLoadOkLater.
  Short role: named driver for just slake-typecheck-importloadoklater.
  Ready is HostFrontLiveImportLoadOkLater parse plus HostKernel.kernelCheck of live
  HostImportGraphLoadOkLater.lean, not := true, not lake build
  SystemsLean.HostImportGraphLoadOkLater.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-LOADOKLATER,
  SLAKE_TYPECHECK_IMPORT_LOADOKLATER_V0, slake-typecheck-importloadoklater,
  slakeTypecheckImportLoadOkLaterReady, kernelCheckLiveImportLoadOkLaterSource,
  PARSE-LIVE-IMPORT-LOADOKLATER, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportLoadOkLater
  Checkable writer: just slake-typecheck-importloadoklater (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportLoadOkLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_LOADOKLATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-LOADOKLATER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphLoadOkLater. -/
def justRecipeSlakeTypecheckImportLoadOkLater : String :=
  "slake-typecheck-importloadoklater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportLoadOkLaterRel : String :=
  SystemsLean.HostFrontLiveImportLoadOkLater.liveImportLoadOkLaterRel

/-- Ready names HostFrontLiveImportLoadOkLater parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportLoadOkLaterReady,
    kernelCheckLiveImportLoadOkLaterSource. -/
def slakeTypecheckImportLoadOkLaterReady : Bool :=
  SystemsLean.HostFrontLiveImportLoadOkLater.hostFrontLiveImportLoadOkLaterReady

/-- Honesty: this command is not lake build of HostImportGraphLoadOkLater. -/
def slakeTypecheckImportLoadOkLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportLoadOkLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportLoadOkLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphLoadOkLater.lean.
    Ready is HostFrontLiveImportLoadOkLater.hostFrontLiveImportLoadOkLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveImportLoadOkLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportLoadOkLater} =="
  IO.println s!"  host={hostId} file={liveImportLoadOkLaterRel}"
  unless (!slakeTypecheckImportLoadOkLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportLoadOkLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportLoadOkLater.main args
