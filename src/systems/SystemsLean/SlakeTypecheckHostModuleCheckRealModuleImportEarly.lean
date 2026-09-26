/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckRealModuleImportEarly.
  Short role: named driver for the HostModuleCheckRealModuleImportEarly
  closed subset.
  Ready is HostFrontLiveHostModuleCheckRealModuleImportEarlySource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckRealModuleImportEarly.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckRealModuleImportEarly.
  liveRel is HostModuleCheckRealModuleImportEarly.lean.
  This wrap is HostModuleCheckRealModuleImportEarly.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-REAL-MODULE-IMPORT-EARLY,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_REAL_MODULE_IMPORT_EARLY,
  slake-typecheck-hostmodulecheckrealmoduleimportearly,
  slakeTypecheckHostModuleCheckRealModuleImportEarlyReady,
  kernelCheckLiveHostModuleCheckRealModuleImportEarlySource,
  PARSE-LIVE-HOST-MODULE-CHECK-REAL-MODULE-IMPORT-EARLY.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckRealModuleImportEarly
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckRealModuleImportEarly.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckRealModuleImportEarlySource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_REAL_MODULE_IMPORT_EARLY"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-REAL-MODULE-IMPORT-EARLY"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckRealModuleImportEarly : String :=
  "slake-typecheck-hostmodulecheckrealmoduleimportearly"

/-- Live file relative to repo root. -/
def liveHostModuleCheckRealModuleImportEarlyRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckRealModuleImportEarlySource.liveHostModuleCheckRealModuleImportEarlyRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckRealModuleImportEarlyReady. -/
def slakeTypecheckHostModuleCheckRealModuleImportEarlyReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckRealModuleImportEarlySource.hostFrontLiveHostModuleCheckRealModuleImportEarlyReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckRealModuleImportEarlyDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckRealModuleImportEarlyFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckRealModuleImportEarlyFullBackend : Bool :=
  false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckRealModuleImportEarlyOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckRealModuleImportEarly.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckRealModuleImportEarly} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckRealModuleImportEarlySource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckRealModuleImportEarlyRel}"
  unless (!slakeTypecheckHostModuleCheckRealModuleImportEarlyFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRealModuleImportEarlyFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckRealModuleImportEarlyOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckRealModuleImportEarlySource.main args
