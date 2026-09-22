/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-BOOTSTRAP-HONESTY.
  Root for optional lean --run of live BootstrapHonesty.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveBootstrapHonesty.
  Greppable: SystemsLean.HostFrontLiveBootstrapHonestyMain, HostFrontLiveBootstrapHonestyMain,
  HOST-FRONT-LIVE-BOOTSTRAP-HONESTY, SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_V0,
  PARSE-LIVE-BOOTSTRAP-HONESTY,
  parseLiveBootstrapHonestySource, kernelCheckLiveBootstrapHonestySource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveBootstrapHonestyMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveBootstrapHonesty

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveBootstrapHonesty.main args
