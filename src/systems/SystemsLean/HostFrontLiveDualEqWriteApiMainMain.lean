/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-API-MAIN.
  Root for optional lean --run of live DualEqWriteApiMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteApiMain.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteApiMain is not a prefix):
  HostFrontLiveDualEqWriteApiMainMain
  PARSE-LIVE-DUAL-EQ-WRITE-API-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-API-MAIN
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_API_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveDualEqWriteApiMainMain,
  parseLiveDualEqWriteApiMainSource,
  kernelCheckLiveDualEqWriteApiMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteApiMainMain
  Not mill 65 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteApiMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteApiMain.main args
