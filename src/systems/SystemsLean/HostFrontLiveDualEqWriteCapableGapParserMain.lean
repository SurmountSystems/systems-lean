/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP.
  Root for optional lean --run of live DualEqWriteCapableGap.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteCapableGap.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteCapableGapParserMain
  is not a prefix of mill wrap HostFrontLiveDualEqWriteCapableGapMain):
  HostFrontLiveDualEqWriteCapableGapParserMain
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_V0
  Greppable: SystemsLean.HostFrontLiveDualEqWriteCapableGapParserMain,
  parseLiveDualEqWriteCapableGapSource,
  kernelCheckLiveDualEqWriteCapableGapSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteCapableGapParserMain
  Mill wrap HostFrontLiveDualEqWriteCapableGapMain parses DualEqWriteCapableGapMain.lean
  only. Do not steal it. Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteCapableGap

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGap.main args
