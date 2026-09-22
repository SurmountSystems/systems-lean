/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OFFICIAL-PATH-THEOREMS.
  Root for optional lean --run of live OfficialPathTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveOfficialPathTheorems.
  Unique needles (trailing newline so HostFrontLiveOfficialPath is not a prefix):
  HostFrontLiveOfficialPathTheoremsMain
  HostFrontLiveOfficialPathTheorems
  PARSE-LIVE-OFFICIAL-PATH-THEOREMS
  HOST-FRONT-LIVE-OFFICIAL-PATH-THEOREMS
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_THEOREMS_V0
  OFFICIAL-PATH-THEOREMS
  liveRel
  OfficialPathTheorems.lean
  Greppable: SystemsLean.HostFrontLiveOfficialPathTheoremsMain,
  parseLiveOfficialPathTheoremsSource,
  kernelCheckLiveOfficialPathTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOfficialPathTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveOfficialPathTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOfficialPathTheorems.main args
