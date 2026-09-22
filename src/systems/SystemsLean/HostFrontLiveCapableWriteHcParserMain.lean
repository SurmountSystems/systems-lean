/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-WRITE-HC.
  Root for optional lean --run of live CapableWriteHc.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCapableWriteHc.
  Unique needles (trailing newline so HostFrontLiveCapableWriteHcParserMain
  is not a prefix of mill wrap HostFrontLiveCapableWriteHcMain):
  HostFrontLiveCapableWriteHcParserMain
  PARSE-LIVE-CAPABLE-WRITE-HC
  HOST-FRONT-LIVE-CAPABLE-WRITE-HC
  SLAKE_HOST_FRONT_LIVE_CAPABLE_WRITE_HC_V0
  Greppable: SystemsLean.HostFrontLiveCapableWriteHcParserMain,
  parseLiveCapableWriteHcSource,
  kernelCheckLiveCapableWriteHcSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableWriteHcParserMain
  Mill wrap HostFrontLiveCapableWriteHcMain parses CapableWriteHcMain.lean
  only. Do not steal it. Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCapableWriteHc

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableWriteHc.main args
