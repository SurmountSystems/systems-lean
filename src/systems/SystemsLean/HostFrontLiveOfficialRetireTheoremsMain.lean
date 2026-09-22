/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS.
  Root for optional lean --run of live OfficialRetireTheorems.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveOfficialRetireTheorems.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of the
  library wrap needle is not a prefix hit):
  HostFrontLiveOfficialRetireTheoremsMain
  PARSE-LIVE-OFFICIAL-RETIRE-THEOREMS
  HOST-FRONT-LIVE-OFFICIAL-RETIRE-THEOREMS
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_THEOREMS_V0
  Greppable: SystemsLean.HostFrontLiveOfficialRetireTheoremsMain,
  parseLiveOfficialRetireTheoremsSource,
  kernelCheckLiveOfficialRetireTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOfficialRetireTheoremsMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveOfficialRetireTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOfficialRetireTheorems.main args
