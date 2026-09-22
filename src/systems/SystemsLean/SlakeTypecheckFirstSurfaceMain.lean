/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FirstSurfaceMain.
  Short role: named driver for just slake-typecheck-firstsurfacemain.
  Ready is HostFrontLiveFirstSurfaceMain parse plus HostKernel.kernelCheck
  of live FirstSurfaceMain.lean, not := true, not lake build
  SystemsLean.FirstSurfaceMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  HostFrontLiveFirstSurface wraps FirstSurface.lean, not this mill Main.
  Unique needles (trailing newline so SlakeTypecheckFirstSurfaceMain is not a prefix):
  SlakeTypecheckFirstSurfaceMain
  HOST-SLAKE-TYPECHECK-FIRST-SURFACE-MAIN
  SLAKE_TYPECHECK_FIRST_SURFACE_MAIN_V0
  PARSE-LIVE-FIRST-SURFACE-MAIN
  FIRST-SURFACE-MAIN
  slake-typecheck-firstsurfacemain
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-firstsurfacemain,
  slakeTypecheckFirstSurfaceMainReady,
  kernelCheckLiveFirstSurfaceMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckFirstSurfaceMain
  Checkable writer: just slake-typecheck-firstsurfacemain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveFirstSurfaceMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FIRST_SURFACE_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FIRST-SURFACE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.FirstSurfaceMain. -/
def justRecipeSlakeTypecheckFirstSurfaceMain : String :=
  "slake-typecheck-firstsurfacemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFirstSurfaceMainRel : String :=
  SystemsLean.HostFrontLiveFirstSurfaceMain.liveFirstSurfaceMainRel

/-- Ready names HostFrontLiveFirstSurfaceMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckFirstSurfaceMainReady,
    kernelCheckLiveFirstSurfaceMainSource. -/
def slakeTypecheckFirstSurfaceMainReady : Bool :=
  SystemsLean.HostFrontLiveFirstSurfaceMain.hostFrontLiveFirstSurfaceMainReady

/-- Honesty: this command is not lake build of FirstSurfaceMain. -/
def slakeTypecheckFirstSurfaceMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFirstSurfaceMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFirstSurfaceMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FirstSurfaceMain.lean.
    Ready is HostFrontLiveFirstSurfaceMain.hostFrontLiveFirstSurfaceMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveFirstSurfaceMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFirstSurfaceMain} =="
  IO.println s!"  host={hostId} file={liveFirstSurfaceMainRel}"
  unless (!slakeTypecheckFirstSurfaceMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFirstSurfaceMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFirstSurfaceMain.main args
