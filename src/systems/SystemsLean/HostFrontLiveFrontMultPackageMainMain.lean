/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-FRONT-MULT-PACKAGE-MAIN.
  Root for optional lean --run of live FrontMultPackageMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveFrontMultPackageMain.
  Unique needles (trailing newline so HostFrontLiveFrontMultPackageMain
  is not a prefix):
  HostFrontLiveFrontMultPackageMainMain
  PARSE-LIVE-FRONT-MULT-PACKAGE-MAIN
  HOST-FRONT-LIVE-FRONT-MULT-PACKAGE-MAIN
  SLAKE_HOST_FRONT_LIVE_FRONT_MULT_PACKAGE_MAIN_V0
  Greppable: SystemsLean.HostFrontLiveFrontMultPackageMainMain,
  parseLiveFrontMultPackageMainSource,
  kernelCheckLiveFrontMultPackageMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveFrontMultPackageMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveFrontMultPackageMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveFrontMultPackageMain.main args
