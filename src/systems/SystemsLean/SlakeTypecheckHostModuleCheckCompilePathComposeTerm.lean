/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathComposeTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathComposeTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathComposeTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathComposeTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathComposeTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathComposeTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHCOMPOSETERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHCOMPOSETERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHCOMPOSETERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathcomposeterm,
  slakeTypecheckHostModuleCheckCompilePathComposeTermReady,
  kernelCheckLiveHostModuleCheckCompilePathComposeTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathComposeTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHCOMPOSETERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHCOMPOSETERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathComposeTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathComposeTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathcomposeterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathComposeTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm.liveHostModuleCheckCompilePathComposeTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathComposeTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathComposeTermReady,
    kernelCheckLiveHostModuleCheckCompilePathComposeTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathComposeTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm.hostFrontLiveHostModuleCheckCompilePathComposeTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathComposeTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathComposeTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathComposeTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathComposeTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathComposeTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathComposeTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathComposeTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathComposeTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathComposeTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathComposeTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathComposeTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm.main args
