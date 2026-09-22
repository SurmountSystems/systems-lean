/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PROGRAM-FOREIGN-LINK.
  Root for optional lean --run of live ProgramForeignLink.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveProgramForeignLink.
  Greppable: SystemsLean.HostFrontLiveProgramForeignLinkMain, HostFrontLiveProgramForeignLinkMain,
  HOST-FRONT-LIVE-PROGRAM-FOREIGN-LINK, SLAKE_HOST_FRONT_LIVE_PROGRAM_FOREIGN_LINK_V0,
  PARSE-LIVE-PROGRAM-FOREIGN-LINK, PROGRAM-FOREIGN-LINK,
  parseLiveProgramForeignLinkSource, kernelCheckLiveProgramForeignLinkSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveProgramForeignLinkMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveProgramForeignLink

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveProgramForeignLink.main args
