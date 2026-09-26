/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRestSurface.
  Short role: named driver for lean --run of
  HostModuleCheckRestSurface.lean.
  Ready is HostFrontLiveHostModuleCheckRestSurface parse plus
  HostKernel.kernelCheck of live HostModuleCheckRestSurface.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckRestSurface.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckRestSurface
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKRESTSURFACE
  SLAKE_TYPECHECK_HOSTMODULECHECKRESTSURFACE_V0
  PARSE-LIVE-HOSTMODULECHECKRESTSURFACE
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckrestsurface,
  slakeTypecheckHostModuleCheckRestSurfaceReady,
  kernelCheckLiveHostModuleCheckRestSurfaceSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRestSurface
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRestSurface

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKRESTSURFACE_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKRESTSURFACE"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckRestSurface.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckRestSurface : String :=
  "slake-typecheck-hostmodulecheckrestsurface"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRestSurfaceRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRestSurface.liveHostModuleCheckRestSurfaceRel

/-- Ready names HostFrontLiveHostModuleCheckRestSurface parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckRestSurfaceReady,
    kernelCheckLiveHostModuleCheckRestSurfaceSource. -/
def slakeTypecheckHostModuleCheckRestSurfaceReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRestSurface.hostFrontLiveHostModuleCheckRestSurfaceReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRestSurfaceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRestSurfaceFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRestSurfaceOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRestSurface.lean.
    Ready is hostFrontLiveHostModuleCheckRestSurfaceReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckRestSurface.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRestSurface} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRestSurface.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRestSurfaceRel}"
  unless (!slakeTypecheckHostModuleCheckRestSurfaceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRestSurfaceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckRestSurfaceDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRestSurface.main args
