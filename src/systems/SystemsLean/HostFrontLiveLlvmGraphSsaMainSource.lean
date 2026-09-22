/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmGraphSsaMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmGraphSsaMainSource. Not occupancy name 50.
  Not mill 65 remill. Mill stays 69 of 69.
  This wrap parses LlvmGraphSsaMain.lean only. Do not wrap LlvmGraphSsa.lean.
  Do not invent HostFrontLiveLlvmGraphSsa (library wrap). Do not wrap IrGraph.lean.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not steal HostFrontLiveLlvmTypesSsaMain (sibling TYPES mill wrap).
  Do not steal HostFrontLiveLlvmProgramSsaMain (sibling PROGRAM mill wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmGraphSsaMain is not a
  prefix hit on HostFrontLiveLlvmGraphSsaMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmGraphSsaMain is not a prefix):
  HostFrontLiveLlvmGraphSsaMainSource
  PARSE-LIVE-LLVM-GRAPH-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-GRAPH-SSA-MAIN
  LLVM-GRAPH-SSA-MAIN
  HOST-LLVM-GRAPH-SSA-MAIN
  Live product needles:
  LlvmGraphSsaMain
  slake-llvm-graph-ssa
  import SystemsLean.LlvmGraphSsa
  HOST-LLVM-GRAPH-SSA
  SLAKE_LLVM_GRAPH_SSA
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmGraphSsaMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmGraphSsaMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmGraphSsaMain

/-- Dual-pinned live LlvmGraphSsaMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmGraphSsaMainSource, PARSE-LIVE-LLVM-GRAPH-SSA-MAIN. -/
def liveLlvmGraphSsaMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Graph SSA lower
  (SKELETON). Root for lake exe slake-llvm-graph-ssa. Body lives in
  SystemsLean.LlvmGraphSsa (llvmGraphSsaReady / Graph SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmGraphSsaMain, slake-llvm-graph-ssa,
  LlvmGraphSsaMain, HOST-LLVM-GRAPH-SSA, SLAKE_LLVM_GRAPH_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmGraphSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmGraphSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmGraphSsa.main args
"#

end SystemsLean.HostFrontLiveLlvmGraphSsaMain
