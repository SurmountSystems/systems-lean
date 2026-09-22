/-
  SYSTEMS_LEAN_HOST partial. Thin driver for PARSE-LIVE-LINEAR-THEOREMS.
  Root for optional lean --run of live LinearTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearTheorems.
  This wrap parses LinearTheorems.lean only. Not the Linear.lean library.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a shorter
  Linear needle is not a prefix hit):
  HostFrontLiveLinearTheoremsMain
  PARSE-LIVE-LINEAR-THEOREMS
  HOST-FRONT-LIVE-LINEAR-THEOREMS
  SLAKE_HOST_FRONT_LIVE_LINEAR_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveLinearTheoremsMain,
  parseLiveLinearTheoremsSource,
  kernelCheckLiveLinearTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearTheorems.main args
