/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for freestanding-capable step
  contract (SKELETON). Root for lake exe slake-freestanding-capable-step-contract.
  Body lives in SystemsLean.CapableStepContract
  (printStepContract / Ok / PartialReady bulk). Thin main so SelfApplyFs may
  import the step-contract API without top-level main clash.
  Greppable: slake-freestanding-capable-step-contract,
  CapableStepContractMain, printStepContract,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.CapableStepContract

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.CapableStepContract.main args
