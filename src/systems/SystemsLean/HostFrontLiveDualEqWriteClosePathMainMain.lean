/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN.
  Root for optional lean --run of live DualEqWriteClosePathMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteClosePathMain.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteClosePathMain is not a prefix):
  HostFrontLiveDualEqWriteClosePathMainMain
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CLOSE_PATH_MAIN_V0
  DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  Greppable: SystemsLean.HostFrontLiveDualEqWriteClosePathMainMain,
  parseLiveDualEqWriteClosePathMainSource,
  kernelCheckLiveDualEqWriteClosePathMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteClosePathMainMain
  Not mill 15 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Do not invent HostFrontLiveDualEqWriteClosePath. Do not wrap DualEqWriteClosePath.lean.
  Do not wrap DualEqWriteParityMain. Do not wrap DualEqWriteApiMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteClosePathMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteClosePathMain.main args
