/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ComposeSubsetRebuildMain.
  Short role: named driver for just slake-typecheck-composesubsetrebuildmain.
  Ready is HostFrontLiveComposeSubsetRebuildMainParse parse plus HostKernel.kernelCheck
  of live ComposeSubsetRebuildMain.lean, not a hardcoded true, not lake build
  SystemsLean.ComposeSubsetRebuildMain.
  liveRel is ComposeSubsetRebuildMain.lean.
  This wrap is ComposeSubsetRebuildMain.lean. It is not ComposeSubsetRebuild.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-REBUILD-MAIN,
  SLAKE_TYPECHECK_COMPOSE_SUBSET_REBUILD_MAIN, slake-typecheck-composesubsetrebuildmain,
  slakeTypecheckComposeSubsetRebuildMainReady,
  kernelCheckLiveComposeSubsetRebuildMainSource,
  PARSE-LIVE-COMPOSE-SUBSET-REBUILD-MAIN.
  Module: SystemsLean.SlakeTypecheckComposeSubsetRebuildMain
  Checkable writer: just slake-typecheck-composesubsetrebuildmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPOSE_SUBSET_REBUILD_MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-REBUILD-MAIN"

/-- Named just recipe. Not lake build SystemsLean.ComposeSubsetRebuildMain. -/
def justRecipeSlakeTypecheckComposeSubsetRebuildMain : String :=
  "slake-typecheck-composesubsetrebuildmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveComposeSubsetRebuildMainRel : String :=
  SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse.liveComposeSubsetRebuildMainRel

/-- Ready names HostFrontLiveComposeSubsetRebuildMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckComposeSubsetRebuildMainReady,
    kernelCheckLiveComposeSubsetRebuildMainSource. -/
def slakeTypecheckComposeSubsetRebuildMainReady : Bool :=
  SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse.hostFrontLiveComposeSubsetRebuildMainReady

/-- Honesty: this command is not lake build of ComposeSubsetRebuildMain. -/
def slakeTypecheckComposeSubsetRebuildMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckComposeSubsetRebuildMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckComposeSubsetRebuildMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckComposeSubsetRebuildMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ComposeSubsetRebuildMain.lean.
    Ready is HostFrontLiveComposeSubsetRebuildMainParse.hostFrontLiveComposeSubsetRebuildMainReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveComposeSubsetRebuildMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckComposeSubsetRebuildMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse.liveRel}"
  IO.println s!"  host={hostId} file={liveComposeSubsetRebuildMainRel}"
  unless (!slakeTypecheckComposeSubsetRebuildMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckComposeSubsetRebuildMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckComposeSubsetRebuildMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveComposeSubsetRebuildMainParse.main args
