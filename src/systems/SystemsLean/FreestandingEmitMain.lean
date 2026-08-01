/-
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
