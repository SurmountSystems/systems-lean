/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for B11 READ-SSOT perform
  substrate (SKELETON). Root for lake exe slake-read-product-ssot.
  Body lives in SystemsLean.ProductPathReadSsot
  (readDualSsotAtRoot / Ok / PartialReady bulk). Thin main so SelfApplyFs
  may import the READ API without top-level main clash.
  Greppable: slake-read-product-ssot,
  ProductPathReadSsotMain, readDualSsotAtRoot,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathReadSsot

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathReadSsot.main args
