/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable Full
  bar / ownership-gap measure (SKELETON). Root for lake exe
  slake-freestanding-capable-full-bar. Body lives in
  SystemsLean.CapableFullBar
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the Full-bar
  bulk without top-level main clash (batch-14 SelfApplyFs split; same
  pattern as ProductPathOwnershipRegenerateMain /
  PerformEvidenceMain /
  OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-capable-full-bar,
  CapableFullBarMain,
  productPathFreestandingCapableFullBar,
  CapableFullBar,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableFullBar

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableFullBar.main args
