/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRealModule.
  Short role: named driver for the HostModuleCheckRealModule
  closed subset.
  Ready is HostFrontLiveHostModuleCheckRealModuleSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckRealModule.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckRealModule.
  liveRel is HostModuleCheckRealModule.lean.
  This wrap is HostModuleCheckRealModule.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-REAL-MODULE,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_REAL_MODULE,
  slake-typecheck-hostmodulecheckrealmodule,
  slakeTypecheckHostModuleCheckRealModuleReady,
  kernelCheckLiveHostModuleCheckRealModuleSource,
  PARSE-LIVE-HOST-MODULE-CHECK-REAL-MODULE.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRealModule
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckRealModule.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRealModuleSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_REAL_MODULE"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-REAL-MODULE"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckRealModule : String :=
  "slake-typecheck-hostmodulecheckrealmodule"

/-- Live file relative to repo root. -/
def liveHostModuleCheckRealModuleRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRealModuleSource.liveHostModuleCheckRealModuleRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckRealModuleReady. -/
def slakeTypecheckHostModuleCheckRealModuleReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRealModuleSource.hostFrontLiveHostModuleCheckRealModuleReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRealModuleDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRealModuleFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckRealModuleFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRealModuleOwnsPackageTypecheck : Bool :=
  false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRealModule.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRealModule} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRealModuleSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRealModuleRel}"
  unless (!slakeTypecheckHostModuleCheckRealModuleFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRealModuleFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRealModuleOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRealModuleSource.main args
