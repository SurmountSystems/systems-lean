/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SurfaceMatrix.
  Short role: named driver for just slake-typecheck-surfacematrix.
  Ready is HostFrontLiveSurfaceMatrix parse plus HostKernel.kernelCheck
  of live SurfaceMatrix.lean, not := true, not lake build
  SystemsLean.SurfaceMatrix.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so HostFrontLiveSurface is not a prefix):
  SlakeTypecheckSurfaceMatrix
  HOST-SLAKE-TYPECHECK-SURFACE-MATRIX
  SLAKE_TYPECHECK_SURFACE_MATRIX_V0
  PARSE-LIVE-SURFACE-MATRIX
  slake-typecheck-surfacematrix
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-surfacematrix,
  slakeTypecheckSurfaceMatrixReady,
  kernelCheckLiveSurfaceMatrixSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckSurfaceMatrix
  Checkable writer: just slake-typecheck-surfacematrix
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveSurfaceMatrix

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SURFACE_MATRIX_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SURFACE-MATRIX"

/-- Named just recipe. Not lake build SystemsLean.SurfaceMatrix. -/
def justRecipeSlakeTypecheckSurfaceMatrix : String :=
  "slake-typecheck-surfacematrix"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSurfaceMatrixRel : String :=
  SystemsLean.HostFrontLiveSurfaceMatrix.liveSurfaceMatrixRel

/-- Ready names HostFrontLiveSurfaceMatrix parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSurfaceMatrixReady,
    kernelCheckLiveSurfaceMatrixSource. -/
def slakeTypecheckSurfaceMatrixReady : Bool :=
  SystemsLean.HostFrontLiveSurfaceMatrix.hostFrontLiveSurfaceMatrixReady

/-- Honesty: this command is not lake build of SurfaceMatrix. -/
def slakeTypecheckSurfaceMatrixDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSurfaceMatrixFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSurfaceMatrixOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SurfaceMatrix.lean.
    Ready is HostFrontLiveSurfaceMatrix.hostFrontLiveSurfaceMatrixReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSurfaceMatrix.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSurfaceMatrix} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSurfaceMatrix.liveRel}"
  IO.println s!"  host={hostId} file={liveSurfaceMatrixRel}"
  unless (!slakeTypecheckSurfaceMatrixFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSurfaceMatrixOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSurfaceMatrix.main args
