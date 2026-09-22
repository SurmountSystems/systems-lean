/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LAKE-RETIRE-INVENTORY.
  Root for optional lean --run of live LakeRetireInventory.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a Lake retirement.
  Lake is not gone. stillUsesLake false in the live file is not a Lake-gone claim.
  Body lives in SystemsLean.HostFrontLiveLakeRetireInventory.
  Greppable: SystemsLean.HostFrontLiveLakeRetireInventoryMain,
  HostFrontLiveLakeRetireInventoryMain, HOST-FRONT-LIVE-LAKE-RETIRE-INVENTORY,
  SLAKE_HOST_FRONT_LIVE_LAKE_RETIRE_INVENTORY_V0,
  PARSE-LIVE-LAKE-RETIRE-INVENTORY, LAKE-RETIRE-INVENTORY,
  parseLiveLakeRetireInventorySource,
  kernelCheckLiveLakeRetireInventorySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLakeRetireInventoryMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLakeRetireInventory

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLakeRetireInventory.main args
