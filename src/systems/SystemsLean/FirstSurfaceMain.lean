/-
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
