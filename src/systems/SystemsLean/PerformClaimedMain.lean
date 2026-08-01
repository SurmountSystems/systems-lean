/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for PERFORM-CLAIMED
  (SKELETON). Root for lake exe slake-freestanding-perform-claimed. Body lives in
  SystemsLean.PerformClaimed (Ok / PartialReady bulk). Thin main so
  SelfApplyFs may import the PERFORM-CLAIMED API without top-level main clash
  (batch-4 SelfApplyFs split; same pattern as OwnershipClaimedMain /
  StepContractFullMain / InstallOutMain).
  Greppable: slake-freestanding-perform-claimed,
  PerformClaimedMain, productPathFreestandingPerformClaimed, PerformClaimed,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.PerformClaimed

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.PerformClaimed.main args
