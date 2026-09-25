/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostCheckTerm.
  Short role: named driver for the HostModuleCheckHostCheckTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckHostCheckTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckHostCheckTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckHostCheckTerm.
  liveRel is HostModuleCheckHostCheckTerm.lean.
  This wrap is HostModuleCheckHostCheckTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-CHECK-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_CHECK_TERM,
  slake-typecheck-hostmodulecheckhostcheckterm,
  slakeTypecheckHostModuleCheckHostCheckTermReady,
  kernelCheckLiveHostModuleCheckHostCheckTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-CHECK-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostCheckTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckHostCheckTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_CHECK_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-CHECK-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostCheckTerm : String :=
  "slake-typecheck-hostmodulecheckhostcheckterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostCheckTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource.liveHostModuleCheckHostCheckTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostCheckTermReady. -/
def slakeTypecheckHostModuleCheckHostCheckTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource.hostFrontLiveHostModuleCheckHostCheckTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostCheckTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostCheckTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckHostCheckTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostCheckTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostCheckTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostCheckTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostCheckTermRel}"
  unless (!slakeTypecheckHostModuleCheckHostCheckTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostCheckTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostCheckTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostCheckTermSource.main args
