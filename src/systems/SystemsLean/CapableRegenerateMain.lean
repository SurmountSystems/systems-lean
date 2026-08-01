/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable ordered
  regenerate pipeline (SKELETON). Root for lake exe
  slake-freestanding-capable-regenerate. Body lives in
  SystemsLean.CapableRegenerate
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the regenerate
  bulk without top-level main clash (batch-16 SelfApplyFs split; same
  pattern as CapableFullBarMain /
  InstallOutMain /
  ProductPathOwnershipRegenerateMain /
  PerformEvidenceMain /
  OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-capable-regenerate,
  CapableRegenerateMain,
  productPathFreestandingCapableRegenerate,
  CapableRegenerate,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableRegenerate

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableRegenerate.main args
