/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-COMPOSE-TEXT-MAIN.
  Root for optional lean --run of live LlvmComposeTextMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLlvmComposeTextMain.
  Unique needles (trailing newline so HostFrontLiveLlvmComposeTextMain is not a prefix):
  HostFrontLiveLlvmComposeTextMainMain
  PARSE-LIVE-LLVM-COMPOSE-TEXT-MAIN
  HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT-MAIN
  SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_TEXT_MAIN_V0
  LLVM-COMPOSE-TEXT-MAIN
  HOST-LLVM-COMPOSE-TEXT-MAIN
  Greppable: SystemsLean.HostFrontLiveLlvmComposeTextMainMain,
  parseLiveLlvmComposeTextMainSource,
  kernelCheckLiveLlvmComposeTextMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmComposeTextMainMain
  Not mill 60 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not invent HostFrontLiveLlvmComposeText (library wrap).
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmComposeTextMain.main args
