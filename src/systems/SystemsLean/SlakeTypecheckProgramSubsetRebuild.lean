/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.ProgramSubsetRebuild.
  Short role: named driver for the closed ProgramSubsetRebuild check.
  Ready is HostFrontLiveProgramSubsetRebuild parse plus HostKernel.kernelCheck
  of live ProgramSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.ProgramSubsetRebuild.
  liveRel is ProgramSubsetRebuild.lean.
  This wrap is ProgramSubsetRebuild.lean. Theorems and examples in that file
  are skipped. It is not ProgramSubsetRebuildMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-REBUILD,
  SLAKE_TYPECHECK_PROGRAM_SUBSET_REBUILD, slake-typecheck-programsubsetrebuild,
  slakeTypecheckProgramSubsetRebuildReady,
  kernelCheckLiveProgramSubsetRebuildSource,
  PARSE-LIVE-PROGRAM-SUBSET-REBUILD, PROGRAM-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckProgramSubsetRebuild
  Checkable writer: lean --run of this driver (no mill; no lake).
-/

import SystemsLean.HostFrontLiveProgramSubsetRebuild

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROGRAM_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-REBUILD"

/-- Closed-check name. Not lake build SystemsLean.ProgramSubsetRebuild.
    Not a just module. -/
def justRecipeSlakeTypecheckProgramSubsetRebuild : String :=
  "slake-typecheck-programsubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveProgramSubsetRebuild.liveProgramSubsetRebuildRel

/-- Ready names HostFrontLiveProgramSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProgramSubsetRebuildReady,
    kernelCheckLiveProgramSubsetRebuildSource. -/
def slakeTypecheckProgramSubsetRebuildReady : Bool :=
  SystemsLean.HostFrontLiveProgramSubsetRebuild.hostFrontLiveProgramSubsetRebuildReady

/-- Honesty: this command is not lake build of ProgramSubsetRebuild. -/
def slakeTypecheckProgramSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProgramSubsetRebuildFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProgramSubsetRebuildFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProgramSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProgramSubsetRebuild.lean.
    Ready is HostFrontLiveProgramSubsetRebuild.hostFrontLiveProgramSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProgramSubsetRebuild.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProgramSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProgramSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveProgramSubsetRebuildRel}"
  unless (!slakeTypecheckProgramSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProgramSubsetRebuildFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProgramSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProgramSubsetRebuild.main args
