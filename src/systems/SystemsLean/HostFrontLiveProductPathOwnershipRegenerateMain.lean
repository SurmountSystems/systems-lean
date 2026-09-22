/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE.
  Root for optional lean --run of live ProductPathOwnershipRegenerate.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not a backend.
  Body lives in SystemsLean.HostFrontLiveProductPathOwnershipRegenerate.
  Greppable: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMain,
  HostFrontLiveProductPathOwnershipRegenerateMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_V0,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE,
  PRODUCT-PATH-OWNERSHIP-REGENERATE,
  parseLiveProductPathOwnershipRegenerateSource,
  kernelCheckLiveProductPathOwnershipRegenerateSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMain
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveProductPathOwnershipRegenerate

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerate.main args
