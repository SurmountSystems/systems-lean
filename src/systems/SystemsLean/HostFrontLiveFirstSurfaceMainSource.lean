/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live FirstSurfaceMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFirstSurfaceMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses FirstSurfaceMain.lean only.
  HostFrontLiveFirstSurface wraps FirstSurface.lean, not FirstSurfaceMain.lean.
  Unique needles use trailing newline so HostFrontLiveFirstSurfaceMain is not
  a prefix hit on HostFrontLiveFirstSurfaceMainSource or a Theorems peel.
  Occupancy leftover HostModuleCheckFirstSurfaceTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveFirstSurfaceMain is not a prefix):
  HostFrontLiveFirstSurfaceMainSource
  PARSE-LIVE-FIRST-SURFACE-MAIN
  HOST-FRONT-LIVE-FIRST-SURFACE-MAIN
  FIRST-SURFACE-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveFirstSurfaceMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveFirstSurfaceMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveFirstSurfaceMain

/-- Dual-pinned live FirstSurfaceMain.lean bytes (must match on-disk file).
    Greppable: liveFirstSurfaceMainSource, PARSE-LIVE-FIRST-SURFACE-MAIN. -/
def liveFirstSurfaceMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for first compiler surface
  (SKELETON). Root for lake exe slake-first-surface. Body lives in
  SystemsLean.FirstSurface (firstSurfaceReady / Mult unit path).
  Greppable: SystemsLean.FirstSurfaceMain, slake-first-surface, FirstSurfaceMain,
  FIRST-SURFACE, SLAKE_FIRST_SURFACE, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.FirstSurfaceMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.FirstSurface

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.FirstSurface.main args
"#

end SystemsLean.HostFrontLiveFirstSurfaceMain
