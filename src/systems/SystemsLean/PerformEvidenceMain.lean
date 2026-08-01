/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding perform
  evidence (SKELETON). Root for lake exe
  slake-freestanding-perform-evidence. Body lives in
  SystemsLean.PerformEvidence
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the perform
  evidence bulk without top-level main clash (batch-12 SelfApplyFs split; same
  pattern as OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-evidence,
  PerformEvidenceMain,
  productPathFreestandingPerformEvidence,
  PerformEvidence,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.PerformEvidence

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.PerformEvidence.main args
