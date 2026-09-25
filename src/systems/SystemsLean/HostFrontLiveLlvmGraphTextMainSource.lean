/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmGraphTextMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmGraphTextMainSource. Not occupancy name 50.
  Not a remill. Mill stays 69 of 69.
  This wrap parses LlvmGraphTextMain.lean only. Do not wrap LlvmGraphText.lean.
  Do not retarget HostFrontLiveLlvmHold.lean.
  liveRel is the bare name LlvmGraphTextMain.lean. Do not redefine it
  in the parser.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmGraphTextMainSource, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmGraphTextMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmGraphTextMain

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "LlvmGraphTextMain.lean"

/-- Dual-pinned live LlvmGraphTextMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmGraphTextMainSource, PARSE-LIVE-LLVM-GRAPH-TEXT-MAIN. -/
def liveLlvmGraphTextMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR Graph text
  (SKELETON). Root for lake exe slake-llvm-graph-text. Body lives in
  SystemsLean.LlvmGraphText (llvmGraphTextReady / Graph IR write under
  out/llvm-ir).
  Greppable: SystemsLean.LlvmGraphTextMain, slake-llvm-graph-text,
  LlvmGraphTextMain, HOST-LLVM-GRAPH-TEXT, SLAKE_LLVM_GRAPH_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmGraphTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmGraphText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmGraphText.main args
"#

end SystemsLean.HostFrontLiveLlvmGraphTextMain
