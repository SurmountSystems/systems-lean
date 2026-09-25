/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckLoadOk.
  Short role: named driver for the HostModuleCheckLoadOk
  closed subset.
  Ready is HostFrontLiveHostModuleCheckLoadOk parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckLoadOk.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckLoadOk.
  liveRel is HostModuleCheckLoadOk.lean.
  This checker is HostModuleCheckLoadOk.lean.
  Not HostModuleCheckLoadOkLaterTerm.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LOAD-OK,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_LOAD_OK,
  slake-typecheck-hostmodulecheckloadok,
  slakeTypecheckHostModuleCheckLoadOkReady,
  kernelCheckLiveHostModuleCheckLoadOkSource,
  PARSE-LIVE-LOADOK.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckLoadOk
  Checkable writer: lean --run
  SlakeTypecheckHostModuleCheckLoadOk.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckLoadOkSource
import SystemsLean.HostFrontLiveHostModuleCheckLoadOk

set_option maxRecDepth 131072
set_option maxHeartbeats 4000000

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_HOST_MODULE_CHECK_LOAD_OK"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-LOAD-OK"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckLoadOk : String :=
  "slake-typecheck-hostmodulecheckloadok"

/-- Live file relative to repo root. -/
def liveHostModuleCheckLoadOkRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckLoadOk.liveHostModuleCheckLoadOkRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckLoadOkReady. -/
def slakeTypecheckHostModuleCheckLoadOkReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckLoadOk.hostFrontLiveHostModuleCheckLoadOkReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckLoadOkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckLoadOkFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckLoadOkFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckLoadOkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckLoadOk.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckLoadOk} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckLoadOk.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckLoadOkRel}"
  unless (!slakeTypecheckHostModuleCheckLoadOkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLoadOkFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckLoadOkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless slakeTypecheckHostModuleCheckLoadOkDoesNotUseLake do
    IO.eprintln "error: driver must not use lake"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckLoadOk.main args
