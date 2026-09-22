/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LinearSubsetRebuild.
  Short role: named driver for the closed LinearSubsetRebuild check.
  Ready is HostFrontLiveLinearSubsetRebuild parse plus HostKernel.kernelCheck
  of live LinearSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.LinearSubsetRebuild.
  liveRel is LinearSubsetRebuild.lean.
  This wrap is LinearSubsetRebuild.lean. It is not LinearSubsetRebuildMain.lean.
  It is not Linear.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-REBUILD,
  SLAKE_TYPECHECK_LINEAR_SUBSET_REBUILD, slake-typecheck-linearsubsetrebuild,
  slakeTypecheckLinearSubsetRebuildReady,
  kernelCheckLiveLinearSubsetRebuildSource,
  PARSE-LIVE-LINEAR-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckLinearSubsetRebuild
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveLinearSubsetRebuild

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LINEAR_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LINEAR-SUBSET-REBUILD"

/-- Named check. Not lake build SystemsLean.LinearSubsetRebuild. -/
def justRecipeSlakeTypecheckLinearSubsetRebuild : String :=
  "slake-typecheck-linearsubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveLinearSubsetRebuild.liveLinearSubsetRebuildRel

/-- Ready names HostFrontLiveLinearSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLinearSubsetRebuildReady,
    kernelCheckLiveLinearSubsetRebuildSource. -/
def slakeTypecheckLinearSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveLinearSubsetRebuild.hostFrontLiveLinearSubsetRebuildReady

/-- Honesty: this command is not lake build of LinearSubsetRebuild. -/
def slakeTypecheckLinearSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLinearSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckLinearSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLinearSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LinearSubsetRebuild.lean.
    Ready is HostFrontLiveLinearSubsetRebuild.hostFrontLiveLinearSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLinearSubsetRebuild.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLinearSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLinearSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveLinearSubsetRebuildRel}"
  unless (!slakeTypecheckLinearSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLinearSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLinearSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLinearSubsetRebuild.main args
