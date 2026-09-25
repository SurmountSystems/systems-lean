/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckParityTypesTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckParityTypesTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckParityTypesTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckParityTypesTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckParityTypesTerm.
  liveRel is HostModuleCheckParityTypesTerm.lean.
  This wrap is HostModuleCheckParityTypesTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYTYPESTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPARITYTYPESTERM,
  slake-typecheck-hostmodulecheckparitytypesterm,
  slakeTypecheckHostModuleCheckParityTypesTermReady,
  kernelCheckLiveHostModuleCheckParityTypesTermSource,
  PARSE-LIVE-HOSTMODULECHECKPARITYTYPESTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckParityTypesTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckParityTypesTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPARITYTYPESTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPARITYTYPESTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckParityTypesTerm :
    String :=
  "slake-typecheck-hostmodulecheckparitytypesterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckParityTypesTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm.liveHostModuleCheckParityTypesTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckParityTypesTermReady,
    kernelCheckLiveHostModuleCheckParityTypesTermSource. -/
def slakeTypecheckHostModuleCheckParityTypesTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm.hostFrontLiveHostModuleCheckParityTypesTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckParityTypesTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckParityTypesTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckParityTypesTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckParityTypesTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckParityTypesTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckParityTypesTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckParityTypesTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckParityTypesTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckParityTypesTermRel}"
  unless (!slakeTypecheckHostModuleCheckParityTypesTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityTypesTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckParityTypesTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckParityTypesTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckParityTypesTerm.main args
