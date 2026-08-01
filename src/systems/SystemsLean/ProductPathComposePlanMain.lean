/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for B12 COMPOSE perform
  substrate (SKELETON). Root for lake exe slake-compose-product-plan.
  Body lives in SystemsLean.ProductPathComposePlan
  (composePlanApplyBodyAtRoot / Ok / PartialReady bulk). Thin main so SelfApplyFs
  may import the COMPOSE API without top-level main clash.
  Greppable: slake-compose-product-plan,
  ProductPathComposePlanMain, composePlanApplyBodyAtRoot,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathComposePlan

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathComposePlan.main args
