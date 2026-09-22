/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS.
  Root for optional lean --run of live ProductPathOwnershipRegenerateTheorems.lean
  parse plus kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems.
  Unique needles (trailing newline so
  HostFrontLiveProductPathOwnershipRegenerateTheoremsMain is not a prefix hit
  on the ProductPathOwnershipRegenerateMain wrap
  HostFrontLiveProductPathOwnershipRegenerateMain):
  HostFrontLiveProductPathOwnershipRegenerateTheoremsMain
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheoremsMain,
  HostFrontLiveProductPathOwnershipRegenerateTheoremsMain,
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_REGENERATE_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-THEOREMS,
  parseLiveProductPathOwnershipRegenerateTheoremsSource,
  kernelCheckLiveProductPathOwnershipRegenerateTheoremsSource,
  liveRel,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Not HostFrontLiveProductPathOwnershipRegenerateMain
  (that wrap is the Main peel, not this theorems peel).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathOwnershipRegenerateTheorems.main args
