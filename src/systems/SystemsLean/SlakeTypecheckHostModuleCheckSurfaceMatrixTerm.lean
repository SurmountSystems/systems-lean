/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSurfaceMatrixTerm.
  Short role: named driver for the HostModuleCheckSurfaceMatrixTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckSurfaceMatrixTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckSurfaceMatrixTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckSurfaceMatrixTerm.
  liveRel is HostModuleCheckSurfaceMatrixTerm.lean.
  This wrap is HostModuleCheckSurfaceMatrixTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_SURFACE_MATRIX_TERM,
  slake-typecheck-hostmodulechecksurfacematrixterm,
  slakeTypecheckHostModuleCheckSurfaceMatrixTermReady,
  kernelCheckLiveHostModuleCheckSurfaceMatrixTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSurfaceMatrixTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckSurfaceMatrixTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_SURFACE_MATRIX_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckSurfaceMatrixTerm : String :=
  "slake-typecheck-hostmodulechecksurfacematrixterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckSurfaceMatrixTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource.liveHostModuleCheckSurfaceMatrixTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSurfaceMatrixTermReady. -/
def slakeTypecheckHostModuleCheckSurfaceMatrixTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource.hostFrontLiveHostModuleCheckSurfaceMatrixTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSurfaceMatrixTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSurfaceMatrixTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckSurfaceMatrixTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSurfaceMatrixTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSurfaceMatrixTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSurfaceMatrixTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSurfaceMatrixTermRel}"
  unless (!slakeTypecheckHostModuleCheckSurfaceMatrixTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSurfaceMatrixTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSurfaceMatrixTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource.main args
