/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live MultSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultSubsetEmitMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses MultSubsetEmitMain.lean only. Do not wrap MultSubsetEmit.lean.
  Do not invent HostFrontLiveMultSubsetEmit (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveMultSubsetEmitMain is not a
  prefix hit on HostFrontLiveMultSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckMultSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveMultSubsetEmitMain is not a prefix):
  HostFrontLiveMultSubsetEmitMainSource
  PARSE-LIVE-MULT-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-MULT-SUBSET-EMIT-MAIN
  MULT-SUBSET-EMIT-MAIN
  HOST-MULT-SUBSET-EMIT-MAIN
  Live product needles:
  MultSubsetEmitMain
  slake-mult-subset-emit
  import SystemsLean.MultSubsetEmit
  MULT-SUBSET-EMIT
  SLAKE_MULT_SUBSET_EMIT
  multSubsetEmitReady
  Greppable: SYSTEMS_LEAN_HOST, liveMultSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveMultSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveMultSubsetEmitMain

/-- Dual-pinned live MultSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveMultSubsetEmitMainSource, PARSE-LIVE-MULT-SUBSET-EMIT-MAIN. -/
def liveMultSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult subset freestanding
  emit (SKELETON). Root for lake exe slake-mult-subset-emit. Body lives in
  SystemsLean.MultSubsetEmit (multSubsetEmitReady / Mult unit package write).
  Greppable: SystemsLean.MultSubsetEmitMain, slake-mult-subset-emit,
  MultSubsetEmitMain, MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.MultSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveMultSubsetEmitMain
