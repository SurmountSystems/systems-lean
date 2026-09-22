/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-COMPOSE-SSA-MAIN.
  Root for optional lean --run of live LlvmComposeSsaMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmComposeSsaMain.
  Unique needles (trailing newline so HostFrontLiveLlvmComposeSsaMain is not a prefix):
  HostFrontLiveLlvmComposeSsaMainMain
  PARSE-LIVE-LLVM-COMPOSE-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-COMPOSE-SSA-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_SSA_MAIN_V0
  LLVM-COMPOSE-SSA-MAIN
  HOST-LLVM-COMPOSE-SSA-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmComposeSsaMainMain,
  parseLiveLlvmComposeSsaMainSource,
  kernelCheckLiveLlvmComposeSsaMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmComposeSsaMainMain
  Not mill 56 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmComposeSsa (library wrap). Do not wrap IrGraph.lean.
  Do not wrap Linear.lean (QTT Linear module).
  Do not wrap ComposeSubsetEmit.lean. Do not wrap ComposeSubsetEmitMain.lean.
  Do not wrap ComposeSubsetRebuildMain.lean. Do not wrap CapableComposeMain.lean.
  Do not steal HostFrontLiveLlvmLinearSsaMain (sibling LINEAR mill wrap).
  Do not steal HostFrontLiveLlvmTypesSsaMain. Do not steal HostFrontLiveLlvmProgramSsaMain. Do not steal HostFrontLiveLlvmGraphSsaMain.
  Do not steal HostFrontLiveLlvmMultSsaMain (sibling MULT mill wrap).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmComposeSsaMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmComposeSsaMain.main args
