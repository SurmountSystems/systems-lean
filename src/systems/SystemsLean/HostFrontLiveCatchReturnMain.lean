/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CATCH-RETURN.
  Root for optional lean --run of live CatchReturn.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCatchReturn.
  Greppable: SystemsLean.HostFrontLiveCatchReturnMain, HostFrontLiveCatchReturnMain,
  HOST-FRONT-LIVE-CATCH-RETURN, SLAKE_HOST_FRONT_LIVE_CATCH_RETURN_V0, PARSE-LIVE-CATCH-RETURN,
  parseLiveCatchReturnSource, kernelCheckLiveCatchReturnSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCatchReturnMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCatchReturn

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCatchReturn.main args
