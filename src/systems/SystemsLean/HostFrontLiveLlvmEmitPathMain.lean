/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LLVM-EMIT-PATH.
  Root for optional lean --run of live LlvmEmitPath.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveLlvmEmitPath.
  Greppable: SystemsLean.HostFrontLiveLlvmEmitPathMain,
  HostFrontLiveLlvmEmitPathMain, HOST-FRONT-LIVE-LLVM-EMIT-PATH,
  SLAKE_HOST_FRONT_LIVE_LLVM_EMIT_PATH_V0,
  PARSE-LIVE-LLVM-EMIT-PATH, LLVM-EMIT-PATH-THEOREM,
  parseLiveLlvmEmitPathSource,
  kernelCheckLiveLlvmEmitPathSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLlvmEmitPathMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmEmitPath

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLlvmEmitPath.main args
