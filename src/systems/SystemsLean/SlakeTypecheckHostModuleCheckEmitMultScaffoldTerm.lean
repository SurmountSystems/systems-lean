/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitMultScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitMultScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitMultScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitMultScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitMultScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitMultScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITMULTSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITMULTSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITMULTSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitmultscaffoldterm,
  slakeTypecheckHostModuleCheckEmitMultScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitMultScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitMultScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITMULTSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITMULTSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitMultScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitMultScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemitmultscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitMultScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm.liveHostModuleCheckEmitMultScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitMultScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitMultScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitMultScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitMultScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm.hostFrontLiveHostModuleCheckEmitMultScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitMultScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitMultScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitMultScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitMultScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitMultScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitMultScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitMultScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitMultScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitMultScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitMultScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitMultScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitMultScaffoldTerm.main args
