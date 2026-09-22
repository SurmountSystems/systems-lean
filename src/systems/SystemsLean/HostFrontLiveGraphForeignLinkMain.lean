/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-GRAPH-FOREIGN-LINK.
  Root for optional lean --run of live GraphForeignLink.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveGraphForeignLink.
  Greppable: SystemsLean.HostFrontLiveGraphForeignLinkMain, HostFrontLiveGraphForeignLinkMain,
  HOST-FRONT-LIVE-GRAPH-FOREIGN-LINK, SLAKE_HOST_FRONT_LIVE_GRAPH_FOREIGN_LINK_V0,
  PARSE-LIVE-GRAPH-FOREIGN-LINK,
  parseLiveGraphForeignLinkSource, kernelCheckLiveGraphForeignLinkSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveGraphForeignLinkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveGraphForeignLink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveGraphForeignLink.main args
