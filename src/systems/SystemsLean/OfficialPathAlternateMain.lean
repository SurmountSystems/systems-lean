/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for official-path alternate
  (SKELETON). Root for lake exe
  slake-freestanding-perform-official-path-alternate. Body lives in
  SystemsLean.OfficialPathAlternate
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the official-path
  alternate without top-level main clash (batch-10 SelfApplyFs split; same
  pattern as DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-official-path-alternate,
  OfficialPathAlternateMain,
  productPathFreestandingPerformOfficialPathAlternate,
  OfficialPathAlternate,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OfficialPathAlternate

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OfficialPathAlternate.main args
