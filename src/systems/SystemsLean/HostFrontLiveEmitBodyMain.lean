/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-BODY.
  Root for optional lean --run of live EmitBody.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitBody.
  Greppable: SystemsLean.HostFrontLiveEmitBodyMain,
  HostFrontLiveEmitBodyMain, HOST-FRONT-LIVE-EMIT-BODY,
  SLAKE_HOST_FRONT_LIVE_EMIT_BODY_V0,
  PARSE-LIVE-EMIT-BODY, EMIT-BODY-THEOREM,
  parseLiveEmitBodySource,
  kernelCheckLiveEmitBodySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitBodyMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitBody

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitBody.main args
