/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-multsubsetrebuildmain.
  Ready is HostFrontLiveMultSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live MultSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.MultSubsetRebuildMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckMultSubsetRebuildMain is not a prefix):
  SlakeTypecheckMultSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-MULT-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_MULT_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-multsubsetrebuildmain
  PARSE-LIVE-MULT-SUBSET-REBUILD-MAIN
  MULT-SUBSET-REBUILD-MAIN
  HOST-MULT-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-multsubsetrebuildmain,
  slakeTypecheckMultSubsetRebuildMainReady,
  kernelCheckLiveMultSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckMultSubsetRebuildMain
  Checkable writer: just slake-typecheck-multsubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveMultSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.MultSubsetRebuildMain. -/
def justRecipeSlakeTypecheckMultSubsetRebuildMain : String :=
  "slake-typecheck-multsubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveMultSubsetRebuildMain.liveMultSubsetRebuildMainRel

/-- Ready names HostFrontLiveMultSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckMultSubsetRebuildMainReady,
    kernelCheckLiveMultSubsetRebuildMainSource. -/
def slakeTypecheckMultSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveMultSubsetRebuildMain.hostFrontLiveMultSubsetRebuildMainReady

/-- Honesty: this command is not lake build of MultSubsetRebuildMain. -/
def slakeTypecheckMultSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live MultSubsetRebuildMain.lean.
    Ready is HostFrontLiveMultSubsetRebuildMain.hostFrontLiveMultSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveMultSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultSubsetRebuildMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultSubsetRebuildMain.liveRel}"
  IO.println s!"  host={hostId} file={liveMultSubsetRebuildMainRel}"
  unless (!slakeTypecheckMultSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveMultSubsetRebuildMain.main args
