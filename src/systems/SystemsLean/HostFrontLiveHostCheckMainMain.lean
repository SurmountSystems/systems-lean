/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-HOST-CHECK-MAIN.
  Root for optional lean --run of live HostCheckMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveHostCheckMain.
  Unique needles (trailing newline so HostFrontLiveHostCheckMain is not a prefix):
  HostFrontLiveHostCheckMainMain
  PARSE-LIVE-HOST-CHECK-MAIN
  HOST-FRONT-LIVE-HOST-CHECK-MAIN
  SLAKE_HOST_FRONT_LIVE_HOST_CHECK_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveHostCheckMainMain,
  parseLiveHostCheckMainSource,
  kernelCheckLiveHostCheckMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveHostCheckMainMain
  Not mill 33 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveHostCheckMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveHostCheckMain.main args
