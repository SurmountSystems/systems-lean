/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-DUAL-EQ-WRITE-API.
  Root for optional lean --run of live DualEqWriteApi.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveDualEqWriteApi.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteApiParserMain
  is not a prefix of a mill-Main wrap name):
  HostFrontLiveDualEqWriteApiParserMain
  PARSE-LIVE-DUAL-EQ-WRITE-API
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-API
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_API_V0
  Greppable: SystemsLean.HostFrontLiveDualEqWriteApiParserMain,
  parseLiveDualEqWriteApiSource,
  kernelCheckLiveDualEqWriteApiSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveDualEqWriteApiParserMain
  Not mill 65. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveDualEqWriteApi

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveDualEqWriteApi.main args
