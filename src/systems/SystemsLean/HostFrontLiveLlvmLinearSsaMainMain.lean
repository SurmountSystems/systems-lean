/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-LINEAR-SSA-MAIN.
  Root for optional lean --run of live LlvmLinearSsaMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmLinearSsaMain.
  Unique needles (trailing newline so HostFrontLiveLlvmLinearSsaMain is not a prefix):
  HostFrontLiveLlvmLinearSsaMainMain
  PARSE-LIVE-LLVM-LINEAR-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-LINEAR-SSA-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_LINEAR_SSA_MAIN_V0
  LLVM-LINEAR-SSA-MAIN
  HOST-LLVM-LINEAR-SSA-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmLinearSsaMainMain,
  parseLiveLlvmLinearSsaMainSource,
  kernelCheckLiveLlvmLinearSsaMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmLinearSsaMainMain
  Not mill 62 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmLinearSsa (library wrap). Do not wrap IrGraph.lean.
  Do not wrap Linear.lean (QTT Linear module).
  Do not steal HostFrontLiveLlvmTypesSsaMain. Do not steal HostFrontLiveLlvmProgramSsaMain. Do not steal HostFrontLiveLlvmGraphSsaMain.
  Do not steal HostFrontLiveLlvmMultSsaMain (sibling MULT mill wrap).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmLinearSsaMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmLinearSsaMain.main args
