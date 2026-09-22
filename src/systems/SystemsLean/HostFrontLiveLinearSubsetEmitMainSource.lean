/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LinearSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearSubsetEmitMainSource. Not occupancy name 50.
  Not mill 32 remill. Mill stays 69 of 69.
  This wrap parses LinearSubsetEmitMain.lean only. Do not wrap LinearSubsetEmit.lean.
  Do not invent HostFrontLiveLinearSubsetEmit (library wrap).
  Do not wrap Linear.lean. Do not steal HostFrontLiveLinearUseFail.
  This wrap is not ComposeSubsetEmit. Not IrGraph. Not HostModuleCheckMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLinearSubsetEmitMain is not a
  prefix hit on HostFrontLiveLinearSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckLinearSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveLinearSubsetEmitMain is not a prefix):
  HostFrontLiveLinearSubsetEmitMainSource
  PARSE-LIVE-LINEAR-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT-MAIN
  LINEAR-SUBSET-EMIT-MAIN
  HOST-LINEAR-SUBSET-EMIT-MAIN
  Live product needles:
  LinearSubsetEmitMain
  slake-linear-subset-emit
  import SystemsLean.LinearSubsetEmit
  LINEAR-SUBSET-EMIT
  SLAKE_LINEAR_SUBSET_EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveLinearSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLinearSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLinearSubsetEmitMain

/-- Dual-pinned live LinearSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveLinearSubsetEmitMainSource, PARSE-LIVE-LINEAR-SUBSET-EMIT-MAIN. -/
def liveLinearSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Linear subset freestanding
  emit (SKELETON). Root for lake exe slake-linear-subset-emit. Body lives in
  SystemsLean.LinearSubsetEmit (linearSubsetEmitReady / Linear unit package write).
  Greppable: SystemsLean.LinearSubsetEmitMain, slake-linear-subset-emit,
  LinearSubsetEmitMain, LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LinearSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.LinearSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LinearSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveLinearSubsetEmitMain
