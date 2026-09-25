/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckCompilePathGraphTerm.
  Short role: named driver for lean --run of
  HostModuleCheckCompilePathGraphTerm.lean.
  Ready is HostFrontLiveHostModuleCheckCompilePathGraphTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckCompilePathGraphTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckCompilePathGraphTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckCompilePathGraphTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHGRAPHTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHGRAPHTERM_V0
  PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHGRAPHTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckcompilepathgraphterm,
  slakeTypecheckHostModuleCheckCompilePathGraphTermReady,
  kernelCheckLiveHostModuleCheckCompilePathGraphTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckCompilePathGraphTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKCOMPILEPATHGRAPHTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKCOMPILEPATHGRAPHTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckCompilePathGraphTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckCompilePathGraphTerm : String :=
  "slake-typecheck-hostmodulecheckcompilepathgraphterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckCompilePathGraphTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm.liveHostModuleCheckCompilePathGraphTermRel

/-- Ready names HostFrontLiveHostModuleCheckCompilePathGraphTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckCompilePathGraphTermReady,
    kernelCheckLiveHostModuleCheckCompilePathGraphTermSource. -/
def slakeTypecheckHostModuleCheckCompilePathGraphTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm.hostFrontLiveHostModuleCheckCompilePathGraphTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckCompilePathGraphTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckCompilePathGraphTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckCompilePathGraphTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckCompilePathGraphTerm.lean.
    Ready is hostFrontLiveHostModuleCheckCompilePathGraphTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckCompilePathGraphTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckCompilePathGraphTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckCompilePathGraphTermRel}"
  unless (!slakeTypecheckHostModuleCheckCompilePathGraphTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckCompilePathGraphTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckCompilePathGraphTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm.main args
