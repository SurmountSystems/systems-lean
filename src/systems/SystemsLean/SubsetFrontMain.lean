/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Mult subset language
  front-end (SKELETON). Root for lake exe slake-subset-front. Body lives in
  SystemsLean.SubsetFront (subsetFrontReady / golden parse+check).
  Greppable: SystemsLean.SubsetFrontMain, slake-subset-front, SubsetFrontMain,
  SUBSET-FRONT, SLAKE_SUBSET_FRONT, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.SubsetFrontMain
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.SubsetFront

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.SubsetFront.main args
