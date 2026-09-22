/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckSurface.
  Short role: named driver for just slake-typecheck-surface.
  Ready is HostFrontLiveSurface parse plus HostKernel.kernelCheck of live
  HostModuleCheckSurface.lean, not := true, not lake build
  SystemsLean.HostModuleCheckSurface.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SURFACE,
  SLAKE_TYPECHECK_SURFACE_V0, slake-typecheck-surface,
  slakeTypecheckSurfaceReady, kernelCheckLiveSurfaceSource,
  PARSE-LIVE-SURFACE, SKELETON.
  Module: SystemsLean.SlakeTypecheckSurface
  Checkable writer: just slake-typecheck-surface (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveSurface

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SURFACE"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckSurface. -/
def justRecipeSlakeTypecheckSurface : String :=
  "slake-typecheck-surface"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSurfaceRel : String :=
  SystemsLean.HostFrontLiveSurface.liveSurfaceRel

/-- Ready names HostFrontLiveSurface parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckSurfaceReady,
    kernelCheckLiveSurfaceSource. -/
def slakeTypecheckSurfaceReady : Bool :=
  SystemsLean.HostFrontLiveSurface.hostFrontLiveSurfaceReady

/-- Honesty: this command is not lake build of HostModuleCheckSurface. -/
def slakeTypecheckSurfaceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSurfaceFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSurfaceOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckSurface.lean.
    Ready is HostFrontLiveSurface.hostFrontLiveSurfaceReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSurface.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSurface} =="
  IO.println s!"  host={hostId} file={liveSurfaceRel}"
  unless (!slakeTypecheckSurfaceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSurfaceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSurface.main args
