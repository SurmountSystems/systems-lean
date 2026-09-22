/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live FreestandingEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFreestandingEmitMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses FreestandingEmitMain.lean only.
  Unique needles use trailing newline so HostFrontLiveFreestandingEmitMain is not
  a prefix hit on HostFrontLiveFreestandingEmitMainSource or a Theorems peel.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveFreestandingEmitMain is not a prefix):
  HostFrontLiveFreestandingEmitMainSource
  PARSE-LIVE-FREESTANDING-EMIT-MAIN
  HOST-FRONT-LIVE-FREESTANDING-EMIT-MAIN
  FREESTANDING-EMIT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveFreestandingEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFreestandingEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFreestandingEmitMain

/-- Dual-pinned live FreestandingEmitMain.lean bytes (must match on-disk file).
    Greppable: liveFreestandingEmitMainSource, PARSE-LIVE-FREESTANDING-EMIT-MAIN. -/
def liveFreestandingEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding emit (SKELETON).
  Root for lake exe slake-emit-freestanding-c. Body lives in
  SystemsLean.FreestandingEmit (emitAtRoot). Thin main so other host modules may
  import FreestandingEmit without top-level main clash (e.g. ProductPathWriteHc).
  Greppable: slake-emit-freestanding-c, FreestandingEmitMain, FreestandingEmit,
  emitAtRoot, SLAKE_EMIT_FREESTANDING_C_V0, SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.FreestandingEmit

/-- Lake / lean --run entry: forward argv to FreestandingEmit. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.FreestandingEmit.main args
"#

end SystemsLean.HostFrontLiveFreestandingEmitMain
