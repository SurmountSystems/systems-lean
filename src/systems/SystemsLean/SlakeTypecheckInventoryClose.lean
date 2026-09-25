/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.InventoryClose.
  Short role: named driver for just slake-typecheck-inventoryclose.
  Ready is HostFrontLiveInventoryClose parse plus HostKernel.kernelCheck
  of live InventoryClose.lean, not a hardcoded true, not lake build
  SystemsLean.InventoryClose.
  liveRel is InventoryClose.lean.
  This wrap is InventoryClose.lean. It is not InventoryCloseTheorems.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-INVENTORY-CLOSE,
  SLAKE_TYPECHECK_INVENTORY_CLOSE, slake-typecheck-inventoryclose,
  slakeTypecheckInventoryCloseReady,
  kernelCheckLiveInventoryCloseSource,
  PARSE-LIVE-INVENTORY-CLOSE.
  Module: SystemsLean.SlakeTypecheckInventoryClose
  Checkable writer: just slake-typecheck-inventoryclose
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveInventoryClose

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_INVENTORY_CLOSE"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-INVENTORY-CLOSE"

/-- Named just recipe. Not lake build SystemsLean.InventoryClose. -/
def justRecipeSlakeTypecheckInventoryClose : String :=
  "slake-typecheck-inventoryclose"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInventoryCloseRel : String :=
  SystemsLean.HostFrontLiveInventoryClose.liveInventoryCloseRel

/-- Ready names HostFrontLiveInventoryClose parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckInventoryCloseReady,
    kernelCheckLiveInventoryCloseSource. -/
def slakeTypecheckInventoryCloseReady : Bool :=
  SystemsLean.HostFrontLiveInventoryClose.hostFrontLiveInventoryCloseReady

/-- Honesty: this command is not lake build of InventoryClose. -/
def slakeTypecheckInventoryCloseDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckInventoryCloseFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckInventoryCloseFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckInventoryCloseOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live InventoryClose.lean.
    Ready is HostFrontLiveInventoryClose.hostFrontLiveInventoryCloseReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveInventoryClose.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckInventoryClose} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveInventoryClose.liveRel}"
  IO.println s!"  host={hostId} file={liveInventoryCloseRel}"
  unless (!slakeTypecheckInventoryCloseFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckInventoryCloseFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckInventoryCloseOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveInventoryClose.main args
