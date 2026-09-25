/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckSelfApplyFsTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckSelfApplyFsTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckSelfApplyFsTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckSelfApplyFsTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckSelfApplyFsTerm.
  liveRel is HostModuleCheckSelfApplyFsTerm.lean.
  This wrap is HostModuleCheckSelfApplyFsTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSELFAPPLYFSTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKSELFAPPLYFSTERM,
  slake-typecheck-hostmodulecheckselfapplyfsterm,
  slakeTypecheckHostModuleCheckSelfApplyFsTermReady,
  kernelCheckLiveHostModuleCheckSelfApplyFsTermSource,
  PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckSelfApplyFsTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckSelfApplyFsTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKSELFAPPLYFSTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKSELFAPPLYFSTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckSelfApplyFsTerm : String :=
  "slake-typecheck-hostmodulecheckselfapplyfsterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSelfApplyFsTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm.liveHostModuleCheckSelfApplyFsTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckSelfApplyFsTermReady,
    kernelCheckLiveHostModuleCheckSelfApplyFsTermSource. -/
def slakeTypecheckHostModuleCheckSelfApplyFsTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm.hostFrontLiveHostModuleCheckSelfApplyFsTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckSelfApplyFsTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckSelfApplyFsTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckSelfApplyFsTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckSelfApplyFsTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckSelfApplyFsTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckSelfApplyFsTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckSelfApplyFsTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckSelfApplyFsTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckSelfApplyFsTermRel}"
  unless (!slakeTypecheckHostModuleCheckSelfApplyFsTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSelfApplyFsTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckSelfApplyFsTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckSelfApplyFsTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm.main args
