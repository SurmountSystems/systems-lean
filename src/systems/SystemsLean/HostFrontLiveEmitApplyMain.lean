/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-APPLY.
  Root for optional lean --run of live EmitApply.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveEmitApply.
  Greppable: SystemsLean.HostFrontLiveEmitApplyMain,
  HostFrontLiveEmitApplyMain, HOST-FRONT-LIVE-EMIT-APPLY,
  SLAKE_HOST_FRONT_LIVE_EMIT_APPLY_V0,
  PARSE-LIVE-EMIT-APPLY, EMIT-APPLY-THEOREM,
  parseLiveEmitApplySource,
  kernelCheckLiveEmitApplySource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitApplyMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitApply

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitApply.main args
