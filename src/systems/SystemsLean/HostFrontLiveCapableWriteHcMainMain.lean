/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-WRITE-HC-MAIN.
  Root for optional lean --run of live CapableWriteHcMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCapableWriteHcMain.
  Unique needles (trailing newline so HostFrontLiveCapableWriteHcMain is not a prefix):
  HostFrontLiveCapableWriteHcMainMain
  PARSE-LIVE-CAPABLE-WRITE-HC-MAIN
  HOST-FRONT-LIVE-CAPABLE-WRITE-HC-MAIN
  SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_MAIN_V0
  CAPABLE-WRITE-HC-MAIN
  Greppable: SystemsLean.HostFrontLiveCapableWriteHcMainMain,
  parseLiveCapableWriteHcMainSource,
  kernelCheckLiveCapableWriteHcMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableWriteHcMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCapableWriteHcMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableWriteHcMain.main args
