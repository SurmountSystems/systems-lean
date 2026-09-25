/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRequiredDeclsLater.
  Short role: named driver for lean --run of the
  HostModuleCheckRequiredDeclsLater.lean wrap.
  Ready is HostFrontLiveHostModuleCheckRequiredDeclsLater parse plus
  HostKernel.kernelCheck of live HostModuleCheckRequiredDeclsLater.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckRequiredDeclsLater.
  liveRel is HostModuleCheckRequiredDeclsLater.lean.
  This wrap is HostModuleCheckRequiredDeclsLater.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckRequiredDeclsKernel.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLSLATER,
  SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLSLATER,
  slake-typecheck-hostmodulecheckrequireddeclslater,
  slakeTypecheckHostModuleCheckRequiredDeclsLaterReady,
  kernelCheckLiveHostModuleCheckRequiredDeclsLaterSource,
  PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSLATER.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRequiredDeclsLater
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckRequiredDeclsLater.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLSLATER"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLSLATER"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckRequiredDeclsLater :
    String :=
  "slake-typecheck-hostmodulecheckrequireddeclslater"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRequiredDeclsLaterRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater.liveHostModuleCheckRequiredDeclsLaterRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckRequiredDeclsLaterReady,
    kernelCheckLiveHostModuleCheckRequiredDeclsLaterSource. -/
def slakeTypecheckHostModuleCheckRequiredDeclsLaterReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater.hostFrontLiveHostModuleCheckRequiredDeclsLaterReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRequiredDeclsLaterDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsLaterFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckRequiredDeclsLaterFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsLaterOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRequiredDeclsLater.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckRequiredDeclsLaterReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckRequiredDeclsLater.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRequiredDeclsLater} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRequiredDeclsLaterRel}"
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsLaterFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsLaterFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsLaterOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckRequiredDeclsLaterDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater.main args
