/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.GraphSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-graphsubsetrebuildmain.
  Ready is HostFrontLiveGraphSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live GraphSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.GraphSubsetRebuildMain.
  Not mill 33 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckGraphSubsetRebuildMain is not a prefix):
  SlakeTypecheckGraphSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_GRAPH_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-graphsubsetrebuildmain
  PARSE-LIVE-GRAPH-SUBSET-REBUILD-MAIN
  GRAPH-SUBSET-REBUILD-MAIN
  HOST-GRAPH-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-graphsubsetrebuildmain,
  slakeTypecheckGraphSubsetRebuildMainReady,
  kernelCheckLiveGraphSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckGraphSubsetRebuildMain
  Checkable writer: just slake-typecheck-graphsubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveGraphSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_GRAPH_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-GRAPH-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.GraphSubsetRebuildMain. -/
def justRecipeSlakeTypecheckGraphSubsetRebuildMain : String :=
  "slake-typecheck-graphsubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveGraphSubsetRebuildMain.liveGraphSubsetRebuildMainRel

/-- Ready names HostFrontLiveGraphSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckGraphSubsetRebuildMainReady,
    kernelCheckLiveGraphSubsetRebuildMainSource. -/
def slakeTypecheckGraphSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveGraphSubsetRebuildMain.hostFrontLiveGraphSubsetRebuildMainReady

/-- Honesty: this command is not lake build of GraphSubsetRebuildMain. -/
def slakeTypecheckGraphSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckGraphSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckGraphSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live GraphSubsetRebuildMain.lean.
    Ready is HostFrontLiveGraphSubsetRebuildMain.hostFrontLiveGraphSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveGraphSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckGraphSubsetRebuildMain} =="
  IO.println s!"  host={hostId} file={liveGraphSubsetRebuildMainRel}"
  unless (!slakeTypecheckGraphSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckGraphSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveGraphSubsetRebuildMain.main args
