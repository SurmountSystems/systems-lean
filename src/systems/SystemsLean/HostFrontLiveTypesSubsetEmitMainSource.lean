/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TypesSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypesSubsetEmitMainSource. Not occupancy name 50.
  Not mill 34 remill. Mill stays 69 of 69.
  This wrap parses TypesSubsetEmitMain.lean only. Do not wrap TypesSubsetEmit.lean.
  Do not invent HostFrontLiveTypesSubsetEmit (library wrap).
  Do not steal HostFrontLiveTypesMain.
  This wrap is not GraphSubsetEmitMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveTypesSubsetEmitMain is not a
  prefix hit on HostFrontLiveTypesSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckTypesSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveTypesSubsetEmitMain is not a prefix):
  HostFrontLiveTypesSubsetEmitMainSource
  PARSE-LIVE-TYPES-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-TYPES-SUBSET-EMIT-MAIN
  TYPES-SUBSET-EMIT-MAIN
  HOST-TYPES-SUBSET-EMIT-MAIN
  Live product needles:
  TypesSubsetEmitMain
  slake-types-subset-emit
  import SystemsLean.TypesSubsetEmit
  TYPES-SUBSET-EMIT
  SLAKE_TYPES_SUBSET_EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveTypesSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveTypesSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTypesSubsetEmitMain

/-- Dual-pinned live TypesSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveTypesSubsetEmitMainSource, PARSE-LIVE-TYPES-SUBSET-EMIT-MAIN. -/
def liveTypesSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Types subset freestanding
  emit (SKELETON). Root for lake exe slake-types-subset-emit. Body lives in
  SystemsLean.TypesSubsetEmit (typesSubsetEmitReady / Types unit package write).
  Greppable: SystemsLean.TypesSubsetEmitMain, slake-types-subset-emit,
  TypesSubsetEmitMain, TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.TypesSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.TypesSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.TypesSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveTypesSubsetEmitMain
