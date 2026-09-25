/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SELF-HOST-BODY-THEOREMS.
  Root for optional lean --run of live SelfHostBodyTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not SelfHostBody.lean.
  Body lives in SystemsLean.HostFrontLiveSelfHostBodyTheorems.
  Greppable: SystemsLean.HostFrontLiveSelfHostBodyTheoremsMain,
  HostFrontLiveSelfHostBodyTheoremsMain, HOST-FRONT-LIVE-SELF-HOST-BODY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_BODY_THEOREMS_V0,
  PARSE-LIVE-SELF-HOST-BODY-THEOREMS,
  parseLiveSelfHostBodyTheoremsSource,
  kernelCheckLiveSelfHostBodyTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSelfHostBodyTheoremsMain
  Not FullHost. FullBackend stays false. Not a claim-bool flip.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveSelfHostBodyTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSelfHostBodyTheorems.main args
