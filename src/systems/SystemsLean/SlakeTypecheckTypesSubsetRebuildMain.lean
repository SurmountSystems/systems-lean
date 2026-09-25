/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TypesSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-typessubsetrebuildmain.
  Ready is HostFrontLiveTypesSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live TypesSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.TypesSubsetRebuildMain.
  Not mill 35 remill. Not occupancy name 50. Not FullHost.
  This wrap is not TypesSubsetEmitMain.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckTypesSubsetRebuildMain is not a prefix):
  SlakeTypecheckTypesSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_TYPES_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-typessubsetrebuildmain
  PARSE-LIVE-TYPES-SUBSET-REBUILD-MAIN
  TYPES-SUBSET-REBUILD-MAIN
  HOST-TYPES-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-typessubsetrebuildmain,
  slakeTypecheckTypesSubsetRebuildMainReady,
  kernelCheckLiveTypesSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckTypesSubsetRebuildMain
  Checkable writer: just slake-typecheck-typessubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveTypesSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_TYPES_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.TypesSubsetRebuildMain. -/
def justRecipeSlakeTypecheckTypesSubsetRebuildMain : String :=
  "slake-typecheck-typessubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveTypesSubsetRebuildMain.liveTypesSubsetRebuildMainRel

/-- Ready names HostFrontLiveTypesSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckTypesSubsetRebuildMainReady,
    kernelCheckLiveTypesSubsetRebuildMainSource. -/
def slakeTypecheckTypesSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveTypesSubsetRebuildMain.hostFrontLiveTypesSubsetRebuildMainReady

/-- Honesty: this command is not lake build of TypesSubsetRebuildMain. -/
def slakeTypecheckTypesSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TypesSubsetRebuildMain.lean.
    Ready is HostFrontLiveTypesSubsetRebuildMain.hostFrontLiveTypesSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveTypesSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypesSubsetRebuildMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveTypesSubsetRebuildMain.liveRel}"
  IO.println s!"  host={hostId} file={liveTypesSubsetRebuildMainRel}"
  unless (!slakeTypecheckTypesSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveTypesSubsetRebuildMain.main args
