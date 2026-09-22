/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-MULT-FS-WRITE-MAIN.
  Root for optional lean --run of live MultFsWriteMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveMultFsWriteMain.
  Unique needles (trailing newline so HostFrontLiveMultFsWriteMain is not a prefix):
  HostFrontLiveMultFsWriteMainMain
  PARSE-LIVE-MULT-FS-WRITE-MAIN
  HOST-FRONT-LIVE-MULT-FS-WRITE-MAIN
  SLAKE_HOST_FRONT_LIVE_MULT_FS_WRITE_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveMultFsWriteMainMain,
  parseLiveMultFsWriteMainSource,
  kernelCheckLiveMultFsWriteMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveMultFsWriteMainMain
  Not mill 68 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveMultFsWriteMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveMultFsWriteMain.main args
