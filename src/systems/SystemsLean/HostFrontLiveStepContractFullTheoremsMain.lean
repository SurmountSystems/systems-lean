/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS.
  Root for optional lean --run of live StepContractFullTheorems.lean parse plus
  HostKernel.kernelCheck. Not an emit driver. Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveStepContractFullTheorems.
  Greppable: SystemsLean.HostFrontLiveStepContractFullTheoremsMain,
  HostFrontLiveStepContractFullTheoremsMain,
  HOST-FRONT-LIVE-STEP-CONTRACT-FULL-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_STEP_CONTRACT_FULL_THEOREMS_V0,
  PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS, STEP-CONTRACT-FULL-THEOREM,
  parseLiveStepContractFullTheoremsSource,
  kernelCheckLiveStepContractFullTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveStepContractFullTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveStepContractFullTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveStepContractFullTheorems.main args
