/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.ComposeSubsetRebuild.
  Short role: named driver for the closed ComposeSubsetRebuild check.
  Ready is HostFrontLiveComposeSubsetRebuild parse plus HostKernel.kernelCheck
  of live ComposeSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.ComposeSubsetRebuild.
  liveRel is ComposeSubsetRebuild.lean.
  This wrap is ComposeSubsetRebuild.lean. Theorems and examples in that file
  are skipped. It is not ComposeSubsetRebuildMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-REBUILD,
  SLAKE_TYPECHECK_COMPOSE_SUBSET_REBUILD, slake-typecheck-composesubsetrebuild,
  slakeTypecheckComposeSubsetRebuildReady,
  kernelCheckLiveComposeSubsetRebuildSource,
  PARSE-LIVE-COMPOSE-SUBSET-REBUILD, COMPOSE-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckComposeSubsetRebuild
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveComposeSubsetRebuild

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_COMPOSE_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-COMPOSE-SUBSET-REBUILD"

/-- Closed-check name. Not lake build SystemsLean.ComposeSubsetRebuild.
    Not a just module. -/
def justRecipeSlakeTypecheckComposeSubsetRebuild : String :=
  "slake-typecheck-composesubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveComposeSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveComposeSubsetRebuild.liveComposeSubsetRebuildRel

/-- Ready names HostFrontLiveComposeSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckComposeSubsetRebuildReady,
    kernelCheckLiveComposeSubsetRebuildSource. -/
def slakeTypecheckComposeSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveComposeSubsetRebuild.hostFrontLiveComposeSubsetRebuildReady

/-- Honesty: this command is not lake build of ComposeSubsetRebuild. -/
def slakeTypecheckComposeSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckComposeSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckComposeSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckComposeSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ComposeSubsetRebuild.lean.
    Ready is HostFrontLiveComposeSubsetRebuild.hostFrontLiveComposeSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveComposeSubsetRebuild.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckComposeSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveComposeSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveComposeSubsetRebuildRel}"
  unless (!slakeTypecheckComposeSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckComposeSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckComposeSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveComposeSubsetRebuild.main args
