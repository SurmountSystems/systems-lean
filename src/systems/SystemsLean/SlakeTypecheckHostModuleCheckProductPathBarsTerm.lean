/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckProductPathBarsTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckProductPathBarsTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckProductPathBarsTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckProductPathBarsTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckProductPathBarsTerm.
  liveRel is HostModuleCheckProductPathBarsTerm.lean.
  This wrap is HostModuleCheckProductPathBarsTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPRODUCTPATHBARSTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPRODUCTPATHBARSTERM,
  slake-typecheck-hostmodulecheckproductpathbarsterm,
  slakeTypecheckHostModuleCheckProductPathBarsTermReady,
  kernelCheckLiveHostModuleCheckProductPathBarsTermSource,
  PARSE-LIVE-HOSTMODULECHECKPRODUCTPATHBARSTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckProductPathBarsTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckProductPathBarsTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPRODUCTPATHBARSTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPRODUCTPATHBARSTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckProductPathBarsTerm :
    String :=
  "slake-typecheck-hostmodulecheckproductpathbarsterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProductPathBarsTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm.liveHostModuleCheckProductPathBarsTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckProductPathBarsTermReady,
    kernelCheckLiveHostModuleCheckProductPathBarsTermSource. -/
def slakeTypecheckHostModuleCheckProductPathBarsTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm.hostFrontLiveHostModuleCheckProductPathBarsTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckProductPathBarsTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckProductPathBarsTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckProductPathBarsTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckProductPathBarsTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckProductPathBarsTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckProductPathBarsTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckProductPathBarsTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckProductPathBarsTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckProductPathBarsTermRel}"
  unless (!slakeTypecheckHostModuleCheckProductPathBarsTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProductPathBarsTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProductPathBarsTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckProductPathBarsTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckProductPathBarsTerm.main args
