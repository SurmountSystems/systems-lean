/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-EMIT.
  Root for optional lean --run of live ParityEmit.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityEmit.
  Greppable: SystemsLean.HostFrontLiveParityEmitMain,
  HostFrontLiveParityEmitMain, HOST-FRONT-LIVE-PARITY-EMIT,
  SLAKE_HOST_FRONT_LIVE_PARITY_EMIT_V0,
  PARSE-LIVE-PARITY-EMIT, PARITY-EMIT-THEOREM,
  parseLiveParityEmitSource,
  kernelCheckLiveParityEmitSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityEmitMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityEmit

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityEmit.main args
