/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live DualEqWriteParityMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveDualEqWriteParityMainSource. Not occupancy name 50.
  Not mill 14 remill (fourteenth-host-tool ELF already exists; inventory row 17).
  Mill stays 69 of 69. Occupancy stays 49.
  This wrap parses DualEqWriteParityMain.lean only. Do not wrap DualEqWriteParity.lean.
  Do not invent HostFrontLiveDualEqWriteParity. Do not steal DualEqWriteApi companions.
  DualEqWrite.lean does not exist and is not invented.
  Not Linear. Not IrGraph. Not ComposeSubsetEmit. Not CapableComposeMain.
  Not HostModuleCheckMain.
  Unique needles use trailing newline so HostFrontLiveDualEqWriteParityMain is not a
  prefix hit on HostFrontLiveDualEqWriteParityMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveDualEqWriteParityMain is not a prefix):
  HostFrontLiveDualEqWriteParityMainSource
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-MAIN
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-MAIN
  DUAL-EQ-WRITE-PARITY-MAIN
  HOST-DUAL-EQ-WRITE-PARITY-MAIN
  Live product needles:
  DualEqWriteParityMain
  slake-freestanding-perform-dual-equality-write-parity
  import SystemsLean.DualEqWriteParity
  DualEqWriteParity
  productPathFreestandingPerformDualEqualityWriteParity
  Greppable: SYSTEMS_LEAN_HOST, liveDualEqWriteParityMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveDualEqWriteParityMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveDualEqWriteParityMain

/-- Dual-pinned live DualEqWriteParityMain.lean bytes (must match on-disk file).
    Greppable: liveDualEqWriteParityMainSource, PARSE-LIVE-DUAL-EQ-WRITE-PARITY-MAIN. -/
def liveDualEqWriteParityMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for dual-equality WRITE
  parity (SKELETON). Root for lake exe
  slake-freestanding-perform-dual-equality-write-parity. Body lives in
  SystemsLean.DualEqWriteParity
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the dual-equality
  WRITE parity without top-level main clash (batch-9 SelfApplyFs split; same
  pattern as DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-dual-equality-write-parity,
  DualEqWriteParityMain,
  productPathFreestandingPerformDualEqualityWriteParity,
  DualEqWriteParity,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.DualEqWriteParity

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.DualEqWriteParity.main args
"#

end SystemsLean.HostFrontLiveDualEqWriteParityMain
