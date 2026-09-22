/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-INSTALL-OUT-THEOREMS.
  Root for optional lean --run of live InstallOutTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveInstallOutTheorems.
  Greppable: SystemsLean.HostFrontLiveInstallOutTheoremsMain,
  HostFrontLiveInstallOutTheoremsMain, HOST-FRONT-LIVE-INSTALL-OUT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_THEOREMS_V0,
  PARSE-LIVE-INSTALL-OUT-THEOREMS, INSTALL-OUT-THEOREM,
  parseLiveInstallOutTheoremsSource,
  kernelCheckLiveInstallOutTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveInstallOutTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveInstallOutTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveInstallOutTheorems.main args
