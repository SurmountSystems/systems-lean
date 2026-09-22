/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmComposeTextMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmComposeTextMainSource. Not occupancy name 50.
  Not mill 60 remill. Mill stays 69 of 69.
  This wrap parses LlvmComposeTextMain.lean only. Do not wrap LlvmComposeText.lean.
  Do not invent HostFrontLiveLlvmComposeText (library wrap).
  This wrap is not an LLVM backend claim. FullBackend stays false.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmComposeTextMain is not a
  prefix hit on HostFrontLiveLlvmComposeTextMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmComposeTextMain is not a prefix):
  HostFrontLiveLlvmComposeTextMainSource
  PARSE-LIVE-LLVM-COMPOSE-TEXT-MAIN
  HOST-FRONT-LIVE-LLVM-COMPOSE-TEXT-MAIN
  LLVM-COMPOSE-TEXT-MAIN
  HOST-LLVM-COMPOSE-TEXT-MAIN
  Live product needles:
  LlvmComposeTextMain
  slake-llvm-compose-text
  import SystemsLean.LlvmComposeText
  HOST-LLVM-COMPOSE-TEXT
  SLAKE_LLVM_COMPOSE_TEXT
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmComposeTextMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmComposeTextMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Dual-pinned live LlvmComposeTextMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmComposeTextMainSource, PARSE-LIVE-LLVM-COMPOSE-TEXT-MAIN. -/
def liveLlvmComposeTextMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM IR compose text
  (SKELETON). Root for lake exe slake-llvm-compose-text. Body lives in
  SystemsLean.LlvmComposeText (llvmComposeTextReady / compose IR write under
  out/llvm-ir).
  Greppable: SystemsLean.LlvmComposeTextMain, slake-llvm-compose-text,
  LlvmComposeTextMain, HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmComposeTextMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmComposeText

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmComposeText.main args
"#

end SystemsLean.HostFrontLiveLlvmComposeTextMain
