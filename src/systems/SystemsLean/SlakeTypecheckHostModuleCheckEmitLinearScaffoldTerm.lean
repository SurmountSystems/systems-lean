/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitLinearScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitLinearScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitLinearScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitLinearScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitLinearScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITLINEARSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITLINEARSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITLINEARSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitlinearscaffoldterm,
  slakeTypecheckHostModuleCheckEmitLinearScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitLinearScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitLinearScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITLINEARSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITLINEARSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitLinearScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitLinearScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemitlinearscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitLinearScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm.liveHostModuleCheckEmitLinearScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitLinearScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitLinearScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitLinearScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm.hostFrontLiveHostModuleCheckEmitLinearScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitLinearScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitLinearScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitLinearScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitLinearScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitLinearScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitLinearScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitLinearScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitLinearScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitLinearScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitLinearScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitLinearScaffoldTerm.main args
