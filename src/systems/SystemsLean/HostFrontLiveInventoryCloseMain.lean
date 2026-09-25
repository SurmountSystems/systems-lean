/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-INVENTORY-CLOSE.
  Root for optional lean --run of live InventoryClose.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveInventoryClose.
  Greppable: SystemsLean.HostFrontLiveInventoryCloseMain,
  HostFrontLiveInventoryCloseMain, HOST-FRONT-LIVE-INVENTORY-CLOSE,
  SLAKE_HOST_FRONT_LIVE_INVENTORY_CLOSE_V0,
  PARSE-LIVE-INVENTORY-CLOSE,
  parseLiveInventoryCloseSource,
  kernelCheckLiveInventoryCloseSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveInventoryCloseMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveInventoryClose

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveInventoryClose.main args
