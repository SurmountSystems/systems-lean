/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live DualEqWriteApiMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualEqWriteApiMainSource. Not occupancy name 50.
  Not mill 65 remill. Mill stays 69 of 69.
  This wrap parses DualEqWriteApiMain.lean only. Do not wrap DualEqWriteApi.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveDualEqWriteApiMain is not a
  prefix hit on HostFrontLiveDualEqWriteApiMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteApiMain is not a prefix):
  HostFrontLiveDualEqWriteApiMainSource
  PARSE-LIVE-DUAL-EQ-WRITE-API-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-API-MAIN
  DUAL-EQ-WRITE-API-MAIN
  Live product needles:
  DualEqWriteApiMain
  slake-freestanding-perform-dual-equality-write-api
  import SystemsLean.DualEqWriteApi
  DualEqWriteCapableGapMain
  productPathFreestandingPerformDualEqualityWriteApi
  Greppable: SYSTEMS_LEAN_HOST, liveDualEqWriteApiMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveDualEqWriteApiMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveDualEqWriteApiMain

/-- Dual-pinned live DualEqWriteApiMain.lean bytes (must match on-disk file).
    Greppable: liveDualEqWriteApiMainSource, PARSE-LIVE-DUAL-EQ-WRITE-API-MAIN. -/
def liveDualEqWriteApiMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE API
  (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-api. Body lives in
  SystemsLean.DualEqWriteApi
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the dual-equality
  WRITE API without top-level main clash (batch-7 SelfApplyFs split; same pattern
  as DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-api,
  DualEqWriteApiMain,
  productPathFreestandingPerformDualEqualityWriteApi,
  DualEqWriteApi,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteApi

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteApi.main args
"#

end SystemsLean.HostFrontLiveDualEqWriteApiMain
