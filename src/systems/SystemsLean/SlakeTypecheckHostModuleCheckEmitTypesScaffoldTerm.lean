/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitTypesScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitTypesScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitTypesScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitTypesScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitTypesScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITTYPESSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITTYPESSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITTYPESSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemittypesscaffoldterm,
  slakeTypecheckHostModuleCheckEmitTypesScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitTypesScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitTypesScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITTYPESSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITTYPESSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitTypesScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitTypesScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemittypesscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitTypesScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm.liveHostModuleCheckEmitTypesScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitTypesScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitTypesScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitTypesScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm.hostFrontLiveHostModuleCheckEmitTypesScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitTypesScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitTypesScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitTypesScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitTypesScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitTypesScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitTypesScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitTypesScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitTypesScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitTypesScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitTypesScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitTypesScaffoldTerm.main args
