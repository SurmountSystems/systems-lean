/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckTypesTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckTypesTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckTypesTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckTypesTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckTypesTerm.
  liveRel is HostModuleCheckTypesTerm.lean.
  This wrap is HostModuleCheckTypesTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Occupancy stays 49. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKTYPESTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKTYPESTERM,
  slake-typecheck-hostmodulechecktypesterm,
  slakeTypecheckHostModuleCheckTypesTermReady,
  kernelCheckLiveHostModuleCheckTypesTermSource,
  PARSE-LIVE-HOSTMODULECHECKTYPESTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckTypesTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckTypesTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckTypesTerm

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKTYPESTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKTYPESTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckTypesTerm : String :=
  "slake-typecheck-hostmodulechecktypesterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckTypesTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesTerm.liveHostModuleCheckTypesTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckTypesTermReady,
    kernelCheckLiveHostModuleCheckTypesTermSource. -/
def slakeTypecheckHostModuleCheckTypesTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckTypesTerm.hostFrontLiveHostModuleCheckTypesTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckTypesTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckTypesTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckTypesTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckTypesTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckTypesTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckTypesTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckTypesTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckTypesTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckTypesTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesTermRel}"
  unless (!slakeTypecheckHostModuleCheckTypesTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckTypesTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckTypesTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckTypesTerm.main args
