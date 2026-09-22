/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FREESTANDING-EMIT-LOAD.
  Root for optional lean --run of live FreestandingEmitLoad.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveFreestandingEmitLoad.
  Greppable: SystemsLean.HostFrontLiveFreestandingEmitLoadMain,
  HostFrontLiveFreestandingEmitLoadMain,
  HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD,
  SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_V0,
  PARSE-LIVE-FREESTANDING-EMIT-LOAD, FREESTANDING-EMIT-LOAD-THEOREM,
  parseLiveFreestandingEmitLoadSource,
  kernelCheckLiveFreestandingEmitLoadSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFreestandingEmitLoadMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  This wrap is FreestandingEmitLoad.lean.
  It is not FreestandingEmitLoadScaffold.lean.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveFreestandingEmitLoad

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFreestandingEmitLoad.main args
