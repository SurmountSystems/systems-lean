/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live StepContractFullMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveStepContractFullMainSource. Not occupancy name 50.
  Not mill 20 remill (just twentieth-host-tool / inventory row 24). Mill stays 69 of 69.
  This wrap parses StepContractFullMain.lean only. Do not wrap StepContractFull.lean.
  Short name is free because HostFrontLiveStepContractFull (library wrap) does not exist.
  Do not mint HostFrontLiveHostStepContractFullMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveStepContractFullMain is not a
  prefix hit on HostFrontLiveStepContractFullMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveStepContractFullMain is not a prefix):
  HostFrontLiveStepContractFullMainSource
  PARSE-LIVE-STEP-CONTRACT-FULL-MAIN
  HOST-FRONT-LIVE-STEP-CONTRACT-FULL-MAIN
  STEP-CONTRACT-FULL-MAIN
  HOST-STEP-CONTRACT-FULL-MAIN
  Live product needles:
  StepContractFullMain
  slake-freestanding-step-contract-full
  import SystemsLean.StepContractFull
  stepContractFull
  StepContractFull
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveStepContractFullMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveStepContractFullMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveStepContractFullMain

/-- Dual-pinned live StepContractFullMain.lean bytes (must match on-disk file).
    Greppable: liveStepContractFullMainSource, PARSE-LIVE-STEP-CONTRACT-FULL-MAIN. -/
def liveStepContractFullMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveStepContractFullMain
