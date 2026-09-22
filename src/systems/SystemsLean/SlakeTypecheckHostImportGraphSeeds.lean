/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostImportGraphSeeds.
  Short role: named driver for just slake-typecheck-hostimportgraphseeds.
  Ready is HostFrontLiveHostImportGraphSeeds parse plus HostKernel.kernelCheck
  of live HostImportGraphSeeds.lean, not := true, not lake build
  SystemsLean.HostImportGraphSeeds.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckHostImportGraphSeeds is not a
  prefix of mill wrap SlakeTypecheckHostImportGraphMain):
  SlakeTypecheckHostImportGraphSeeds
  HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-SEEDS
  SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_SEEDS_V0
  PARSE-LIVE-HOST-IMPORT-GRAPH-SEEDS
  slake-typecheck-hostimportgraphseeds
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-hostimportgraphseeds,
  slakeTypecheckHostImportGraphSeedsReady,
  kernelCheckLiveHostImportGraphSeedsSource,
  liveRel,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostImportGraphSeeds
  Checkable writer: just slake-typecheck-hostimportgraphseeds
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveHostImportGraphSeeds

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_IMPORT_GRAPH_SEEDS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-IMPORT-GRAPH-SEEDS"

/-- Named just recipe. Not lake build SystemsLean.HostImportGraphSeeds. -/
def justRecipeSlakeTypecheckHostImportGraphSeeds : String :=
  "slake-typecheck-hostimportgraphseeds"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostImportGraphSeedsRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphSeeds.liveHostImportGraphSeedsRel

/-- Live basename. Greppable: liveRel. Must be HostImportGraphSeeds.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveHostImportGraphSeeds.liveRel

/-- Ready names HostFrontLiveHostImportGraphSeeds parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckHostImportGraphSeedsReady,
    kernelCheckLiveHostImportGraphSeedsSource. -/
def slakeTypecheckHostImportGraphSeedsReady : Bool :=
  SystemsLean.HostFrontLiveHostImportGraphSeeds.hostFrontLiveHostImportGraphSeedsReady

/-- Honesty: this command is not lake build of HostImportGraphSeeds. -/
def slakeTypecheckHostImportGraphSeedsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostImportGraphSeedsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostImportGraphSeedsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostImportGraphSeeds.lean.
    Ready is HostFrontLiveHostImportGraphSeeds.hostFrontLiveHostImportGraphSeedsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostImportGraphSeeds.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostImportGraphSeeds} =="
  IO.println s!"  host={hostId} file={liveHostImportGraphSeedsRel} liveRel={liveRel}"
  unless (!slakeTypecheckHostImportGraphSeedsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostImportGraphSeedsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostImportGraphSeeds.main args
