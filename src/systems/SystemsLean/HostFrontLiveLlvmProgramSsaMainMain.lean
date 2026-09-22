/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-PROGRAM-SSA-MAIN.
  Root for optional lean --run of live LlvmProgramSsaMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmProgramSsaMain.
  Unique needles (trailing newline so HostFrontLiveLlvmProgramSsaMain is not a prefix):
  HostFrontLiveLlvmProgramSsaMainMain
  PARSE-LIVE-LLVM-PROGRAM-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-PROGRAM-SSA-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_PROGRAM_SSA_MAIN_V0
  LLVM-PROGRAM-SSA-MAIN
  HOST-LLVM-PROGRAM-SSA-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmProgramSsaMainMain,
  parseLiveLlvmProgramSsaMainSource,
  kernelCheckLiveLlvmProgramSsaMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmProgramSsaMainMain
  Not mill 64 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmProgramSsa. Do not steal HostFrontLiveLlvmTypesSsaMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmProgramSsaMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmProgramSsaMain.main args
