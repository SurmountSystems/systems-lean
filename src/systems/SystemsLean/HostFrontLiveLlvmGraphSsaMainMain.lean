/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-GRAPH-SSA-MAIN.
  Root for optional lean --run of live LlvmGraphSsaMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmGraphSsaMain.
  Unique needles (trailing newline so HostFrontLiveLlvmGraphSsaMain is not a prefix):
  HostFrontLiveLlvmGraphSsaMainMain
  PARSE-LIVE-LLVM-GRAPH-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-GRAPH-SSA-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_GRAPH_SSA_MAIN_V0
  LLVM-GRAPH-SSA-MAIN
  HOST-LLVM-GRAPH-SSA-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmGraphSsaMainMain,
  parseLiveLlvmGraphSsaMainSource,
  kernelCheckLiveLlvmGraphSsaMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmGraphSsaMainMain
  Not mill 65 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmGraphSsa (library wrap). Do not wrap IrGraph.lean.
  Do not steal HostFrontLiveLlvmTypesSsaMain. Do not steal HostFrontLiveLlvmProgramSsaMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmGraphSsaMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmGraphSsaMain.main args
