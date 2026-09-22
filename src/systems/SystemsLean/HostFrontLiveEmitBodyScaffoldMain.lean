/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-BODY-SCAFFOLD.
  Root for optional lean --run of live EmitBodyScaffold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitBodyScaffold.
  This wrap is EmitBodyScaffold.lean. It is not EmitBody.lean.
  Greppable: SystemsLean.HostFrontLiveEmitBodyScaffoldMain,
  HostFrontLiveEmitBodyScaffoldMain, HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_BODY_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-BODY-SCAFFOLD, EMIT-BODY-SCAFFOLD-THEOREM,
  parseLiveEmitBodyScaffoldSource,
  kernelCheckLiveEmitBodyScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitBodyScaffoldMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitBodyScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitBodyScaffold.main args
