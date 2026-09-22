/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmTypesSsaMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmTypesSsaMainSource. Not occupancy name 50.
  Not mill 58 remill. Mill stays 69 of 69.
  This wrap parses LlvmTypesSsaMain.lean only. Do not wrap LlvmTypesSsa.lean.
  Do not invent HostFrontLiveLlvmTypesSsa (library wrap).
  This wrap is not an LLVM backend claim. FullBackend stays false.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmTypesSsaMain is not a
  prefix hit on HostFrontLiveLlvmTypesSsaMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmTypesSsaMain is not a prefix):
  HostFrontLiveLlvmTypesSsaMainSource
  PARSE-LIVE-LLVM-TYPES-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-TYPES-SSA-MAIN
  LLVM-TYPES-SSA-MAIN
  HOST-LLVM-TYPES-SSA-MAIN
  Live product needles:
  LlvmTypesSsaMain
  slake-llvm-types-ssa
  import SystemsLean.LlvmTypesSsa
  HOST-LLVM-TYPES-SSA
  SLAKE_LLVM_TYPES_SSA
  SKELETON
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmTypesSsaMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmTypesSsaMainSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmTypesSsaMain

/-- Dual-pinned live LlvmTypesSsaMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmTypesSsaMainSource, PARSE-LIVE-LLVM-TYPES-SSA-MAIN. -/
def liveLlvmTypesSsaMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Types SSA lower
  (SKELETON). Root for lake exe slake-llvm-types-ssa. Body lives in
  SystemsLean.LlvmTypesSsa (llvmTypesSsaReady / Types SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmTypesSsaMain, slake-llvm-types-ssa,
  LlvmTypesSsaMain, HOST-LLVM-TYPES-SSA, SLAKE_LLVM_TYPES_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmTypesSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmTypesSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmTypesSsa.main args
"#

end SystemsLean.HostFrontLiveLlvmTypesSsaMain
