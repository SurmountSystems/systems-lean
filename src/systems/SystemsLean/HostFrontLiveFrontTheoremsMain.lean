/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FRONT-THEOREMS.
  Root for optional lean --run of live HostFrontTheorems.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveFrontTheorems.
  Greppable: SystemsLean.HostFrontLiveFrontTheoremsMain, HostFrontLiveFrontTheoremsMain,
  HOST-FRONT-LIVE-FRONT-THEOREMS, SLAKE_HOST_FRONT_LIVE_FRONT_THEOREMS_V0,
  PARSE-LIVE-FRONT-THEOREMS, parseLiveFrontTheoremsSource,
  kernelCheckLiveFrontTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFrontTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveFrontTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFrontTheorems.main args
