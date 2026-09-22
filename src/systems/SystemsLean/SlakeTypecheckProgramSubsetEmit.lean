/-
  SYSTEMS_LEAN_HOST. Slake typechecks live SystemsLean.ProgramSubsetEmit.
  Short role: named driver for just slake-typecheck-programsubsetemit.
  Ready is HostFrontLiveProgramSubsetEmit parse plus HostKernel.kernelCheck
  of live ProgramSubsetEmit.lean, not a hardcoded true, not lake build
  SystemsLean.ProgramSubsetEmit.
  liveRel is ProgramSubsetEmit.lean.
  This wrap is ProgramSubsetEmit.lean. Theorems and examples in that file
  are skipped. It is not ProgramSubsetEmitMain.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-EMIT,
  SLAKE_TYPECHECK_PROGRAM_SUBSET_EMIT, slake-typecheck-programsubsetemit,
  slakeTypecheckProgramSubsetEmitReady,
  kernelCheckLiveProgramSubsetEmitSource,
  PARSE-LIVE-PROGRAM-SUBSET-EMIT.
  Module: SystemsLean.SlakeTypecheckProgramSubsetEmit
  Checkable writer: just slake-typecheck-programsubsetemit
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProgramSubsetEmit

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROGRAM_SUBSET_EMIT"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROGRAM-SUBSET-EMIT"

/-- Named just recipe. Not lake build SystemsLean.ProgramSubsetEmit. -/
def justRecipeSlakeTypecheckProgramSubsetEmit : String :=
  "slake-typecheck-programsubsetemit"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramSubsetEmitRel : String :=
  SystemsLean.HostFrontLiveProgramSubsetEmit.liveProgramSubsetEmitRel

/-- Ready names HostFrontLiveProgramSubsetEmit parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckProgramSubsetEmitReady,
    kernelCheckLiveProgramSubsetEmitSource. -/
def slakeTypecheckProgramSubsetEmitReady : Bool :=
  SystemsLean.HostFrontLiveProgramSubsetEmit.hostFrontLiveProgramSubsetEmitReady

/-- Honesty: this command is not lake build of ProgramSubsetEmit. -/
def slakeTypecheckProgramSubsetEmitDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProgramSubsetEmitFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckProgramSubsetEmitFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProgramSubsetEmitOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProgramSubsetEmit.lean.
    Ready is HostFrontLiveProgramSubsetEmit.hostFrontLiveProgramSubsetEmitReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveProgramSubsetEmit.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProgramSubsetEmit} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveProgramSubsetEmit.liveRel}"
  IO.println s!"  host={hostId} file={liveProgramSubsetEmitRel}"
  unless (!slakeTypecheckProgramSubsetEmitFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProgramSubsetEmitFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckProgramSubsetEmitOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProgramSubsetEmit.main args
