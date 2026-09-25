/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmTypesTextMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmTypesTextMainSource. Not occupancy name 50.
  Not a remill. Mill stays 69 of 69.
  This wrap parses LlvmTypesTextMain.lean only. Do not wrap LlvmTypesText.lean.
  Do not retarget HostFrontLiveLlvmHold.lean.
  liveRel is the bare name LlvmTypesTextMain.lean. Do not redefine it
  in the parser.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmTypesTextMainSource, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmTypesTextMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmTypesTextMain

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "LlvmTypesTextMain.lean"

/-- Dual-pinned live LlvmTypesTextMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmTypesTextMainSource, PARSE-LIVE-LLVM-TYPES-TEXT-MAIN. -/
def liveLlvmTypesTextMainSource : String := r#"
/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Types text
  (SKELETON). Root for lake exe slake-llvm-types-text. Body lives in
  SystemsLean.LlvmTypesText (llvmTypesTextReady / Types IR write under out/llvm-ir).
  Greppable: SystemsLean.LlvmTypesTextMain, slake-llvm-types-text,
  LlvmTypesTextMain, HOST-LLVM-TYPES-TEXT, SLAKE_LLVM_TYPES_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmTypesTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmTypesText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmTypesText.main args
"#

end SystemsLean.HostFrontLiveLlvmTypesTextMain
