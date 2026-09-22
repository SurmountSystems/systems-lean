/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.InventoryCloseTheorems.
  Short role: named driver for just slake-typecheck-inventoryclosetheorems.
  Ready is HostFrontLiveInventoryCloseTheorems parse plus HostKernel.kernelCheck
  of live InventoryCloseTheorems.lean, not := true, not lake build
  SystemsLean.InventoryCloseTheorems.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-INVENTORY-CLOSE-THEOREMS,
  SLAKE_TYPECHECK_INVENTORY_CLOSE_THEOREMS_V0, slake-typecheck-inventoryclosetheorems,
  slakeTypecheckInventoryCloseTheoremsReady,
  kernelCheckLiveInventoryCloseTheoremsSource,
  PARSE-LIVE-INVENTORY-CLOSE-THEOREMS, SKELETON.
  Module: SystemsLean.SlakeTypecheckInventoryCloseTheorems
  Checkable writer: just slake-typecheck-inventoryclosetheorems
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveInventoryCloseTheorems

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_INVENTORY_CLOSE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-INVENTORY-CLOSE-THEOREMS"

/-- Named just recipe. Not lake build SystemsLean.InventoryCloseTheorems. -/
def justRecipeSlakeTypecheckInventoryCloseTheorems : String :=
  "slake-typecheck-inventoryclosetheorems"

/-- Live file relative to repo root. Dual-pin path. -/
def liveInventoryCloseTheoremsRel : String :=
  SystemsLean.HostFrontLiveInventoryCloseTheorems.liveInventoryCloseTheoremsRel

/-- Ready names HostFrontLiveInventoryCloseTheorems parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckInventoryCloseTheoremsReady,
    kernelCheckLiveInventoryCloseTheoremsSource. -/
def slakeTypecheckInventoryCloseTheoremsReady : Bool :=
  SystemsLean.HostFrontLiveInventoryCloseTheorems.hostFrontLiveInventoryCloseTheoremsReady

/-- Honesty: this command is not lake build of InventoryCloseTheorems. -/
def slakeTypecheckInventoryCloseTheoremsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckInventoryCloseTheoremsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckInventoryCloseTheoremsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live InventoryCloseTheorems.lean.
    Ready is HostFrontLiveInventoryCloseTheorems.hostFrontLiveInventoryCloseTheoremsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveInventoryCloseTheorems.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckInventoryCloseTheorems} =="
  IO.println s!"  host={hostId} file={liveInventoryCloseTheoremsRel}"
  unless (!slakeTypecheckInventoryCloseTheoremsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckInventoryCloseTheoremsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveInventoryCloseTheorems.main args
