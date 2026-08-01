/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE
  CAPABLE-GAP (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-capable-gap. Body lives in
  SystemsLean.DualEqWriteCapableGap
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the CAPABLE-GAP
  API without top-level main clash (batch-6 SelfApplyFs split; same pattern as
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-capable-gap,
  DualEqWriteCapableGapMain,
  productPathFreestandingPerformDualEqualityWriteCapableGap,
  DualEqWriteCapableGap,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteCapableGap

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteCapableGap.main args
