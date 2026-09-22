/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-TYPES-SSA-MAIN.
  Root for optional lean --run of live LlvmTypesSsaMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmTypesSsaMain.
  Unique needles (trailing newline so HostFrontLiveLlvmTypesSsaMain is not a prefix):
  HostFrontLiveLlvmTypesSsaMainMain
  PARSE-LIVE-LLVM-TYPES-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-TYPES-SSA-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_TYPES_SSA_MAIN_V0
  LLVM-TYPES-SSA-MAIN
  HOST-LLVM-TYPES-SSA-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmTypesSsaMainMain,
  parseLiveLlvmTypesSsaMainSource,
  kernelCheckLiveLlvmTypesSsaMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmTypesSsaMainMain
  Not mill 58 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmTypesSsa (library wrap).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmTypesSsaMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmTypesSsaMain.main args
