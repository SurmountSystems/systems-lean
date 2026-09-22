/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-INSTALL-OUT-MAIN.
  Root for optional lean --run of live InstallOutMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveInstallOutMain.
  Unique needles (trailing newline so HostFrontLiveInstallOutMain is not a prefix):
  HostFrontLiveInstallOutMainMain
  PARSE-LIVE-INSTALL-OUT-MAIN
  HOST-FRONT-LIVE-INSTALL-OUT-MAIN
  SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_MAIN_V0
  INSTALL-OUT-MAIN
  HOST-INSTALL-OUT-MAIN
  Greppable: SystemsLean.HostFrontLiveInstallOutMainMain,
  parseLiveInstallOutMainSource,
  kernelCheckLiveInstallOutMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveInstallOutMainMain
  Not mill 9 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Do not invent HostFrontLiveInstallOut. Do not wrap InstallOut.lean.
  Do not steal HostFrontLiveCapableRegenerateMain.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveInstallOutMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveInstallOutMain.main args
