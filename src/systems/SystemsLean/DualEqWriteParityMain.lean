/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE
  parity (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-parity. Body lives in
  SystemsLean.DualEqWriteParity
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the dual-equality
  WRITE parity without top-level main clash (batch-9 SelfApplyFs split; same
  pattern as DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-parity,
  DualEqWriteParityMain,
  productPathFreestandingPerformDualEqualityWriteParity,
  DualEqWriteParity,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteParity

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteParity.main args
