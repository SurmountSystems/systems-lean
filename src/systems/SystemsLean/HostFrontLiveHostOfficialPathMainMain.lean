/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-OFFICIAL-PATH-MAIN.
  Root for optional lean --run of live OfficialPathMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostOfficialPathMain.
  Unique needles (trailing newline so HostFrontLiveHostOfficialPathMain is not a prefix):
  HostFrontLiveHostOfficialPathMainMain
  PARSE-LIVE-HOST-OFFICIAL-PATH-MAIN
  HOST-FRONT-LIVE-HOST-OFFICIAL-PATH-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_OFFICIAL_PATH_MAIN_V0
  OFFICIAL-PATH-MAIN
  HOST-OFFICIAL-PATH-MAIN
  Greppable: SystemsLean.HostFrontLiveHostOfficialPathMainMain,
  parseLiveHostOfficialPathMainSource,
  kernelCheckLiveHostOfficialPathMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostOfficialPathMainMain
  Not mill 12 remill (just twelfth-host-tool). Mill stays 69 of 69.
  Occupancy stays 49. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostOfficialPathMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostOfficialPathMain.main args
