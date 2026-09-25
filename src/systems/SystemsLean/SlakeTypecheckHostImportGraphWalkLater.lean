/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphWalkLater.
  Short role: named driver for just slake-typecheck-hostimportgraphwalklater.
  Ready is HostFrontLiveHostImportGraphWalkLater parse plus HostKernel.kernelCheck
  of live HostImportGraphWalkLater.lean, not := true, not lake build
  SystemsLean.HostImportGraphWalkLater.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Do not retarget SlakeTypecheckHostImportGraphWalk. That driver runs the
  HostImportGraphWalk checker only.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphWalkLater
  is not a prefix of SlakeTypecheckHostImportGraphWalk):
  SlakeTypecheckHostImportGraphWalkLater
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-WALK-LATER
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_WALK_LATER_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-WALK-LATER
  slake-typecheck-hostimportgraphwalklater
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphwalklater,
  slakeTypecheckHostImportGraphWalkLaterReady,
  kernelCheckLiveHostImportGraphWalkLaterSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphWalkLater
  Checkable writer: just slake-typecheck-hostimportgraphwalklater
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphWalkLater

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_WALK_LATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-WALK-LATER"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphWalkLater. -/
def justRecipeSlakeTypecheckHostImportGraphWalkLater : String :=
  "slake-typecheck-hostimportgraphwalklater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphWalkLaterRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphWalkLater.liveHostImportGraphWalkLaterRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphWalkLater.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphWalkLater.liveRel

/-- Ready names HostFrontLiveHostImportGraphWalkLater parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphWalkLaterReady,
    kernelCheckLiveHostImportGraphWalkLaterSource. -/
def slakeTypecheckHostImportGraphWalkLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphWalkLater.hostFrontLiveHostImportGraphWalkLaterReady

/-- Honesty: this command is not lake build of HostImportGraphWalkLater. -/
def slakeTypecheckHostImportGraphWalkLaterDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphWalkLaterFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphWalkLaterOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphWalkLater.lean.
    Ready is HostFrontLiveHostImportGraphWalkLater.hostFrontLiveHostImportGraphWalkLaterReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphWalkLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphWalkLater} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphWalkLaterRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphWalkLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphWalkLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphWalkLater.main args
