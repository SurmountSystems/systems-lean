/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-ERASURE.
  Root for optional lean --run of live Erasure.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveErasure.
  Greppable: SystemsLean.HostFrontLiveErasureMain, HostFrontLiveErasureMain,
  HOST-FRONT-LIVE-ERASURE, SLAKE_HOST_FRONT_LIVE_ERASURE_V0, PARSE-LIVE-ERASURE,
  parseLiveErasureSource, kernelCheckLiveErasureSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveErasureMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveErasure

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveErasure.main args
