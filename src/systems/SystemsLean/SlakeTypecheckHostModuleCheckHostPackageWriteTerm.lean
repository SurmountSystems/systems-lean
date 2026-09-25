/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckHostPackageWriteTerm.
  Short role: named driver for the HostModuleCheckHostPackageWriteTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckHostPackageWriteTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckHostPackageWriteTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckHostPackageWriteTerm.
  liveRel is HostModuleCheckHostPackageWriteTerm.lean.
  This wrap is HostModuleCheckHostPackageWriteTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_PACKAGE_WRITE_TERM,
  slake-typecheck-hostmodulecheckhostpackagewriteterm,
  slakeTypecheckHostModuleCheckHostPackageWriteTermReady,
  kernelCheckLiveHostModuleCheckHostPackageWriteTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckHostPackageWriteTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckHostPackageWriteTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_HOST_PACKAGE_WRITE_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-HOST-PACKAGE-WRITE-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckHostPackageWriteTerm : String :=
  "slake-typecheck-hostmodulecheckhostpackagewriteterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckHostPackageWriteTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource.liveHostModuleCheckHostPackageWriteTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckHostPackageWriteTermReady. -/
def slakeTypecheckHostModuleCheckHostPackageWriteTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource.hostFrontLiveHostModuleCheckHostPackageWriteTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckHostPackageWriteTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckHostPackageWriteTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckHostPackageWriteTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckHostPackageWriteTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckHostPackageWriteTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckHostPackageWriteTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckHostPackageWriteTermRel}"
  unless (!slakeTypecheckHostModuleCheckHostPackageWriteTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostPackageWriteTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckHostPackageWriteTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckHostPackageWriteTermSource.main args
