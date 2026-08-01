/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for ownership regenerate
  substrate (SKELETON). Root for lake exe
  slake-ownership-regenerate. Body lives in
  SystemsLean.ProductPathOwnershipRegenerate
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the ownership
  regenerate bulk without top-level main clash (batch-13 SelfApplyFs split; same
  pattern as PerformEvidenceMain /
  OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-ownership-regenerate,
  ProductPathOwnershipRegenerateMain,
  productPathOwnershipRegenerate,
  ProductPathOwnershipRegenerate,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathOwnershipRegenerate

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathOwnershipRegenerate.main args
