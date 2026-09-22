/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live DualEqWriteCapableGapMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualEqWriteCapableGapMainSource. Not occupancy name 50.
  Not mill 16 remill (just sixteenth-host-tool / inventory row 20). Mill stays 69 of 69.
  This wrap parses DualEqWriteCapableGapMain.lean only. Do not wrap DualEqWriteCapableGap.lean.
  Do not invent HostFrontLiveDualEqWriteCapableGap (library wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveDualEqWriteCapableGapMain is not a
  prefix hit on HostFrontLiveDualEqWriteCapableGapMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteCapableGapMain is not a prefix):
  HostFrontLiveDualEqWriteCapableGapMainSource
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  HOST-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN
  Live product needles:
  DualEqWriteCapableGapMain
  slake-freestanding-perform-dual-equality-write-capable-gap
  import SystemsLean.DualEqWriteCapableGap
  productPathFreestandingPerformDualEqualityWriteCapableGap
  DualEqWriteCapableGap
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveDualEqWriteCapableGapMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveDualEqWriteCapableGapMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveDualEqWriteCapableGapMain

/-- Dual-pinned live DualEqWriteCapableGapMain.lean bytes (must match on-disk file).
    Greppable: liveDualEqWriteCapableGapMainSource, PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-MAIN. -/
def liveDualEqWriteCapableGapMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE
  CAPABLE-GAP (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-capable-gap. Body lives in
  SystemsLean.DualEqWriteCapableGap
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the CAPABLE-GAP
  API without top-level main clash (batch-6 SelfApplyFs split; same pattern as
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-capable-gap,
  DualEqWriteCapableGapMain,
  productPathFreestandingPerformDualEqualityWriteCapableGap,
  DualEqWriteCapableGap,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteCapableGap

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteCapableGap.main args
"#

end SystemsLean.HostFrontLiveDualEqWriteCapableGapMain
