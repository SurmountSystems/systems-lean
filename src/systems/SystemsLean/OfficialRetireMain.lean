/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for RETIRE-OFFICIAL
  (SKELETON). Root for lake exe slake-freestanding-retire-official. Body lives in
  SystemsLean.OfficialRetire (Ok / PartialReady bulk). Thin main so
  SelfApplyFs may import the RETIRE-OFFICIAL API without top-level main clash
  (batch-5 SelfApplyFs split; same pattern as PerformClaimedMain /
  OwnershipClaimedMain / StepContractFullMain).
  Greppable: slake-freestanding-retire-official,
  OfficialRetireMain, productPathOfficialPathRetireOfficial, OfficialRetire,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OfficialRetire

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OfficialRetire.main args
