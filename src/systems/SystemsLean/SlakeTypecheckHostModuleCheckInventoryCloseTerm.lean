/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live
  SystemsLean.HostModuleCheckInventoryCloseTerm.
  Short role: named driver for the HostModuleCheckInventoryCloseTerm
  closed subset.
  Ready is HostFrontLiveHostModuleCheckInventoryCloseTermSource parse
  plus HostKernel.kernelCheck of live
  HostModuleCheckInventoryCloseTerm.lean, not a hardcoded true,
  not lake build SystemsLean.HostModuleCheckInventoryCloseTerm.
  liveRel is HostModuleCheckInventoryCloseTerm.lean.
  This wrap is HostModuleCheckInventoryCloseTerm.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM,
  SLAKE_TYPECHECK_HOST_MODULE_CHECK_INVENTORY_CLOSE_TERM,
  slake-typecheck-hostmodulecheckinventorycloseterm,
  slakeTypecheckHostModuleCheckInventoryCloseTermReady,
  kernelCheckLiveHostModuleCheckInventoryCloseTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM.
  Module: SystemsLean.SlakeTypecheckHostModuleCheckInventoryCloseTerm
  Checkable writer: lean --run SlakeTypecheckHostModuleCheckInventoryCloseTerm.lean
  (no mill; no lake).
-/

import SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

/-- Greppable stage id. -/
def stageId : String :=
  "SLAKE_TYPECHECK_HOST_MODULE_CHECK_INVENTORY_CLOSE_TERM"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SLAKE-TYPECHECK-HOST-MODULE-CHECK-INVENTORY-CLOSE-TERM"

/-- Named recipe string. Not lake build of the product module. -/
def justRecipeSlakeTypecheckHostModuleCheckInventoryCloseTerm : String :=
  "slake-typecheck-hostmodulecheckinventorycloseterm"

/-- Live file relative to repo root. -/
def liveHostModuleCheckInventoryCloseTermRel : String :=
  SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource.liveHostModuleCheckInventoryCloseTermRel

/-- Ready names the live parse plus kernelCheck, not a hardcoded true.
    Greppable: slakeTypecheckHostModuleCheckInventoryCloseTermReady. -/
def slakeTypecheckHostModuleCheckInventoryCloseTermReady : Bool :=
  SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource.hostFrontLiveHostModuleCheckInventoryCloseTermReady

/-- Honesty: this command is not lake build of the product module. -/
def slakeTypecheckHostModuleCheckInventoryCloseTermDoesNotUseLake : Bool :=
  true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckHostModuleCheckInventoryCloseTermFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckHostModuleCheckInventoryCloseTermFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckHostModuleCheckInventoryCloseTermOwnsPackageTypecheck :
    Bool := false

/-- lean --run entry: parse plus kernelCheck live
    HostModuleCheckInventoryCloseTerm.lean.
    Prints liveRel, then the checker main.
    Ready is the checker conjunction, not a hardcoded true. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckHostModuleCheckInventoryCloseTerm} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource.liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckInventoryCloseTermRel}"
  unless (!slakeTypecheckHostModuleCheckInventoryCloseTermFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckInventoryCloseTermFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckHostModuleCheckInventoryCloseTermOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveHostModuleCheckInventoryCloseTermSource.main args
