/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-MULT-SSA-MAIN.
  Root for optional lean --run of live LlvmMultSsaMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmMultSsaMain.
  Unique needles (trailing newline so HostFrontLiveLlvmMultSsaMain is not a prefix):
  HostFrontLiveLlvmMultSsaMainMain
  PARSE-LIVE-LLVM-MULT-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-MULT-SSA-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_MULT_SSA_MAIN_V0
  LLVM-MULT-SSA-MAIN
  HOST-LLVM-MULT-SSA-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmMultSsaMainMain,
  parseLiveLlvmMultSsaMainSource,
  kernelCheckLiveLlvmMultSsaMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmMultSsaMainMain
  Not mill 61 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmMultSsa (library wrap). Do not wrap IrGraph.lean.
  Do not steal HostFrontLiveLlvmTypesSsaMain. Do not steal HostFrontLiveLlvmProgramSsaMain. Do not steal HostFrontLiveLlvmGraphSsaMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmMultSsaMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmMultSsaMain.main args
