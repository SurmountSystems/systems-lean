/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OFFICIAL-RETIRE-MAIN.
  Root for optional lean --run of live OfficialRetireMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostOfficialRetireMain.
  Unique needles (trailing newline so HostFrontLiveHostOfficialRetireMain is not a prefix):
  HostFrontLiveHostOfficialRetireMainMain
  PARSE-LIVE-OFFICIAL-RETIRE-MAIN
  HOST-FRONT-LIVE-OFFICIAL-RETIRE-MAIN
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_MAIN_V0
  OFFICIAL-RETIRE-MAIN
  HOST-OFFICIAL-RETIRE-MAIN
  Greppable: SystemsLean.HostFrontLiveHostOfficialRetireMainMain,
  parseLiveOfficialRetireMainSource,
  kernelCheckLiveOfficialRetireMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostOfficialRetireMainMain
  Not mill 17 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Do not steal HostFrontLiveOfficialRetireMain (library companion).
  Do not wrap OfficialRetire.lean. Do not wrap OfficialPathMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostOfficialRetireMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostOfficialRetireMain.main args
