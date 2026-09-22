/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FirstSurface.
  Short role: named driver for just slake-typecheck-firstsurface.
  Ready is HostFrontLiveFirstSurface parse plus HostKernel.kernelCheck of live
  FirstSurface.lean, not := true, not lake build SystemsLean.FirstSurface.
  Not mill. Not occupancy name 50. Not FullHost.
  Occupancy leftover HostModuleCheckFirstSurfaceTerm is not this wrap.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so FirstSurface drivers are not prefix hits):
  SlakeTypecheckFirstSurface
  HOST-SLAKE-TYPECHECK-FIRST-SURFACE
  SLAKE_TYPECHECK_FIRST_SURFACE_V0
  PARSE-LIVE-FIRST-SURFACE
  FIRST-SURFACE
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-firstsurface,
  slakeTypecheckFirstSurfaceReady,
  kernelCheckLiveFirstSurfaceSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckFirstSurface
  Checkable writer: just slake-typecheck-firstsurface
  (lean --run; no mill; no lake). Dests skipped this land.
-/

import SystemsLean.HostFrontLiveFirstSurface

/-- Greppable stage id. Hyphenated FIRST-SURFACE in the host map id. -/
def stageId : String := "SLAKE_TYPECHECK_FIRST_SURFACE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FIRST-SURFACE"

/-- Named just recipe. Not lake build SystemsLean.FirstSurface. -/
def justRecipeSlakeTypecheckFirstSurface : String :=
  "slake-typecheck-firstsurface"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFirstSurfaceRel : String :=
  SystemsLean.HostFrontLiveFirstSurface.liveFirstSurfaceRel

/-- Ready names HostFrontLiveFirstSurface parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckFirstSurfaceReady,
    kernelCheckLiveFirstSurfaceSource. -/
def slakeTypecheckFirstSurfaceReady : Bool :=
  SystemsLean.HostFrontLiveFirstSurface.hostFrontLiveFirstSurfaceReady

/-- Honesty: this command is not lake build of FirstSurface. -/
def slakeTypecheckFirstSurfaceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFirstSurfaceFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFirstSurfaceOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FirstSurface.lean.
    Ready is HostFrontLiveFirstSurface.hostFrontLiveFirstSurfaceReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveFirstSurface.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFirstSurface} =="
  IO.println s!"  host={hostId} file={liveFirstSurfaceRel}"
  unless (!slakeTypecheckFirstSurfaceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFirstSurfaceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFirstSurface.main args
