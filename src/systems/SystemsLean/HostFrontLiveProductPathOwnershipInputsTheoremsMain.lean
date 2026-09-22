/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS-THEOREMS.
  Root for optional lean --run of live ProductPathOwnershipInputsTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a
  shorter library wrap needle is not a prefix hit):
  HostFrontLiveProductPathOwnershipInputsTheoremsMain
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_INPUTS_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathOwnershipInputsTheoremsMain,
  parseLiveProductPathOwnershipInputsTheoremsSource,
  kernelCheckLiveProductPathOwnershipInputsTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipInputsTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathOwnershipInputsTheorems.main args
