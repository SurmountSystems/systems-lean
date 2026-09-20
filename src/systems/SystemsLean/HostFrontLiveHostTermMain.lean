/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOSTTERM.
  Root for optional lean --run of live HostTerm.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostTerm.
  Greppable: SystemsLean.HostFrontLiveHostTermMain, HostFrontLiveHostTermMain,
  HOST-FRONT-LIVE-HOSTTERM, SLAKE_HOST_FRONT_LIVE_HOSTTERM_V0, PARSE-LIVE-HOSTTERM,
  parseLiveHostTermSource, kernelCheckLiveHostTermSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostTerm.main args
