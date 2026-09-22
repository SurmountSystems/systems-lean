/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS.
  Root for optional lean --run of live BootstrapHonestyTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver.
  Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveBootstrapHonestyTheorems.
  Greppable: SystemsLean.HostFrontLiveBootstrapHonestyTheoremsMain,
  HostFrontLiveBootstrapHonestyTheoremsMain,
  HOST-FRONT-LIVE-BOOTSTRAP-HONESTY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_BOOTSTRAP_HONESTY_THEOREMS_V0,
  PARSE-LIVE-BOOTSTRAP-HONESTY-THEOREMS, BOOTSTRAP-THEOREM,
  parseLiveBootstrapHonestyTheoremsSource,
  kernelCheckLiveBootstrapHonestyTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveBootstrapHonestyTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveBootstrapHonestyTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveBootstrapHonestyTheorems.main args
