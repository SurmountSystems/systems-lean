/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-ERASURE-SCAFFOLD.
  Root for optional lean --run of live EmitErasureScaffold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitErasureScaffold.
  Greppable: SystemsLean.HostFrontLiveEmitErasureScaffoldMain,
  HostFrontLiveEmitErasureScaffoldMain, HOST-FRONT-LIVE-EMIT-ERASURE-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-ERASURE-SCAFFOLD,
  parseLiveEmitErasureScaffoldSource,
  kernelCheckLiveEmitErasureScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitErasureScaffoldMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitErasureScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitErasureScaffold.main args
