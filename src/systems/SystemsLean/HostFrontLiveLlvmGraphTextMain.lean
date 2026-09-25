/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-GRAPH-TEXT.
  Root for optional lean --run of live LlvmGraphText.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmGraphText.
  Greppable: SystemsLean.HostFrontLiveLlvmGraphTextMain,
  HostFrontLiveLlvmGraphTextMain, HOST-FRONT-LIVE-LLVM-GRAPH-TEXT,
  SLAKE_HOST_FRONT_LIVE_LLVM_GRAPH_TEXT_V0,
  PARSE-LIVE-LLVM-GRAPH-TEXT,
  parseLiveLlvmGraphTextSource,
  kernelCheckLiveLlvmGraphTextSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmGraphTextMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmGraphText

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmGraphText.main args
