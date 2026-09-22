/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ExtractSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveExtractSubsetEmitMainSource. Not occupancy name 50.
  Not mill 38 remill. Mill stays 69 of 69.
  This wrap parses ExtractSubsetEmitMain.lean only. Do not wrap ExtractSubsetEmit.lean.
  Do not invent HostFrontLiveExtractSubsetEmit (library wrap).
  Do not steal HostFrontLiveExtractMain (library wrap of Extract.lean).
  This wrap is not GraphSubsetEmitMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveExtractSubsetEmitMain is not a
  prefix hit on HostFrontLiveExtractSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckExtractSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveExtractSubsetEmitMain is not a prefix):
  HostFrontLiveExtractSubsetEmitMainSource
  PARSE-LIVE-EXTRACT-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-EXTRACT-SUBSET-EMIT-MAIN
  EXTRACT-SUBSET-EMIT-MAIN
  HOST-EXTRACT-SUBSET-EMIT-MAIN
  Live product needles:
  ExtractSubsetEmitMain
  slake-extract-subset-emit
  import SystemsLean.ExtractSubsetEmit
  EXTRACT-SUBSET-EMIT
  SLAKE_EXTRACT_SUBSET_EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveExtractSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveExtractSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveExtractSubsetEmitMain

/-- Dual-pinned live ExtractSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveExtractSubsetEmitMainSource, PARSE-LIVE-EXTRACT-SUBSET-EMIT-MAIN. -/
def liveExtractSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Extract subset freestanding
  emit (SKELETON). Root for lake exe slake-extract-subset-emit. Body lives in
  SystemsLean.ExtractSubsetEmit (extractSubsetEmitReady / Extract unit package write).
  Greppable: SystemsLean.ExtractSubsetEmitMain, slake-extract-subset-emit,
  ExtractSubsetEmitMain, EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ExtractSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ExtractSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ExtractSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveExtractSubsetEmitMain
