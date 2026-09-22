/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphWalk.
  Short role: named driver for just slake-typecheck-importwalk.
  Ready is HostFrontLiveImportWalk parse plus HostKernel.kernelCheck of live
  HostImportGraphWalk.lean, not := true, not lake build
  SystemsLean.HostImportGraphWalk.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-IMPORT-WALK,
  SLAKE_TYPECHECK_IMPORT_WALK_V0, slake-typecheck-importwalk,
  slakeTypecheckImportWalkReady, kernelCheckLiveImportWalkSource,
  PARSE-LIVE-IMPORT-WALK, SKELETON.
  Module: SystemsLean.SlakeTypecheckImportWalk
  Checkable writer: just slake-typecheck-importwalk (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveImportWalk

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_IMPORT_WALK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-IMPORT-WALK"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphWalk. -/
def justRecipeSlakeTypecheckImportWalk : String :=
  "slake-typecheck-importwalk"

/-- Live file relative to repo root. Dual-pin path. -/
def liveImportWalkRel : String :=
  SystemsLean.HostFrontLiveImportWalk.liveImportWalkRel

/-- Ready names HostFrontLiveImportWalk parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckImportWalkReady,
    kernelCheckLiveImportWalkSource. -/
def slakeTypecheckImportWalkReady : Bool :=
  SystemsLean.HostFrontLiveImportWalk.hostFrontLiveImportWalkReady

/-- Honesty: this command is not lake build of HostImportGraphWalk. -/
def slakeTypecheckImportWalkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckImportWalkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckImportWalkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphWalk.lean.
    Ready is HostFrontLiveImportWalk.hostFrontLiveImportWalkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveImportWalk.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckImportWalk} =="
  IO.println s!"  host={hostId} file={liveImportWalkRel}"
  unless (!slakeTypecheckImportWalkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckImportWalkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveImportWalk.main args
