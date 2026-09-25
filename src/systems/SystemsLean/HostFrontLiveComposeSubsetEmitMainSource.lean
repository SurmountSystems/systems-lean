/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ComposeSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveComposeSubsetEmitMainSource. Not occupancy name 50.
  not a remill. Mill stays 69 of 69.
  This wrap parses ComposeSubsetEmitMain.lean only. Do not wrap ComposeSubsetEmit.lean.
  Do not invent HostFrontLiveComposeSubsetEmit (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveComposeSubsetEmitMain is not a
  prefix hit on HostFrontLiveComposeSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckComposeSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveComposeSubsetEmitMain is not a prefix):
  HostFrontLiveComposeSubsetEmitMainSource
  PARSE-LIVE-COMPOSE-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT-MAIN
  COMPOSE-SUBSET-EMIT-MAIN
  HOST-COMPOSE-SUBSET-EMIT-MAIN
  Live product needles:
  ComposeSubsetEmitMain
  slake-compose-subset-emit
  import SystemsLean.ComposeSubsetEmit
  COMPOSE-SUBSET-EMIT
  SLAKE_COMPOSE_SUBSET_EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveComposeSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveComposeSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveComposeSubsetEmitMain

/-- Dual-pinned live ComposeSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveComposeSubsetEmitMainSource, PARSE-LIVE-COMPOSE-SUBSET-EMIT-MAIN. -/
def liveComposeSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Compose subset freestanding
  emit (SKELETON). Root for lake exe slake-compose-subset-emit. Body lives in
  SystemsLean.ComposeSubsetEmit (composeSubsetEmitReady / Compose unit package write).
  Greppable: SystemsLean.ComposeSubsetEmitMain, slake-compose-subset-emit,
  ComposeSubsetEmitMain, COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ComposeSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ComposeSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ComposeSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveComposeSubsetEmitMain
