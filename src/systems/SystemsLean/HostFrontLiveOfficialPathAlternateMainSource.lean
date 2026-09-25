/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live OfficialPathAlternateMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveOfficialPathAlternateMainSource.
  Not occupancy name 50. Not mill 70.
  This wrap is OfficialPathAlternateMain.lean. It is not OfficialPathAlternate.lean.
  Not a speed claim.
  No new C.
  Not a package typecheck.
  liveRel is the bare basename OfficialPathAlternateMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveOfficialPathAlternateMainSource,
  HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternateMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveOfficialPathAlternateMainParse

/-- Dual-pinned live OfficialPathAlternateMain.lean bytes (must match on-disk file).
    Greppable: liveOfficialPathAlternateMainSource,
    HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-MAIN. -/
def liveOfficialPathAlternateMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for official-path alternate
  (SKELETON). Root for lake exe
  slake-freestanding-perform-official-path-alternate. Body lives in
  SystemsLean.OfficialPathAlternate
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the official-path
  alternate without top-level main clash (batch-10 SelfApplyFs split; same
  pattern as DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-freestanding-perform-official-path-alternate,
  OfficialPathAlternateMain,
  productPathFreestandingPerformOfficialPathAlternate,
  OfficialPathAlternate,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.OfficialPathAlternate

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.OfficialPathAlternate.main args
"#

end SystemsLean.HostFrontLiveOfficialPathAlternateMainParse
