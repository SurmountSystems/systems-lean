/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ErasureSubsetRebuild.
  Short role: named driver for the closed ErasureSubsetRebuild check.
  Ready is HostFrontLiveErasureSubsetRebuild parse plus HostKernel.kernelCheck
  of live ErasureSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.ErasureSubsetRebuild.
  liveRel is ErasureSubsetRebuild.lean.
  This wrap is ErasureSubsetRebuild.lean. It is not ErasureSubsetRebuildMain.lean.
  It is not Linear.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-REBUILD,
  SLAKE_TYPECHECK_ERASURE_SUBSET_REBUILD, slake-typecheck-erasuresubsetrebuild,
  slakeTypecheckErasureSubsetRebuildReady,
  kernelCheckLiveErasureSubsetRebuildSource,
  PARSE-LIVE-ERASURE-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckErasureSubsetRebuild
  Checkable writer: lean --run on this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveErasureSubsetRebuild

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_ERASURE_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-ERASURE-SUBSET-REBUILD"

/-- Named check. Not lake build SystemsLean.ErasureSubsetRebuild. -/
def justRecipeSlakeTypecheckErasureSubsetRebuild : String :=
  "slake-typecheck-erasuresubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveErasureSubsetRebuild.liveErasureSubsetRebuildRel

/-- Ready names HostFrontLiveErasureSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckErasureSubsetRebuildReady,
    kernelCheckLiveErasureSubsetRebuildSource. -/
def slakeTypecheckErasureSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveErasureSubsetRebuild.hostFrontLiveErasureSubsetRebuildReady

/-- Honesty: this command is not lake build of ErasureSubsetRebuild. -/
def slakeTypecheckErasureSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckErasureSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckErasureSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckErasureSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ErasureSubsetRebuild.lean.
    Ready is HostFrontLiveErasureSubsetRebuild.hostFrontLiveErasureSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveErasureSubsetRebuild.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckErasureSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveErasureSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveErasureSubsetRebuildRel}"
  unless (!slakeTypecheckErasureSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckErasureSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckErasureSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveErasureSubsetRebuild.main args
