/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OFFICIAL-PATH.
  Root for optional lean --run of live OfficialPath.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveOfficialPath.
  Unique needles (trailing newline so HostFrontLiveOfficialPath is not a prefix
  of a Theorems peel):
  HostFrontLiveOfficialPathMain
  PARSE-LIVE-OFFICIAL-PATH
  HOST-FRONT-LIVE-OFFICIAL-PATH
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_V0
  Greppable: SystemsLean.HostFrontLiveOfficialPathMain,
  parseLiveOfficialPathSource,
  kernelCheckLiveOfficialPathSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOfficialPathMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveOfficialPath

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOfficialPath.main args
