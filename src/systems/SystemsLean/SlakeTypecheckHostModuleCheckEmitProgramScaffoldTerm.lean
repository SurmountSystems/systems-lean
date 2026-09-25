/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckEmitProgramScaffoldTerm.
  Short role: named driver for lean --run of
  HostModuleCheckEmitProgramScaffoldTerm.lean.
  Ready is HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm parse plus
  HostKernel.kernelCheck of live HostModuleCheckEmitProgramScaffoldTerm.lean,
  not := true, not lake build
  SystemsLean.HostModuleCheckEmitProgramScaffoldTerm.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Not a speed claim.
  Unique needles (trailing newline so other HostModuleCheck drivers are not prefix hits):
  SlakeTypecheckHostModuleCheckEmitProgramScaffoldTerm
  HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM
  SLAKE_TYPECHECK_HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM_V0
  PARSE-LIVE-HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM
  Greppable: SYSTEMS_LEAN_HOST,
  slake-typecheck-hostmodulecheckemitprogramscaffoldterm,
  slakeTypecheckHostModuleCheckEmitProgramScaffoldTermReady,
  kernelCheckLiveHostModuleCheckEmitProgramScaffoldTermSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckEmitProgramScaffoldTerm
  Checkable writer: lean --run
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOSTMODULECHECKEMITPROGRAMSCAFFOLDTERM"

/-- Named recipe string. Not lake build SystemsLean.HostModuleCheckEmitProgramScaffoldTerm.
    No just recipe is added for this driver. -/
def justRecipeSlakeTypecheckHostModuleCheckEmitProgramScaffoldTerm : String :=
  "slake-typecheck-hostmodulecheckemitprogramscaffoldterm"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckEmitProgramScaffoldTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm.liveHostModuleCheckEmitProgramScaffoldTermRel

/-- Ready names HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm parse plus
    kernelCheck, not := true.
    Greppable: slakeTypecheckHostModuleCheckEmitProgramScaffoldTermReady,
    kernelCheckLiveHostModuleCheckEmitProgramScaffoldTermSource. -/
def slakeTypecheckHostModuleCheckEmitProgramScaffoldTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm.hostFrontLiveHostModuleCheckEmitProgramScaffoldTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckEmitProgramScaffoldTermDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckEmitProgramScaffoldTermFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckEmitProgramScaffoldTermOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckEmitProgramScaffoldTerm.lean.
    Ready is hostFrontLiveHostModuleCheckEmitProgramScaffoldTermReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckEmitProgramScaffoldTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckEmitProgramScaffoldTermRel}"
  unless (!slakeTypecheckHostModuleCheckEmitProgramScaffoldTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckEmitProgramScaffoldTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckEmitProgramScaffoldTermDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckEmitProgramScaffoldTerm.main args
