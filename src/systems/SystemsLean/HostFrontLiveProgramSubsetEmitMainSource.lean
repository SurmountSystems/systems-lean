/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProgramSubsetEmitMain.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProgramSubsetEmitMainSource. Not occupancy name 50.
  Not mill 36 remill. Mill stays 69 of 69.
  This wrap parses ProgramSubsetEmitMain.lean only. Do not wrap ProgramSubsetEmit.lean.
  Do not invent HostFrontLiveProgramSubsetEmit (library wrap).
  Do not steal HostFrontLiveProgramMain (library wrap of Program.lean; none existed).
  Do not steal HostFrontLiveProgramForeignLink (liveRel is ProgramForeignLink.lean).
  This wrap is not ExtractSubsetEmitMain. This wrap is not GraphSubsetEmitMain.
  DualEqWrite.lean does not exist and is not invented.
  CapableWrite.lean does not exist. HostResidualShrinkFacts.lean does not exist.
  Do not split DualPinOk.
  Unique needles use trailing newline so HostFrontLiveProgramSubsetEmitMain is not a
  prefix hit on HostFrontLiveProgramSubsetEmitMainSource.
  Occupancy leftover HostModuleCheckProgramSubsetEmitTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveProgramSubsetEmitMain is not a prefix):
  HostFrontLiveProgramSubsetEmitMainSource
  PARSE-LIVE-PROGRAM-SUBSET-EMIT-MAIN
  HOST-FRONT-LIVE-PROGRAM-SUBSET-EMIT-MAIN
  PROGRAM-SUBSET-EMIT-MAIN
  HOST-PROGRAM-SUBSET-EMIT-MAIN
  Live product needles:
  ProgramSubsetEmitMain
  slake-program-subset-emit
  import SystemsLean.ProgramSubsetEmit
  PROGRAM-SUBSET-EMIT
  SLAKE_PROGRAM_SUBSET_EMIT
  Greppable: SYSTEMS_LEAN_HOST, liveProgramSubsetEmitMainSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProgramSubsetEmitMainSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProgramSubsetEmitMain

/-- Dual-pinned live ProgramSubsetEmitMain.lean bytes (must match on-disk file).
    Greppable: liveProgramSubsetEmitMainSource, PARSE-LIVE-PROGRAM-SUBSET-EMIT-MAIN. -/
def liveProgramSubsetEmitMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for Program subset freestanding
  emit (SKELETON). Root for lake exe slake-program-subset-emit. Body lives in
  SystemsLean.ProgramSubsetEmit (programSubsetEmitReady / Program unit package write).
  Greppable: SystemsLean.ProgramSubsetEmitMain, slake-program-subset-emit,
  ProgramSubsetEmitMain, PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_EMIT,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module: SystemsLean.ProgramSubsetEmitMain
  Module must stay ASCII. Not freestanding residual free.
  Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.ProgramSubsetEmit

/-- Lake / lean --run entry: forward argv (optional repo root). -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProgramSubsetEmit.main args
"#

end SystemsLean.HostFrontLiveProgramSubsetEmitMain
