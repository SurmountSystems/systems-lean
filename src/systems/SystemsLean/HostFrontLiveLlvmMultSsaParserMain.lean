/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-MULT-SSA.
  Root for optional lean --run of live LlvmMultSsa.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmMultSsa.
  HostFrontLiveLlvmMultSsaMain.lean is the mill Main parser. This file
  is HostFrontLiveLlvmMultSsaParserMain so the module name does not collide.
  Unique needles (trailing newline so HostFrontLiveLlvmMultSsaParserMain
  is not a prefix of the mill Main module name):
  HostFrontLiveLlvmMultSsaParserMain
  PARSE-LIVE-LLVM-MULT-SSA
  HOST-FRONT-LIVE-LLVM-MULT-SSA
  SLAKE_HOST_FRONT_LIVE_LLVM_MULT_SSA_V0
  LLVM-MULT-SSA
  Greppable: SystemsLean.HostFrontLiveLlvmMultSsaParserMain,
  parseLiveLlvmMultSsaSource,
  kernelCheckLiveLlvmMultSsaSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmMultSsaParserMain
  Not mill 69 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend. FullBackend stays false.
  Not LlvmLinearSsa. Not IrGraph. Not Linear.lean. Not ComposeSubsetEmit.lean.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveLlvmMultSsa

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmMultSsa.main args
