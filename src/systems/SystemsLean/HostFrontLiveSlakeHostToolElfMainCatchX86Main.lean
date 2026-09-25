/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86.
  Root for optional lean --run of live SlakeHostToolElfMainCatchX86.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86.
  Greppable: SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86Main,
  HostFrontLiveSlakeHostToolElfMainCatchX86Main,
  HOST-FRONT-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86,
  SLAKE_HOST_FRONT_LIVE_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_X86_V0,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86,
  parseLiveSlakeHostToolElfMainCatchX86Source, kernelCheckLiveSlakeHostToolElfMainCatchX86Source,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86Main
  Not mill 70. Not occupancy name 50. Not FullHost. Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  FullBackend stays false. slakeOwnsPackageTypecheck stays false. SKELETON.
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86.main args
