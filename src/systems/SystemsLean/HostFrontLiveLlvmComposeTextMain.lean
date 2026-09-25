/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-COMPOSE-TEXT.
  Root for optional lean --run of live LlvmComposeText.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmComposeText.
  Greppable: SystemsLean.HostFrontLiveLlvmComposeTextMain,
  HostFrontLiveLlvmComposeTextMain, HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_TEXT_V0,
  PARSE-LIVE-LLVM-COMPOSE-TEXT, LLVM-COMPOSE-TEXT-THEOREM,
  parseLiveLlvmComposeTextSource,
  kernelCheckLiveLlvmComposeTextSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmComposeTextMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeText

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmComposeText.main args
