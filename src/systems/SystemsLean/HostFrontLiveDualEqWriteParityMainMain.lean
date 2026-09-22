/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-PARITY-MAIN.
  Root for optional lean --run of live DualEqWriteParityMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteParityMain.
  This wrap parses DualEqWriteParityMain.lean only. Do not wrap DualEqWriteParity.lean.
  Do not invent HostFrontLiveDualEqWriteParity. Do not steal DualEqWriteApi companions.
  DualEqWrite.lean does not exist. Not Linear. Not IrGraph. Not ComposeSubsetEmit.
  Not CapableComposeMain. Not HostModuleCheckMain.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteParityMain is not a prefix):
  HostFrontLiveDualEqWriteParityMainMain
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-MAIN
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_MAIN_V0
  DUAL-EQ-WRITE-PARITY-MAIN
  HOST-DUAL-EQ-WRITE-PARITY-MAIN
  Greppable: SystemsLean.HostFrontLiveDualEqWriteParityMainMain,
  parseLiveDualEqWriteParityMainSource,
  kernelCheckLiveDualEqWriteParityMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteParityMainMain
  Not mill 14 remill. Mill stays 69 of 69. Occupancy stays 49. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteParityMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteParityMain.main args
