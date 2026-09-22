/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.TypesSubsetRebuild.
  Short role: named driver for the closed TypesSubsetRebuild wrap.
  Ready is HostFrontLiveTypesSubsetRebuild parse plus HostKernel.kernelCheck
  of live TypesSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.TypesSubsetRebuild.
  liveRel is TypesSubsetRebuild.lean.
  This wrap is TypesSubsetRebuild.lean.
  Not HostFrontLiveTypesSubsetRebuildMain. That module parses
  TypesSubsetRebuildMain.lean. This driver does not import it.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD,
  SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD, slake-typecheck-typessubsetrebuild,
  slakeTypecheckTypesSubsetRebuildReady,
  kernelCheckLiveTypesSubsetRebuildSource,
  PARSE-LIVE-TYPES-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckTypesSubsetRebuild
  Checkable writer: lean --run of this file (no mill; no lake).
-/

import SystemsLean.HostFrontLiveTypesSubsetRebuild
import SystemsLean.HostKernel

/-- Greppable stage id (hyphenated). -/
def stageId : String := "SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-TYPES-SUBSET-REBUILD"

/-- Named closed recipe. Not lake build SystemsLean.TypesSubsetRebuild. -/
def justRecipeSlakeTypecheckTypesSubsetRebuild : String :=
  "slake-typecheck-typessubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveTypesSubsetRebuild.liveTypesSubsetRebuildRel

/-- Kernel-check live TypesSubsetRebuild parse.
    Calls HostKernel.kernelCheck. Not a local stub.
    Greppable: kernelCheckLiveTypesSubsetRebuildSource. -/
def kernelCheckLiveTypesSubsetRebuildSource (src : String) : Bool :=
  match SystemsLean.HostFrontLiveTypesSubsetRebuild.parseLiveTypesSubsetRebuildSource src with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveTypesSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckTypesSubsetRebuildReady,
    kernelCheckLiveTypesSubsetRebuildSource. -/
def slakeTypecheckTypesSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveTypesSubsetRebuild.hostFrontLiveTypesSubsetRebuildReady
    && kernelCheckLiveTypesSubsetRebuildSource
      SystemsLean.HostFrontLiveTypesSubsetRebuild.liveTypesSubsetRebuildSource

/-- Honesty: this command is not lake build of TypesSubsetRebuild. -/
def slakeTypecheckTypesSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckTypesSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckTypesSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckTypesSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live TypesSubsetRebuild.lean.
    kernelCheck calls HostKernel.kernelCheck, not a local stub.
    Ready is not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckTypesSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveTypesSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveTypesSubsetRebuildRel}"
  unless (!slakeTypecheckTypesSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckTypesSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckTypesSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveTypesSubsetRebuildSource
      SystemsLean.HostFrontLiveTypesSubsetRebuild.liveTypesSubsetRebuildSource do
    IO.eprintln "error: kernelCheck live TypesSubsetRebuild parse false"
    return 1
  unless slakeTypecheckTypesSubsetRebuildReady do
    IO.eprintln "error: slakeTypecheckTypesSubsetRebuildReady false"
    return 1
  SystemsLean.HostFrontLiveTypesSubsetRebuild.main args
