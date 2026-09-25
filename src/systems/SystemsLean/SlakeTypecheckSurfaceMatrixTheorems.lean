/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SurfaceMatrixTheorems.
  Short role: named driver for just slake-typecheck-surfacematrixtheorems.
  Ready is HostFrontLiveSurfaceMatrixTheorems parse plus HostKernel.kernelCheck
  of live SurfaceMatrixTheorems.lean, not := true, not lake build
  SystemsLean.SurfaceMatrixTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SurfaceMatrix wrap is not a prefix):
  SlakeTypecheckSurfaceMatrixTheorems
  HOST-SLAKE-TYPECHECK-SURFACE-MATRIX-THEOREMS
  SLAKE_TYPECHECK_SURFACE_MATRIX_THEOREMS_V0
  PARSE-LIVE-SURFACE-MATRIX-THEOREMS
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-surfacematrixtheorems,
  slakeTypecheckSurfaceMatrixTheoremsReady,
  kernelCheckLiveSurfaceMatrixTheoremsSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckSurfaceMatrixTheorems
  Checkable writer: just slake-typecheck-surfacematrixtheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSurfaceMatrixTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SURFACE_MATRIX_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SURFACE-MATRIX-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.SurfaceMatrixTheorems. -/
def justRecipeSlakeTypecheckSurfaceMatrixTheorems : String :=
  "slake-typecheck-surfacematrixtheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSurfaceMatrixTheoremsRel : String :=
  SystemsLean.HostFrontLiveSurfaceMatrixTheorems.liveSurfaceMatrixTheoremsRel

/-- Ready names HostFrontLiveSurfaceMatrixTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSurfaceMatrixTheoremsReady,
    kernelCheckLiveSurfaceMatrixTheoremsSource. -/
def slakeTypecheckSurfaceMatrixTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveSurfaceMatrixTheorems.hostFrontLiveSurfaceMatrixTheoremsReady

/-- Honesty: this command is not lake build of SurfaceMatrixTheorems. -/
def slakeTypecheckSurfaceMatrixTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSurfaceMatrixTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSurfaceMatrixTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SurfaceMatrixTheorems.lean.
    Ready is HostFrontLiveSurfaceMatrixTheorems.hostFrontLiveSurfaceMatrixTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSurfaceMatrixTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSurfaceMatrixTheorems} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveSurfaceMatrixTheorems.liveRel}"
  IO.println s!"  host={hostId} file={liveSurfaceMatrixTheoremsRel}"
  unless (!slakeTypecheckSurfaceMatrixTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSurfaceMatrixTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSurfaceMatrixTheorems.main args
