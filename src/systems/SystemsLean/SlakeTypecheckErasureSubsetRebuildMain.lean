/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ErasureSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-erasuresubsetrebuildmain.
  Ready is HostFrontLiveErasureSubsetRebuildMain parse plus HostKernel.kernelCheck
  of live ErasureSubsetRebuildMain.lean, not := true, not lake build
  SystemsLean.ErasureSubsetRebuildMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  This wrap is not ErasureSubsetEmitMain. This wrap is not TypesSubsetRebuildMain.
  This wrap is not HostFrontLiveErasure.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckErasureSubsetRebuildMain is not a prefix):
  SlakeTypecheckErasureSubsetRebuildMain
  HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-REBUILD-MAIN
  SLAKE_TYPECHECK_ERASURE_SUBSET_REBUILD_MAIN_V0
  slake-typecheck-erasuresubsetrebuildmain
  PARSE-LIVE-ERASURE-SUBSET-REBUILD-MAIN
  ERASURE-SUBSET-REBUILD-MAIN
  HOST-ERASURE-SUBSET-REBUILD-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-erasuresubsetrebuildmain,
  slakeTypecheckErasureSubsetRebuildMainReady,
  kernelCheckLiveErasureSubsetRebuildMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckErasureSubsetRebuildMain
  Checkable writer: just slake-typecheck-erasuresubsetrebuildmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveErasureSubsetRebuildMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_ERASURE_SUBSET_REBUILD_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ErasureSubsetRebuildMain. -/
def justRecipeSlakeTypecheckErasureSubsetRebuildMain : String :=
  "slake-typecheck-erasuresubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveErasureSubsetRebuildMain.liveErasureSubsetRebuildMainRel

/-- Ready names HostFrontLiveErasureSubsetRebuildMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckErasureSubsetRebuildMainReady,
    kernelCheckLiveErasureSubsetRebuildMainSource. -/
def slakeTypecheckErasureSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveErasureSubsetRebuildMain.hostFrontLiveErasureSubsetRebuildMainReady

/-- Honesty: this command is not lake build of ErasureSubsetRebuildMain. -/
def slakeTypecheckErasureSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckErasureSubsetRebuildMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckErasureSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ErasureSubsetRebuildMain.lean.
    Ready is HostFrontLiveErasureSubsetRebuildMain.hostFrontLiveErasureSubsetRebuildMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveErasureSubsetRebuildMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckErasureSubsetRebuildMain} =="
  IO.println s!"  host={hostId} file={liveErasureSubsetRebuildMainRel}"
  unless (!slakeTypecheckErasureSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckErasureSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveErasureSubsetRebuildMain.main args
