/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-LINEAR.
  Root for optional lean --run of live ParityLinear.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveParityLinear.
  Greppable: SystemsLean.HostFrontLiveParityLinearMain,
  HostFrontLiveParityLinearMain, HOST-FRONT-LIVE-PARITY-LINEAR,
  SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_V0,
  PARSE-LIVE-PARITY-LINEAR, PARITY-LINEAR-THEOREM,
  parseLiveParityLinearSource,
  kernelCheckLiveParityLinearSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityLinearMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveParityLinear

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityLinear.main args
