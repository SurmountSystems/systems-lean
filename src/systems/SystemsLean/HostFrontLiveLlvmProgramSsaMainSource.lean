/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmProgramSsaMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmProgramSsaMainSource. Not occupancy name 50.
  Not mill 64 remill. Mill stays 69 of 69.
  This wrap parses LlvmProgramSsaMain.lean only. Do not wrap LlvmProgramSsa.lean.
  Do not invent HostFrontLiveLlvmProgramSsa (library wrap).
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not steal HostFrontLiveLlvmTypesSsaMain (sibling TYPES mill wrap).
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveLlvmProgramSsaMain is not a
  prefix hit on HostFrontLiveLlvmProgramSsaMainSource.
  Occupancy leftover Term files are not this wrap.
  Unique needles (trailing newline so HostFrontLiveLlvmProgramSsaMain is not a prefix):
  HostFrontLiveLlvmProgramSsaMainSource
  PARSE-LIVE-LLVM-PROGRAM-SSA-MAIN
  HOST-FRONT-LIVE-LLVM-PROGRAM-SSA-MAIN
  LLVM-PROGRAM-SSA-MAIN
  HOST-LLVM-PROGRAM-SSA-MAIN
  Live product needles:
  LlvmProgramSsaMain
  slake-llvm-program-ssa
  import SystemsLean.LlvmProgramSsa
  HOST-LLVM-PROGRAM-SSA
  SLAKE_LLVM_PROGRAM_SSA
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmProgramSsaMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmProgramSsaMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY. Not FullBackend.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmProgramSsaMain

/-- Dual-pinned live LlvmProgramSsaMain.lean bytes (must match on-disk file).
    Greppable: liveLlvmProgramSsaMainSource, PARSE-LIVE-LLVM-PROGRAM-SSA-MAIN. -/
def liveLlvmProgramSsaMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for LLVM Program SSA lower
  (SKELETON). Root for lake exe slake-llvm-program-ssa. Body lives in
  SystemsLean.LlvmProgramSsa (llvmProgramSsaReady / Program SSA write under out/llvm-ir).
  Greppable: SystemsLean.LlvmProgramSsaMain, slake-llvm-program-ssa,
  LlvmProgramSsaMain, HOST-LLVM-PROGRAM-SSA, SLAKE_LLVM_PROGRAM_SSA,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.LlvmProgramSsaMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY. Not llvm unlock.
-/

import SystemsLean.LlvmProgramSsa

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.LlvmProgramSsa.main args
"#

end SystemsLean.HostFrontLiveLlvmProgramSsaMain
