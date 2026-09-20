/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-EMITBODYTERM.
  Root for optional lean --run of live HostModuleCheckEmitBodyTerm.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveEmitBodyTerm.
  Greppable: SystemsLean.HostFrontLiveEmitBodyTermMain,
  HostFrontLiveEmitBodyTermMain, HOST-FRONT-LIVE-EMITBODYTERM,
  SLAKE_HOST_FRONT_LIVE_EMITBODYTERM_V0, PARSE-LIVE-EMITBODYTERM,
  parseLiveEmitBodyTermSource, kernelCheckLiveEmitBodyTermSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveEmitBodyTermMain
  Not mill 70. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveEmitBodyTerm

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveEmitBodyTerm.main args
