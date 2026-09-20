/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding product
  self-host complete (claim B). Root for lake exe
  slake-freestanding-self-host-complete (bootstrap / mill 69 helper). Body
  lives in SystemsLean.SelfHostComplete (CLI printSelfHostCompleteMeasure;
  fail-closed if Ok false). Not a second product CLI. Not an empty stub.
  Greppable: SystemsLean.SelfHostCompleteMain,
  slake-freestanding-self-host-complete, SelfHostCompleteMain,
  SELF-HOST-FREESTANDING-PRODUCT-COMPLETE, SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.SelfHostCompleteMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.SelfHostComplete

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.SelfHostComplete.main args
