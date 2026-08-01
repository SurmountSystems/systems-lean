/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE
  close path (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-close-path. Body lives in
  SystemsLean.DualEqWriteClosePath
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the dual-equality
  WRITE close path without top-level main clash (batch-8 SelfApplyFs split; same
  pattern as DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-close-path,
  DualEqWriteClosePathMain,
  productPathFreestandingPerformDualEqualityWriteClosePath,
  DualEqWriteClosePath,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteClosePath

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteClosePath.main args
