/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-FOREIGN-LINK.
  Root for optional lean --run of live LinearForeignLink.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearForeignLink.
  Greppable: SystemsLean.HostFrontLiveLinearForeignLinkMain,
  HostFrontLiveLinearForeignLinkMain, HOST-FRONT-LIVE-LINEAR-FOREIGN-LINK,
  SLAKE_HOST_FRONT_LIVE_LINEAR_FOREIGN_LINK_V0, PARSE-LIVE-LINEAR-FOREIGN-LINK,
  parseLiveLinearForeignLinkSource, kernelCheckLiveLinearForeignLinkSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearForeignLinkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearForeignLink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearForeignLink.main args
