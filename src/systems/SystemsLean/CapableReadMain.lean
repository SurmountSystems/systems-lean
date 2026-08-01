/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable READ (SKELETON).
  Root for lake exe slake-freestanding-capable-read. Body lives in
  SystemsLean.CapableRead (freestandingCapableReadDualSsot).
  Thin main so CapableRegenerate may import the READ API
  without top-level main clash.
  Greppable: slake-freestanding-capable-read, CapableReadMain,
  freestandingCapableReadDualSsot, SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableRead

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableRead.main args
