/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live MultFsWriteMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultFsWriteMainSource. Not occupancy name 50.
  Not mill 68 remill. Mill stays 69 of 69.
  This wrap parses MultFsWriteMain.lean only. Do not wrap MultFsWrite.lean.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveMultFsWriteMain is not a
  prefix hit on HostFrontLiveMultFsWriteMainSource.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveMultFsWriteMain is not a prefix):
  HostFrontLiveMultFsWriteMainSource
  PARSE-LIVE-MULT-FS-WRITE-MAIN
  HOST-FRONT-LIVE-MULT-FS-WRITE-MAIN
  MULT-FS-WRITE-MAIN
  Live product needles:
  MultFsWriteMain
  SLAKE_MULT_FS_DEEPEN
  import SystemsLean.MultFsWrite
  P1 Path A host-cc C print retired
  MultFsDeepen multFsWrite
  Greppable: SYSTEMS_LEAN_HOST, liveMultFsWriteMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveMultFsWriteMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveMultFsWriteMain

/-- Dual-pinned live MultFsWriteMain.lean bytes (must match on-disk file).
    Greppable: liveMultFsWriteMainSource, PARSE-LIVE-MULT-FS-WRITE-MAIN. -/
def liveMultFsWriteMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for host MultSubsetEmit
  freestanding Mult SSOT package write. Root for lake exe slake-mult-fs-write
  (bootstrap / measured Mult package write helper). Body lives in
  SystemsLean.MultFsWrite (forwards MultFsDeepen multFsWrite /
  multFsWritePathReady; freestandingDriverComplete true with Lean-native
  MultSubsetEmit dual evidence; P1 Path A host-cc C print retired).
  Not freestanding Mult compiler.
  Greppable: SystemsLean.MultFsWriteMain, slake-mult-fs-write,
  MultFsWriteMain, MULT-FS-WRITE, MULT-FS-DEEPEN, SLAKE_MULT_FS_DEEPEN,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.MultFsWriteMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.MultFsWrite

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultFsWrite.main args
"#

end SystemsLean.HostFrontLiveMultFsWriteMain
