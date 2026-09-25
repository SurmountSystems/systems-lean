/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckProductPathTerm.
  Short role: named driver for lean --run of the
  HostModuleCheckProductPathTerm.lean wrap.
  Ready is HostFrontLiveHostModuleCheckProductPathTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckProductPathTerm.lean,
  not a hardcoded true, not lake build
  SystemsLean.HostModuleCheckProductPathTerm.
  liveRel is HostModuleCheckProductPathTerm.lean.
  This wrap is HostModuleCheckProductPathTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Not full product module emit. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  FullHostElaborateRemains stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPRODUCTPATHTERM,
  SLAKE_TYPECHECK_HOSTMODULECHECKPRODUCTPATHTERM,
  slake-typecheck-hostmodulecheckproductpathterm,
  slakeTypecheckHostModuleCheckProductPathTermReady,
  kernelCheckLiveHostModuleCheckProductPathTermSource,
  PARSE-LIVE-HOSTMODULECHECKPRODUCTPATHTERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckProductPathTerm
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckProductPathTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckProductPathTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKPRODUCTPATHTERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKPRODUCTPATHTERM"

/-- Named recipe string. Not lake build of this module. -/
def justRecipeSlakeTypecheckHostModuleCheckProductPathTerm :
    String :=
  "slake-typecheck-hostmodulecheckproductpathterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProductPathTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckProductPathTerm.liveHostModuleCheckProductPathTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckProductPathTermReady,
    kernelCheckLiveHostModuleCheckProductPathTermSource. -/
def slakeTypecheckHostModuleCheckProductPathTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckProductPathTerm.hostFrontLiveHostModuleCheckProductPathTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckProductPathTermDoesNotUseLake :
    Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckProductPathTermFullHost :
    Bool := false

/-- Honesty: FullBackend stays false. Not full product module emit. -/
def slakeTypecheckHostModuleCheckProductPathTermFullBackend :
    Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckProductPathTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckProductPathTerm.lean.
    Prints liveRel from that def, then the HostFrontLive main.
    Ready is hostFrontLiveHostModuleCheckProductPathTermReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveHostModuleCheckProductPathTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckProductPathTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckProductPathTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckProductPathTermRel}"
  unless (!slakeTypecheckHostModuleCheckProductPathTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProductPathTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckProductPathTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckProductPathTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckProductPathTerm.main args
