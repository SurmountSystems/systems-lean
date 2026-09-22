/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS.
  Root for optional lean --run of live ProductPathOwnershipInputs.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProductPathOwnershipInputs.
  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathOwnershipInputsMain
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS
  HOST-FRONT-LIVE-PRODUCT-PATH-OWNERSHIP-INPUTS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_OWNERSHIP_INPUTS_V0
  Greppable: SystemsLean.HostFrontLiveProductPathOwnershipInputsMain,
  parseLiveProductPathOwnershipInputsSource,
  kernelCheckLiveProductPathOwnershipInputsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipInputsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProductPathOwnershipInputs

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProductPathOwnershipInputs.main args
