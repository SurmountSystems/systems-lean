/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-FOREIGN-LINK.
  Root for optional lean --run of live MultForeignLink.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMultForeignLink.
  Greppable: SystemsLean.HostFrontLiveMultForeignLinkMain, HostFrontLiveMultForeignLinkMain,
  HOST-FRONT-LIVE-MULT-FOREIGN-LINK, SLAKE_HOST_FRONT_LIVE_MULT_FOREIGN_LINK_V0,
  PARSE-LIVE-MULT-FOREIGN-LINK,
  parseLiveMultForeignLinkSource, kernelCheckLiveMultForeignLinkSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultForeignLinkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMultForeignLink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultForeignLink.main args
