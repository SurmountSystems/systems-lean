/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-FULL-BAR.
  Root for optional lean --run of live CapableFullBar.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableFullBar.
  Greppable: SystemsLean.HostFrontLiveCapableFullBarMain,
  HostFrontLiveCapableFullBarMain, HOST-FRONT-LIVE-CAPABLE-FULL-BAR,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_V0,
  PARSE-LIVE-CAPABLE-FULL-BAR, CAPABLE-FULL-BAR-THEOREM,
  parseLiveCapableFullBarSource,
  kernelCheckLiveCapableFullBarSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableFullBarMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableFullBar

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableFullBar.main args
