/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EXTRACT-THEOREMS.
  Root for optional lean --run of live ExtractTheorems.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveExtractTheorems.
  Greppable: SystemsLean.HostFrontLiveExtractTheoremsMain, HostFrontLiveExtractTheoremsMain,
  HOST-FRONT-LIVE-EXTRACT-THEOREMS, SLAKE_HOST_FRONT_LIVE_EXTRACT_THEOREMS_V0,
  PARSE-LIVE-EXTRACT-THEOREMS, parseLiveExtractTheoremsSource,
  kernelCheckLiveExtractTheoremsSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveExtractTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveExtractTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveExtractTheorems.main args
