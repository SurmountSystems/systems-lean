/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable COMPOSE (SKELETON).
  Root for lake exe slake-freestanding-capable-compose. Body lives in
  SystemsLean.CapableCompose
  (freestandingCapableComposePlanApplyBody). Thin main so
  CapableRegenerate may import the COMPOSE API without
  top-level main clash.
  Greppable: slake-freestanding-capable-compose,
  CapableComposeMain, freestandingCapableComposePlanApplyBody,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableCompose

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableCompose.main args
