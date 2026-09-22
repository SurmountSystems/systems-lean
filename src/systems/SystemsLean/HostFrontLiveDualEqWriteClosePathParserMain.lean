/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH.
  Root for optional lean --run of live DualEqWriteClosePath.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteClosePath.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteClosePathParserMain
  is not a prefix of mill wrap HostFrontLiveDualEqWriteClosePathMain):
  HostFrontLiveDualEqWriteClosePathParserMain
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CLOSE_PATH_V0
  Greppable: SystemsLean.HostFrontLiveDualEqWriteClosePathParserMain,
  parseLiveDualEqWriteClosePathSource,
  kernelCheckLiveDualEqWriteClosePathSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteClosePathParserMain
  Mill wrap HostFrontLiveDualEqWriteClosePathMain parses DualEqWriteClosePathMain.lean
  only. Do not steal it. Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteClosePath

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteClosePath.main args
