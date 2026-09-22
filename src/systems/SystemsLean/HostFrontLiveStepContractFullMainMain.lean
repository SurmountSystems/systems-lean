/-
  SYSTEMS_LEAN_HOST partial -- thin driver for PARSE-LIVE-STEP-CONTRACT-FULL-MAIN.
  Root for optional lean --run of live StepContractFullMain.lean parse +
  kernelCheck.
  Body lives in SystemsLean.HostFrontLiveStepContractFullMain.
  Unique needles (trailing newline so HostFrontLiveStepContractFullMain is not a prefix):
  HostFrontLiveStepContractFullMainMain
  PARSE-LIVE-STEP-CONTRACT-FULL-MAIN
  HOST-FRONT-LIVE-STEP-CONTRACT-FULL-MAIN
  SLAKE_HOST_FRONT_LIVE_STEP_CONTRACT_FULL_MAIN_V0
  STEP-CONTRACT-FULL-MAIN
  HOST-STEP-CONTRACT-FULL-MAIN
  Greppable: SystemsLean.HostFrontLiveStepContractFullMainMain,
  parseLiveStepContractFullMainSource,
  kernelCheckLiveStepContractFullMainSource,
  SYSTEMS_LEAN_HOST.
  Module: SystemsLean.HostFrontLiveStepContractFullMainMain
  Not mill 20 remill. Mill stays 69 of 69. Not occupancy name 50. Not FullHost.
  Short name is free because HostFrontLiveStepContractFull (library wrap) does not exist.
  Do not mint HostFrontLiveHostStepContractFullMain. Do not wrap StepContractFull.lean.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY. SKELETON.
-/

import SystemsLean.HostFrontLiveStepContractFullMain

/-- lean --run entry: forward argv (repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.HostFrontLiveStepContractFullMain.main args
