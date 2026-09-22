/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF-LINK.
  Root for optional lean --run of live SlakeHostToolElfLink.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfLink.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfLinkMain, HostFrontLiveSlakeHostToolElfLinkMain,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-LINK, SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_LINK_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-LINK,
  parseLiveSlakeHostToolElfLinkSource, kernelCheckLiveSlakeHostToolElfLinkSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfLinkMain
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfLink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfLink.main args
