/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMIT-EXTRACT.
  Root for optional lean --run of live EmitExtract.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not a remill.
  Body lives in SystemsLean.HostFrontLiveEmitExtract.
  Greppable: SystemsLean.HostFrontLiveEmitExtractMain,
  HostFrontLiveEmitExtractMain, HOST-FRONT-LIVE-EMIT-EXTRACT,
  SLAKE_HOST_FRONT_LIVE_EMIT_EXTRACT_V0,
  PARSE-LIVE-EMIT-EXTRACT, EMIT-EXTRACT,
  parseLiveEmitExtractSource,
  kernelCheckLiveEmitExtractSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitExtractMain
  Not FullHost. Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveEmitExtract

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitExtract.main args
