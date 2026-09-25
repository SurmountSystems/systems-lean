/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitErasureScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitErasureScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitErasureScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitErasureScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitErasureScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITERASURESCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITERASURESCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITERASURESCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemiterasurescaffoldterm,
  slakeTypecheckHostModuleCheckEmitErasureScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitErasureScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitErasureScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITERASURESCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITERASURESCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitErasureScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitErasureScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemiterasurescaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitErasureScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm.liveHostModuleCheckEmitErasureScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitErasureScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitErasureScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitErasureScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm.hostFrontLiveHostModuleCheckEmitErasureScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitErasureScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitErasureScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitErasureScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitErasureScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitErasureScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitErasureScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitErasureScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitErasureScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitErasureScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitErasureScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitErasureScaffoldTerm.main args
