/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-FS-WRITE.
  Root for optional lean --run of live MultFsWrite.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMultFsWrite.
  Unique needles (trailing newline so HostFrontLiveMultFsWriteParserMain
  is not a prefix of a mill-Main wrap name):
  HostFrontLiveMultFsWriteParserMain
  PARSE-LIVE-MULT-FS-WRITE
  HOST-FRONT-LIVE-MULT-FS-WRITE
  SLAKE_HOST_FRONT_LIVE_MULT_FS_WRITE_V0
  Greppable: SystemsLean.HostFrontLiveMultFsWriteParserMain,
  parseLiveMultFsWriteSource,
  kernelCheckLiveMultFsWriteSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultFsWriteParserMain
  Not mill 68 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMultFsWrite

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultFsWrite.main args
