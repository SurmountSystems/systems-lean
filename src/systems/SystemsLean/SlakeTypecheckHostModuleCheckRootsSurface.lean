/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRootsSurface.
  Short role: named driver for lean --run of
  HostModuleCheckRootsSurface.lean.
  Ready is HostFrontLiveHostModuleCheckRootsSurface parse plus
  HostKernel.kernelCheck of live HostModuleCheckRootsSurface.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckRootsSurface.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckRootsSurface
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKROOTSSURFACE
  SLAKE_TYPECHECK_HOSTMODULECHECKROOTSSURFACE_V0
  PARSE-LIVE-HOSTMODULECHECKROOTSSURFACE
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckrootssurface,
  slakeTypecheckHostModuleCheckRootsSurfaceReady,
  kernelCheckLiveHostModuleCheckRootsSurfaceSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRootsSurface
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRootsSurface

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKROOTSSURFACE_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKROOTSSURFACE"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckRootsSurface.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckRootsSurface : String :=
  "slake-typecheck-hostmodulecheckrootssurface"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRootsSurfaceRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRootsSurface.liveHostModuleCheckRootsSurfaceRel

/-- Ready names HostFrontLiveHostModuleCheckRootsSurface parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckRootsSurfaceReady,
    kernelCheckLiveHostModuleCheckRootsSurfaceSource. -/
def slakeTypecheckHostModuleCheckRootsSurfaceReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRootsSurface.hostFrontLiveHostModuleCheckRootsSurfaceReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRootsSurfaceDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRootsSurfaceFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRootsSurfaceOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRootsSurface.lean.
    Ready is hostFrontLiveHostModuleCheckRootsSurfaceReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckRootsSurface.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRootsSurface} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRootsSurface.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRootsSurfaceRel}"
  unless (!slakeTypecheckHostModuleCheckRootsSurfaceFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRootsSurfaceOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckRootsSurfaceDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRootsSurface.main args
