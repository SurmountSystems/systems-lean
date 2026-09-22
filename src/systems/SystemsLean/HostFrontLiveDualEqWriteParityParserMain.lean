/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-PARITY.
  Root for optional lean --run of live DualEqWriteParity.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteParity.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteParityParserMain
  is not a prefix of mill wrap HostFrontLiveDualEqWriteParityMain):
  HostFrontLiveDualEqWriteParityParserMain
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_V0
  Greppable: SystemsLean.HostFrontLiveDualEqWriteParityParserMain,
  parseLiveDualEqWriteParitySource,
  kernelCheckLiveDualEqWriteParitySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteParityParserMain
  Mill wrap HostFrontLiveDualEqWriteParityMain parses DualEqWriteParityMain.lean
  only. Do not steal it. Not mill remill. Mill stays 69 of 69.
  Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteParity

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteParity.main args
