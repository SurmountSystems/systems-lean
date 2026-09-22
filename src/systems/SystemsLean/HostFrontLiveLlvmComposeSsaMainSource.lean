/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmComposeSsaMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmComposeSsaMainSource. Not occupancy name 50.
  Not mill 56 remill. Mill stays 69 of 69.
  This wrap parses LlvmComposeSsaMain.lean only. Do not wrap LlvmComposeSsa.lean.
  Do not wrap Linear.lean (QTT Linear module).
  Do not wrap ComposeSubsetEmit.lean. Do not wrap ComposeSubsetEmitMain.lean.
  Do not wrap ComposeSubsetRebuildMain.lean. Do not wrap CapableComposeMain.lean.
  Do not invent HostFrontLiveLlvmComposeSsa (library wrap). Do not wrap IrGraph.lean.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not steal HostFrontLiveLlvmLinearSsaMain (sibling LINEAR mill wrap).
  Do not steal HostFrontLiveLlvmTypesSsaMain (sibling TYPES mill wrap).
  Do not steal HostFrontLiveLlvmProgramSsaMain (sibling PROGRAM mill wrap).
  Do not steal HostFrontLiveLlvmGraphSsaMain (sibling GRAPH mill wrap).
  Do not steal HostFrontLiveLlvmMultSsaMain (sibling MULT mill wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmComposeSsaMain is not a
  prefix hit on HostFrontLiveLlvmComposeSsaMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmComposeSsaMain is not a prefix):
  HostFrontLiveLlvmComposeSsaMainSource
  PARSE-LIVE-LLVM-COMPOSE-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-COMPOSE-SSA-MAIN
  LLVM-COMPOSE-SSA-MAIN
  HOST-LLVM-COMPOSE-SSA-MAIN
  Live product needles:
  LlvmComposeSsaMain
  slake-llvm-compose-ssa
  import SystemsLean.LlvmComposeSsa
  HOST-LLVM-COMPOSE-SSA
  SLAKE_LLVM_COMPOSE_SSA
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmComposeSsaMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmComposeSsaMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmComposeSsaMain

/-- Dual-pinned live LlvmComposeSsaMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmComposeSsaMainSource, PARSE-LIVE-LLVM-COMPOSE-SSA-MAIN. -/
def liveLlvmComposeSsaMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Compose SSA lower
  (SKELETON). Root for lake exe slake-llvm-compose-ssa. Body lives in
  SystemsLean.LlvmComposeSsa (llvmComposeSsaReady / Compose SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmComposeSsaMain, slake-llvm-compose-ssa,
  LlvmComposeSsaMain, HOST-LLVM-COMPOSE-SSA, SLAKE_LLVM_COMPOSE_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmComposeSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmComposeSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmComposeSsa.main args
"#

end SystemsLean.HostFrontLiveLlvmComposeSsaMain
