/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FRONT.
  Root for optional lean --run of live HostFront.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveFront.
  Greppable: SystemsLean.HostFrontLiveFrontMain, HostFrontLiveFrontMain,
  HOST-FRONT-LIVE-FRONT, SLAKE_HOST_FRONT_LIVE_FRONT_V0, PARSE-LIVE-FRONT,
  parseLiveFrontSource, kernelCheckLiveFrontSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFrontMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveFront

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFront.main args
