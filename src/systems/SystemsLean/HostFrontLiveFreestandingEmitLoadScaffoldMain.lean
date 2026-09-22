/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD.
  Root for optional lean --run of live FreestandingEmitLoadScaffold.lean
  parse plus HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold.
  Greppable: SystemsLean.HostFrontLiveFreestandingEmitLoadScaffoldMain,
  HostFrontLiveFreestandingEmitLoadScaffoldMain,
  HOST-FRONT-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_FREESTANDING_EMIT_LOAD_SCAFFOLD_V0,
  PARSE-LIVE-FREESTANDING-EMIT-LOAD-SCAFFOLD,
  parseLiveFreestandingEmitLoadScaffoldSource,
  kernelCheckLiveFreestandingEmitLoadScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFreestandingEmitLoadScaffoldMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFreestandingEmitLoadScaffold.main args
