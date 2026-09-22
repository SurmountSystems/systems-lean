/-
  SYSTEMS_LEAN_HOST partial -- thin driver for
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS.
  Root for optional lean --run of live CapableStepContractTheorems.lean
  parse plus HostKernel.kernelCheck. Not an emit driver.
  Not an LLVM backend.
  Body lives in SystemsLean.HostFrontLiveCapableStepContractTheorems.
  Greppable: SystemsLean.HostFrontLiveCapableStepContractTheoremsMain,
  HostFrontLiveCapableStepContractTheoremsMain,
  HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS, STEP-CONTRACT-THEOREM,
  parseLiveCapableStepContractTheoremsSource,
  kernelCheckLiveCapableStepContractTheoremsSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableStepContractTheoremsMain
  Not FullHost. FullBackend stays false. Not an LLVM backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveCapableStepContractTheorems

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableStepContractTheorems.main args
