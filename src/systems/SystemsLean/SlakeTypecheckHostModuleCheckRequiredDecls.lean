/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRequiredDecls.
  Short role: named driver for lean --run of the
  HostModuleCheckRequiredDecls.lean wrap.
  Ready is HostFrontLiveHostModuleCheckRequiredDecls parse plus
  HostKernel.kernelCheck of live HostModuleCheckRequiredDecls.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckRequiredDecls.
  liveRel is HostModuleCheckRequiredDecls.lean.
  This wrap is HostModuleCheckRequiredDecls.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckRequiredDeclsLater.lean.
  It is not HostModuleCheckRequiredDeclsKernel.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLS,
  SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLS,
  slake-typecheck-hostmodulecheckrequireddecls,
  slakeTypecheckHostModuleCheckRequiredDeclsReady,
  kernelCheckLiveHostModuleCheckRequiredDeclsSource,
  PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLS.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRequiredDecls
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckRequiredDecls.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRequiredDecls

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKREQUIREDDECLS"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKREQUIREDDECLS"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckRequiredDecls : String :=
  "slake-typecheck-hostmodulecheckrequireddecls"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRequiredDeclsRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDecls.liveHostModuleCheckRequiredDeclsRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckRequiredDeclsReady,
    kernelCheckLiveHostModuleCheckRequiredDeclsSource. -/
def slakeTypecheckHostModuleCheckRequiredDeclsReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDecls.hostFrontLiveHostModuleCheckRequiredDeclsReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRequiredDeclsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckRequiredDeclsFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRequiredDeclsOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRequiredDecls.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckRequiredDeclsReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckRequiredDecls.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRequiredDecls} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRequiredDecls.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRequiredDeclsRel}"
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRequiredDeclsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckRequiredDeclsDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRequiredDecls.main args
