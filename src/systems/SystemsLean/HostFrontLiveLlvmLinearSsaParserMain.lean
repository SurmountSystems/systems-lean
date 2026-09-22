/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-LINEAR-SSA.
  Root for optional lean --run of live LlvmLinearSsa.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmLinearSsa.
  This file is the ParserMain companion. The core module name has no Main.
  Unique needles (trailing newline in the library, checked by the core parser):
  import SystemsLean.KernelLinear
  namespace SystemsLean.LlvmLinearSsa
  def stageId : String := "SLAKE_LLVM_LINEAR_SSA_V0"
  def llvmLinearSsaFullBackendClaimed : Bool := false
  end SystemsLean.LlvmLinearSsa
  PARSE-LIVE-LLVM-LINEAR-SSA
  HOST-FRONT-LIVE-LLVM-LINEAR-SSA
  LLVM-LINEAR-SSA
  Greppable: SystemsLean.HostFrontLiveLlvmLinearSsaParserMain,
  parseLiveLlvmLinearSsaSource,
  kernelCheckLiveLlvmLinearSsaSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmLinearSsaParserMain
  Not mill 62 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Not Linear.lean. Not IrGraph.lean. Not ComposeSubsetEmit.lean.
  Dests skipped. Not a mill remill.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmLinearSsa

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmLinearSsa.main args
