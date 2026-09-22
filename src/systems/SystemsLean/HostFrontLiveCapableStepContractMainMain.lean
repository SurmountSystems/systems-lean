/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-CAPABLE-STEP-CONTRACT-MAIN.
  Root for optional lean --run of live CapableStepContractMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveCapableStepContractMain.
  Unique needles (trailing newline so HostFrontLiveCapableStepContractMain is not a prefix):
  HostFrontLiveCapableStepContractMainMain
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-MAIN
  HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-MAIN
  SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_MAIN_V0
  CAPABLE-STEP-CONTRACT-MAIN
  Greppable: SystemsLean.HostFrontLiveCapableStepContractMainMain,
  parseLiveCapableStepContractMainSource,
  kernelCheckLiveCapableStepContractMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveCapableStepContractMainMain
  Not mill remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveCapableStepContractMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveCapableStepContractMain.main args
