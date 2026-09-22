/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ExtractSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-extractsubsetrebuildmain.
  Ready is HostFrontLiveExtractSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live ExtractSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.ExtractSubsetRebuildMain.
  Not mill remill (just twenty-sixth-host-tool / inventory table row 39).
  Not occupancy name 50. Occupancy 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  This wrap parses ExtractSubsetRebuildMain.lean only. Do not wrap ExtractSubsetRebuild.lean.
  This wrap is not ExtractSubsetEmitMain. Do not steal HostFrontLiveExtractMain.
  Do not steal HostFrontLiveExtract. Not Linear. Not ComposeSubsetEmit. Not IrGraph.
  Unique needles (trailing newline so SlakeTypecheckExtractSubsetRebuildMain is not a prefix):
  SlakeTypecheckExtractSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_EXTRACT_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-extractsubsetrebuildmain
  PARSE-LIVE-EXTRACT-SUBSET-REBUILD-MAIN
  EXTRACT-SUBSET-REBUILD-MAIN
  HOST-EXTRACT-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-extractsubsetrebuildmain,
  slakeTypecheckExtractSubsetRebuildMainReady,
  kernelCheckLiveExtractSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckExtractSubsetRebuildMain
  Checkable writer: just slake-typecheck-extractsubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveExtractSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EXTRACT_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ExtractSubsetRebuildMain. -/
def justRecipeSlakeTypecheckExtractSubsetRebuildMain : String :=
  "slake-typecheck-extractsubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveExtractSubsetRebuildMain.liveExtractSubsetRebuildMainRel

/-- Ready names HostFrontLiveExtractSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckExtractSubsetRebuildMainReady,
    kernelCheckLiveExtractSubsetRebuildMainSource. -/
def slakeTypecheckExtractSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveExtractSubsetRebuildMain.hostFrontLiveExtractSubsetRebuildMainReady

/-- Honesty: this command is not lake build of ExtractSubsetRebuildMain. -/
def slakeTypecheckExtractSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckExtractSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckExtractSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ExtractSubsetRebuildMain.lean.
    Ready is HostFrontLiveExtractSubsetRebuildMain.hostFrontLiveExtractSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveExtractSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckExtractSubsetRebuildMain} =="
  IO.println s!"  host={hostId} file={liveExtractSubsetRebuildMainRel}"
  unless (!slakeTypecheckExtractSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckExtractSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveExtractSubsetRebuildMain.main args
