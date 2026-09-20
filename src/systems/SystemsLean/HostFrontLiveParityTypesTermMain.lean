/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-PARITY-TYPES-TERM.
  Root for optional lean --run of live HostModuleCheckParityTypesTerm.lean parse + kernelCheck.
  Body lives in SystemsLean.HostFrontLiveParityTypesTerm.
  Greppable: SystemsLean.HostFrontLiveParityTypesTermMain, HostFrontLiveParityTypesTermMain,
  HOST-FRONT-LIVE-PARITY-TYPES-TERM, SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_TERM_V0,
  PARSE-LIVE-PARITY-TYPES-TERM, parseLiveParityTypesTermSource,
  kernelCheckLiveParityTypesTermSource, SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveParityTypesTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveParityTypesTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveParityTypesTerm.main args
