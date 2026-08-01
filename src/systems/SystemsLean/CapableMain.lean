/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable gap
  measure (SKELETON). Root for lake exe slake-freestanding-capable-gap.
  Body lives in SystemsLean.Capable
  (printGapMeasure / Ok / PartialReady bulk). Thin main so SelfApplyFs may
  import the capable-gap API without top-level main clash.
  Greppable: slake-freestanding-capable-gap,
  CapableMain, printGapMeasure,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.Capable

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.Capable.main args
