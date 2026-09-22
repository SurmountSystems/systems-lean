/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-LINEAR-SUBSET-EMIT-MAIN.
  Root for optional lean --run of live LinearSubsetEmitMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveLinearSubsetEmitMain.
  Unique needles (trailing newline so HostFrontLiveLinearSubsetEmitMain is not a prefix):
  HostFrontLiveLinearSubsetEmitMainMain
  PARSE-LIVE-LINEAR-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT-MAIN
  SLAKE_HOST_FRONT_LIVE_LINEAR_SUBSET_EMIT_MAIN_V0
  LINEAR-SUBSET-EMIT-MAIN
  HOST-LINEAR-SUBSET-EMIT-MAIN
  Greppable: SystemsLean.HostFrontLiveLinearSubsetEmitMainMain,
  parseLiveLinearSubsetEmitMainSource,
  kernelCheckLiveLinearSubsetEmitMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveLinearSubsetEmitMainMain
  Not mill 32 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  This wrap parses LinearSubsetEmitMain.lean only. Do not wrap LinearSubsetEmit.lean.
  Do not invent HostFrontLiveLinearSubsetEmit. Do not wrap Linear.lean.
  Not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  Occupancy leftover HostModuleCheckLinearSubsetEmitTerm is not this wrap.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveLinearSubsetEmitMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveLinearSubsetEmitMain.main args
