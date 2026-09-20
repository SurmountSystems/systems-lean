/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EXTRACT.
  Root for optional lean --run of live Extract.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveExtract.
  Greppable: SystemsLean.HostFrontLiveExtractMain, HostFrontLiveExtractMain,
  HOST-FRONT-LIVE-EXTRACT, SLAKE_HOST_FRONT_LIVE_EXTRACT_V0, PARSE-LIVE-EXTRACT,
  parseLiveExtractSource, kernelCheckLiveExtractSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveExtractMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveExtract

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveExtract.main args
