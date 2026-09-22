/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-INVENTORY-CLOSE-THEOREMS.
  Root for optional lean --run of live InventoryCloseTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveInventoryCloseTheorems.
  Greppable: SystemsLean.HostFrontLiveInventoryCloseTheoremsMain,
  HostFrontLiveInventoryCloseTheoremsMain, HOST-FRONT-LIVE-INVENTORY-CLOSE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_THEOREMS_V0,
  PARSE-LIVE-INVENTORY-CLOSE-THEOREMS,
  parseLiveInventoryCloseTheoremsSource,
  kernelCheckLiveInventoryCloseTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveInventoryCloseTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveInventoryCloseTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveInventoryCloseTheorems.main args
