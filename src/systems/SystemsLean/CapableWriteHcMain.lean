/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable WRITE-HC (SKELETON).
  Root for lake exe slake-freestanding-capable-write-hc. Body lives in
  SystemsLean.CapableWriteHc
  (freestandingCapableWriteFreestandingHc). Thin main so
  CapableRegenerate may import the WRITE-HC API without
  top-level main clash.
  Greppable: slake-freestanding-capable-write-hc,
  CapableWriteHcMain, freestandingCapableWriteFreestandingHc,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableWriteHc

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableWriteHc.main args
