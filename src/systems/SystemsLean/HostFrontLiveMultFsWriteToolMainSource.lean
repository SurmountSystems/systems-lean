/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live MultFsWriteToolMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultFsWriteToolMainSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses MultFsWriteToolMain.lean only. Do not edit MultFsWriteTool.lean.
  Unique needles use trailing newline so HostFrontLiveMultFsWriteToolMain is not a
  prefix hit on HostFrontLiveMultFsWriteToolMainSource or on
  HostFrontLiveMultFsWriteTool.
  Occupancy leftover is not this wrap.
  Unique needles (trailing newline so HostFrontLiveMultFsWriteToolMain is not a prefix):
  HostFrontLiveMultFsWriteToolMainSource
  PARSE-LIVE-MULT-FS-WRITE-TOOL-MAIN
  HOST-FRONT-LIVE-MULT-FS-WRITE-TOOL-MAIN
  MULT-FS-WRITE-TOOL-MAIN
  Live product needles (trailing newline):
  import SystemsLean.MultFsWriteTool
  SystemsLean.MultFsWriteTool.main args
  slake-mult-fs-write-tool
  MULT-FS-WRITE-TOOL
  Module: SystemsLean.MultFsWriteToolMain
  Greppable: SYSTEMS_LEAN_HOST, liveMultFsWriteToolMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveMultFsWriteToolMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveMultFsWriteToolMain

/-- Dual-pinned live MultFsWriteToolMain.lean bytes (must match on-disk file).
    Greppable: liveMultFsWriteToolMainSource, PARSE-LIVE-MULT-FS-WRITE-TOOL-MAIN. -/
def liveMultFsWriteToolMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Lean-native Mult package
  write (P1). Root for lake exe slake-mult-fs-write-tool. Body lives in
  SystemsLean.MultFsWriteTool (multFsWriteToolEmit / MultSubsetEmit
  IO.FS.writeFile). Does not print full host-cc C tool bodies. Measured Mult
  package write: just mult-subset-freestanding-write.
  Greppable: SystemsLean.MultFsWriteToolMain, slake-mult-fs-write-tool,
  MultFsWriteToolMain, MULT-FS-WRITE-TOOL, MULT-FS-WRITE, SYSTEMS_LEAN_HOST,
  SKELETON.
  Module: SystemsLean.MultFsWriteToolMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not S4.
-/

import SystemsLean.MultFsWriteTool

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.MultFsWriteTool.main args
"#

end SystemsLean.HostFrontLiveMultFsWriteToolMain
