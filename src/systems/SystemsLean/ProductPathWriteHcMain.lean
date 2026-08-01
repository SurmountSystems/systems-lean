/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for B13 WRITE-HC perform
  substrate (SKELETON). Root for lake exe slake-write-freestanding-hc.
  Body lives in SystemsLean.ProductPathWriteHc
  (writeFreestandingHcAtRoot / Ok / PartialReady bulk). Thin main so SelfApplyFs
  may import the WRITE-HC API without top-level main clash.
  Greppable: slake-write-freestanding-hc,
  ProductPathWriteHcMain, writeFreestandingHcAtRoot,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathWriteHc

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathWriteHc.main args
