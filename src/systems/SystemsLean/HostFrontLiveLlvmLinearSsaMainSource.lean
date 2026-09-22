/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmLinearSsaMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmLinearSsaMainSource. Not occupancy name 50.
  Not mill 62 remill. Mill stays 69 of 69.
  This wrap parses LlvmLinearSsaMain.lean only. Do not wrap LlvmLinearSsa.lean.
  Do not wrap Linear.lean (QTT Linear module).
  Do not invent HostFrontLiveLlvmLinearSsa (library wrap). Do not wrap IrGraph.lean.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not steal HostFrontLiveLlvmTypesSsaMain (sibling TYPES mill wrap).
  Do not steal HostFrontLiveLlvmProgramSsaMain (sibling PROGRAM mill wrap).
  Do not steal HostFrontLiveLlvmGraphSsaMain (sibling GRAPH mill wrap).
  Do not steal HostFrontLiveLlvmMultSsaMain (sibling MULT mill wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmLinearSsaMain is not a
  prefix hit on HostFrontLiveLlvmLinearSsaMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmLinearSsaMain is not a prefix):
  HostFrontLiveLlvmLinearSsaMainSource
  PARSE-LIVE-LLVM-LINEAR-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-LINEAR-SSA-MAIN
  LLVM-LINEAR-SSA-MAIN
  HOST-LLVM-LINEAR-SSA-MAIN
  Live product needles:
  LlvmLinearSsaMain
  slake-llvm-linear-ssa
  import SystemsLean.LlvmLinearSsa
  HOST-LLVM-LINEAR-SSA
  SLAKE_LLVM_LINEAR_SSA
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmLinearSsaMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmLinearSsaMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmLinearSsaMain

/-- Dual-pinned live LlvmLinearSsaMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmLinearSsaMainSource, PARSE-LIVE-LLVM-LINEAR-SSA-MAIN. -/
def liveLlvmLinearSsaMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Linear SSA lower
  (SKELETON). Root for lake exe slake-llvm-linear-ssa. Body lives in
  SystemsLean.LlvmLinearSsa (llvmLinearSsaReady / Linear SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmLinearSsaMain, slake-llvm-linear-ssa,
  LlvmLinearSsaMain, HOST-LLVM-LINEAR-SSA, SLAKE_LLVM_LINEAR_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmLinearSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmLinearSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmLinearSsa.main args
"#

end SystemsLean.HostFrontLiveLlvmLinearSsaMain
