/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ErasureSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveErasureSubsetEmitMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses ErasureSubsetEmitMain.lean only. Do not wrap Erasure.lean.
  HostFrontLiveErasure wraps Erasure.lean, not this mill Main.
  Do not steal HostFrontLiveErasure.lean, HostFrontLiveErasureMain.lean,
  or HostFrontLiveErasureSource.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveErasureSubsetEmitMain is not a
  prefix hit on HostFrontLiveErasureSubsetEmitMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveErasureSubsetEmitMain is not a prefix):
  HostFrontLiveErasureSubsetEmitMainSource
  PARSE-LIVE-ERASURE-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-ERASURE-SUBSET-EMIT-MAIN
  ERASURE-SUBSET-EMIT-MAIN
  Live product needles:
  ErasureSubsetEmitMain
  slake-erasure-subset-emit
  import SystemsLean.ErasureSubsetEmit
  ERASURE-SUBSET-EMIT
  SLAKE_ERASURE_SUBSET_EMIT
  erasureSubsetEmitReady
  Greppable: SYSTEMS_LEAN_HOST, liveErasureSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveErasureSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveErasureSubsetEmitMain

/-- Dual-pinned live ErasureSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveErasureSubsetEmitMainSource, PARSE-LIVE-ERASURE-SUBSET-EMIT-MAIN. -/
def liveErasureSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Erasure subset freestanding
  emit (SKELETON). Root for lake exe slake-erasure-subset-emit. Body lives in
  SystemsLean.ErasureSubsetEmit (erasureSubsetEmitReady / Erasure unit package write).
  Greppable: SystemsLean.ErasureSubsetEmitMain, slake-erasure-subset-emit,
  ErasureSubsetEmitMain, ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ErasureSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ErasureSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ErasureSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveErasureSubsetEmitMain
