/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-OFFICIAL-RETIRE.
  Root for optional lean --run of live OfficialRetire.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveOfficialRetire.
  Unique needles (trailing newline so HostFrontLiveOfficialRetire is not a prefix
  of a Theorems peel):
  HostFrontLiveOfficialRetireMain
  PARSE-LIVE-OFFICIAL-RETIRE
  HOST-FRONT-LIVE-OFFICIAL-RETIRE
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_RETIRE_V0
  Greppable: SystemsLean.HostFrontLiveOfficialRetireMain,
  parseLiveOfficialRetireSource,
  kernelCheckLiveOfficialRetireSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveOfficialRetireMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveOfficialRetire

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveOfficialRetire.main args
