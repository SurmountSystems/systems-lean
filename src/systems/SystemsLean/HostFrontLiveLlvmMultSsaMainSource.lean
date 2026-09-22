/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmMultSsaMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmMultSsaMainSource. Not occupancy name 50.
  Not mill 61 remill. Mill stays 69 of 69.
  This wrap parses LlvmMultSsaMain.lean only. Do not wrap LlvmMultSsa.lean.
  Do not invent HostFrontLiveLlvmMultSsa (library wrap). Do not wrap IrGraph.lean.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not steal HostFrontLiveLlvmTypesSsaMain (sibling TYPES mill wrap).
  Do not steal HostFrontLiveLlvmProgramSsaMain (sibling PROGRAM mill wrap).
  Do not steal HostFrontLiveLlvmGraphSsaMain (sibling GRAPH mill wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmMultSsaMain is not a
  prefix hit on HostFrontLiveLlvmMultSsaMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmMultSsaMain is not a prefix):
  HostFrontLiveLlvmMultSsaMainSource
  PARSE-LIVE-LLVM-MULT-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-MULT-SSA-MAIN
  LLVM-MULT-SSA-MAIN
  HOST-LLVM-MULT-SSA-MAIN
  Live product needles:
  LlvmMultSsaMain
  slake-llvm-mult-ssa
  import SystemsLean.LlvmMultSsa
  HOST-LLVM-MULT-SSA
  SLAKE_LLVM_MULT_SSA
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmMultSsaMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmMultSsaMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmMultSsaMain

/-- Dual-pinned live LlvmMultSsaMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmMultSsaMainSource, PARSE-LIVE-LLVM-MULT-SSA-MAIN. -/
def liveLlvmMultSsaMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Mult SSA lower
  (SKELETON). Root for lake exe slake-llvm-mult-ssa. Body lives in
  SystemsLean.LlvmMultSsa (llvmMultSsaReady / Mult SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmMultSsaMain, slake-llvm-mult-ssa,
  LlvmMultSsaMain, HOST-LLVM-MULT-SSA, SLAKE_LLVM_MULT_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmMultSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmMultSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmMultSsa.main args
"#

end SystemsLean.HostFrontLiveLlvmMultSsaMain
