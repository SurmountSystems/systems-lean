/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for official-path gap
  (SKELETON). Root for lake exe
  slake-freestanding-perform-official-path. Body lives in
  SystemsLean.OfficialPath
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the official-path
  gap without top-level main clash (batch-11 SelfApplyFs split; same
  pattern as OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-official-path,
  OfficialPathMain,
  productPathFreestandingPerformOfficialPath,
  OfficialPath,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OfficialPath

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OfficialPath.main args
