/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for OWNERSHIP-CLAIMED
  (SKELETON). Root for lake exe slake-freestanding-ownership-claimed. Body lives in
  SystemsLean.OwnershipClaimed (Ok / PartialReady bulk). Thin main so
  SelfApplyFs may import the OWNERSHIP-CLAIMED API without top-level main clash
  (batch-3 SelfApplyFs split; same pattern as StepContractFullMain / InstallOutMain).
  Greppable: slake-freestanding-ownership-claimed,
  OwnershipClaimedMain, productPathFreestandingOwnershipClaimed, OwnershipClaimed,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OwnershipClaimed

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OwnershipClaimed.main args
