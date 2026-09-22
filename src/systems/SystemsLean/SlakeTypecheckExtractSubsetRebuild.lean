/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.ExtractSubsetRebuild.
  Short role: named driver for the closed ExtractSubsetRebuild check.
  Ready is HostFrontLiveExtractSubsetRebuild parse plus HostKernel.kernelCheck
  of live ExtractSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.ExtractSubsetRebuild.
  liveRel is ExtractSubsetRebuild.lean.
  This wrap is ExtractSubsetRebuild.lean. Theorems and examples in that file
  are skipped. It is not ExtractSubsetRebuildMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-REBUILD,
  SLAKE_TYPECHECK_EXTRACT_SUBSET_REBUILD, slake-typecheck-extractsubsetrebuild,
  slakeTypecheckExtractSubsetRebuildReady,
  kernelCheckLiveExtractSubsetRebuildSource,
  PARSE-LIVE-EXTRACT-SUBSET-REBUILD, EXTRACT-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckExtractSubsetRebuild
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveExtractSubsetRebuild

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_EXTRACT_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-EXTRACT-SUBSET-REBUILD"

/-- Closed-check name. Not lake build SystemsLean.ExtractSubsetRebuild.
    Not a just module. -/
def justRecipeSlakeTypecheckExtractSubsetRebuild : String :=
  "slake-typecheck-extractsubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveExtractSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveExtractSubsetRebuild.liveExtractSubsetRebuildRel

/-- Ready names HostFrontLiveExtractSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckExtractSubsetRebuildReady,
    kernelCheckLiveExtractSubsetRebuildSource. -/
def slakeTypecheckExtractSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveExtractSubsetRebuild.hostFrontLiveExtractSubsetRebuildReady

/-- Honesty: this command is not lake build of ExtractSubsetRebuild. -/
def slakeTypecheckExtractSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckExtractSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckExtractSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckExtractSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ExtractSubsetRebuild.lean.
    Ready is HostFrontLiveExtractSubsetRebuild.hostFrontLiveExtractSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveExtractSubsetRebuild.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckExtractSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveExtractSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveExtractSubsetRebuildRel}"
  unless (!slakeTypecheckExtractSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckExtractSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckExtractSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveExtractSubsetRebuild.main args
