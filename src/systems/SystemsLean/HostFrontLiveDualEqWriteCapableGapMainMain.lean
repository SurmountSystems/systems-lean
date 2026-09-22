/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN.
  Root for optional lean --run of live DualEqWriteCapableGapMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteCapableGapMain.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteCapableGapMain is not a prefix):
  HostFrontLiveDualEqWriteCapableGapMainMain
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_MAIN_V0
  DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  HOST-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  Greppable: SystemsLean.HostFrontLiveDualEqWriteCapableGapMainMain,
  parseLiveDualEqWriteCapableGapMainSource,
  kernelCheckLiveDualEqWriteCapableGapMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteCapableGapMainMain
  Not mill 16 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Do not invent HostFrontLiveDualEqWriteCapableGap. Do not wrap DualEqWriteCapableGap.lean.
  Do not wrap DualEqWriteApiMain. Do not steal DualEqWriteParityMain.
  Do not steal DualEqWriteClosePathMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteCapableGapMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteCapableGapMain.main args
