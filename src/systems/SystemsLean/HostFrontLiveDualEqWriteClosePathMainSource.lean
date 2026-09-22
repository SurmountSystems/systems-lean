/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live DualEqWriteClosePathMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualEqWriteClosePathMainSource. Not occupancy name 50.
  Not mill 15 remill (just fifteenth-host-tool). Mill stays 69 of 69.
  This wrap parses DualEqWriteClosePathMain.lean only. Do not wrap DualEqWriteClosePath.lean.
  Do not invent HostFrontLiveDualEqWriteClosePath.lean as a library wrap.
  DualEqWrite.lean does not exist and is not invented.
  Do not wrap DualEqWriteApiMain. Do not wrap DualEqWriteParityMain.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveDualEqWriteClosePathMain is not a
  prefix hit on HostFrontLiveDualEqWriteClosePathMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteClosePathMain is not a prefix):
  HostFrontLiveDualEqWriteClosePathMainSource
  PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  HOST-DUAL-EQ-WRITE-CLOSE-PATH-MAIN
  Live product needles:
  DualEqWriteClosePathMain
  slake-freestanding-perform-dual-equality-write-close-path
  DualEqWriteClosePath
  productPathFreestandingPerformDualEqualityWriteClosePath
  SKELETON
  SYSTEMS_LEAN_HOST
  Greppable: SYSTEMS_LEAN_HOST, liveDualEqWriteClosePathMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveDualEqWriteClosePathMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveDualEqWriteClosePathMain

/-- Dual-pinned live DualEqWriteClosePathMain.lean bytes (must match on-disk file).
    Greppable: liveDualEqWriteClosePathMainSource, PARSE-LIVE-DUAL-EQ-WRITE-CLOSE-PATH-MAIN. -/
def liveDualEqWriteClosePathMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE
  close path (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-close-path. Body lives in
  SystemsLean.DualEqWriteClosePath
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the dual-equality
  WRITE close path without top-level main clash (batch-8 SelfApplyFs split; same
  pattern as DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-close-path,
  DualEqWriteClosePathMain,
  productPathFreestandingPerformDualEqualityWriteClosePath,
  DualEqWriteClosePath,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteClosePath

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteClosePath.main args
"#

end SystemsLean.HostFrontLiveDualEqWriteClosePathMain
