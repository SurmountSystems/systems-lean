/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckFirstSurfaceTerm.
  Short role: named driver for lean --run of
  HostModuleCheckFirstSurfaceTerm.lean.
  Ready is HostFrontLiveHostModuleCheckFirstSurfaceTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckFirstSurfaceTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckFirstSurfaceTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckFirstSurfaceTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIRSTSURFACETERM
  SLAKE_TYPECHECK_HOSTMODULECHECKFIRSTSURFACETERM_V0
  PARSE-LIVE-HOSTMODULECHECKFIRSTSURFACETERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckfirstsurfaceterm,
  slakeTypecheckHostModuleCheckFirstSurfaceTermReady,
  kernelCheckLiveHostModuleCheckFirstSurfaceTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckFirstSurfaceTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKFIRSTSURFACETERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKFIRSTSURFACETERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckFirstSurfaceTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckFirstSurfaceTerm : String :=
  "slake-typecheck-hostmodulecheckfirstsurfaceterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckFirstSurfaceTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm.liveHostModuleCheckFirstSurfaceTermRel

/-- Ready names HostFrontLiveHostModuleCheckFirstSurfaceTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckFirstSurfaceTermReady,
    kernelCheckLiveHostModuleCheckFirstSurfaceTermSource. -/
def slakeTypecheckHostModuleCheckFirstSurfaceTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm.hostFrontLiveHostModuleCheckFirstSurfaceTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckFirstSurfaceTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckFirstSurfaceTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckFirstSurfaceTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckFirstSurfaceTerm.lean.
    Ready is hostFrontLiveHostModuleCheckFirstSurfaceTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckFirstSurfaceTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckFirstSurfaceTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckFirstSurfaceTermRel}"
  unless (!slakeTypecheckHostModuleCheckFirstSurfaceTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckFirstSurfaceTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckFirstSurfaceTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm.main args
