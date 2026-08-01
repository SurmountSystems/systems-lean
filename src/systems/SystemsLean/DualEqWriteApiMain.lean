/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE API
  (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-api. Body lives in
  SystemsLean.DualEqWriteApi
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the dual-equality
  WRITE API without top-level main clash (batch-7 SelfApplyFs split; same pattern
  as DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-api,
  DualEqWriteApiMain,
  productPathFreestandingPerformDualEqualityWriteApi,
  DualEqWriteApi,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteApi

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteApi.main args
