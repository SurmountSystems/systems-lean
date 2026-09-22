/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-TYPESFOREIGNLINK.
  Root for optional lean --run of live TypesForeignLink.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveTypesForeignLink.
  Greppable: SystemsLean.HostFrontLiveTypesForeignLinkMain,
  HostFrontLiveTypesForeignLinkMain, HOST-FRONT-LIVE-TYPESFOREIGNLINK,
  SLAKE_HOST_FRONT_LIVE_TYPESFOREIGNLINK_V0, PARSE-LIVE-TYPESFOREIGNLINK,
  parseLiveTypesForeignLinkSource, kernelCheckLiveTypesForeignLinkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveTypesForeignLinkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveTypesForeignLink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveTypesForeignLink.main args
