/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitGraphScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitGraphScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitGraphScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitGraphScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitGraphScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitgraphscaffoldterm,
  slakeTypecheckHostModuleCheckEmitGraphScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitGraphScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitGraphScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITGRAPHSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitGraphScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitGraphScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemitgraphscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitGraphScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm.liveHostModuleCheckEmitGraphScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitGraphScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitGraphScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitGraphScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm.hostFrontLiveHostModuleCheckEmitGraphScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitGraphScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitGraphScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitGraphScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitGraphScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitGraphScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitGraphScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitGraphScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitGraphScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitGraphScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitGraphScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitGraphScaffoldTerm.main args
