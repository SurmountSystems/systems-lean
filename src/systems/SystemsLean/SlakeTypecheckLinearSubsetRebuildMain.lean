/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-linearsubsetrebuildmain.
  Ready is HostFrontLiveLinearSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live LinearSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.LinearSubsetRebuildMain.
  Not mill 33 remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckLinearSubsetRebuildMain is not a prefix):
  SlakeTypecheckLinearSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_LINEAR_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-linearsubsetrebuildmain
  PARSE-LIVE-LINEAR-SUBSET-REBUILD-MAIN
  LINEAR-SUBSET-REBUILD-MAIN
  HOST-LINEAR-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-linearsubsetrebuildmain,
  slakeTypecheckLinearSubsetRebuildMainReady,
  kernelCheckLiveLinearSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLinearSubsetRebuildMain
  Checkable writer: just slake-typecheck-linearsubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLinearSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LinearSubsetRebuildMain. -/
def justRecipeSlakeTypecheckLinearSubsetRebuildMain : String :=
  "slake-typecheck-linearsubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveLinearSubsetRebuildMain.liveLinearSubsetRebuildMainRel

/-- Ready names HostFrontLiveLinearSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLinearSubsetRebuildMainReady,
    kernelCheckLiveLinearSubsetRebuildMainSource. -/
def slakeTypecheckLinearSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveLinearSubsetRebuildMain.hostFrontLiveLinearSubsetRebuildMainReady

/-- Honesty: this command is not lake build of LinearSubsetRebuildMain. -/
def slakeTypecheckLinearSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearSubsetRebuildMain.lean.
    Ready is HostFrontLiveLinearSubsetRebuildMain.hostFrontLiveLinearSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLinearSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearSubsetRebuildMain} =="
  IO.println s!"  host={hostId} file={liveLinearSubsetRebuildMainRel}"
  unless (!slakeTypecheckLinearSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearSubsetRebuildMain.main args
