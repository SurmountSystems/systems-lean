/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD.
  Root for optional lean --run of live EmitExtractScaffold.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitExtractScaffold.
  Greppable: SystemsLean.HostFrontLiveEmitExtractScaffoldMain,
  HostFrontLiveEmitExtractScaffoldMain, HOST-FRONT-LIVE-EMIT-EXTRACT-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-EXTRACT-SCAFFOLD,
  parseLiveEmitExtractScaffoldSource,
  kernelCheckLiveEmitExtractScaffoldSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitExtractScaffoldMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitExtractScaffold

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitExtractScaffold.main args
