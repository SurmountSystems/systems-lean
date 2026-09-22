/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live CapableStepContractMain.lean bytes.
  Side: classic Lean elaborator under src/systems (not freestanding C).
  Short role: HostFrontLiveCapableStepContractMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses CapableStepContractMain.lean only. Do not wrap CapableStepContract.lean.
  Do not wrap CapableStepContractTheorems.lean. Do not wrap Capable.lean.
  Do not wrap CapableMain.lean. CapableWrite.lean does not exist and is
  not invented.
  Unique needles use trailing newline so HostFrontLiveCapableStepContractMain is not a
  prefix hit on HostFrontLiveCapableStepContractMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveCapableStepContractMain is not a prefix):
  HostFrontLiveCapableStepContractMainSource
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-MAIN
  HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-MAIN
  CAPABLE-STEP-CONTRACT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, liveCapableStepContractMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveCapableStepContractMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveCapableStepContractMain

/-- Dual-pinned live CapableStepContractMain.lean bytes (must match on-disk file).
    Greppable: liveCapableStepContractMainSource, PARSE-LIVE-CAPABLE-STEP-CONTRACT-MAIN. -/
def liveCapableStepContractMainSource : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveCapableStepContractMain
