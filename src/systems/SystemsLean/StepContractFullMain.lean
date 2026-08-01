/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Full step-contract
  (SKELETON). Root for lake exe slake-freestanding-step-contract-full. Body lives in
  SystemsLean.StepContractFull (stepContractFullOk / PartialReady bulk). Thin main so
  SelfApplyFs may import the Full API without top-level main clash
  (batch-2 SelfApplyFs split; same pattern as InstallOutMain).
  Greppable: slake-freestanding-step-contract-full,
  StepContractFullMain, stepContractFull, StepContractFull,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.StepContractFull

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.StepContractFull.main args
