/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmProgramTextMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmProgramTextMainSource. Not occupancy name 50.
  Not a remill. Mill stays 69 of 69.
  This wrap parses LlvmProgramTextMain.lean only. Do not wrap LlvmProgramText.lean.
  Do not retarget HostFrontLiveLlvmHold.lean.
  liveRel is the bare name LlvmProgramTextMain.lean. Do not redefine it
  in the parser.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmProgramTextMainSource, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmProgramTextMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmProgramTextMain

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "LlvmProgramTextMain.lean"

/-- Dual-pinned live LlvmProgramTextMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmProgramTextMainSource, PARSE-LIVE-LLVM-PROGRAM-TEXT-MAIN. -/
def liveLlvmProgramTextMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Program text
  (SKELETON). Root for lake exe slake-llvm-program-text. Body lives in
  SystemsLean.LlvmProgramText (llvmProgramTextReady / Program IR write under
  out/llvm-ir).
  Greppable: SystemsLean.LlvmProgramTextMain, slake-llvm-program-text,
  LlvmProgramTextMain, HOST-LLVM-PROGRAM-TEXT, SLAKE_LLVM_PROGRAM_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmProgramTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmProgramText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmProgramText.main args
"#

end SystemsLean.HostFrontLiveLlvmProgramTextMain
