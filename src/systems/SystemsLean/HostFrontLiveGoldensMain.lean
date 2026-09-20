/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-GOLDENS.
  Root for optional lean --run of live HostFrontGoldens.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveGoldens.
  Greppable: SystemsLean.HostFrontLiveGoldensMain, HostFrontLiveGoldensMain,
  HOST-FRONT-LIVE-GOLDENS, SLAKE_HOST_FRONT_LIVE_GOLDENS_V0, PARSE-LIVE-GOLDENS,
  parseLiveGoldensSource, kernelCheckLiveGoldensSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveGoldensMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveGoldens

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveGoldens.main args
