/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProgramSubsetRebuild.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProgramSubsetRebuildSource. Not occupancy name 50. Not mill 70.
  This wrap is ProgramSubsetRebuild.lean. It is not ProgramSubsetRebuildMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveProgramSubsetRebuildSource,
  HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProgramSubsetRebuildSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProgramSubsetRebuild

/-- Dual-pinned live ProgramSubsetRebuild.lean bytes (must match on-disk file).
    Greppable: liveProgramSubsetRebuildSource, HOST-FRONT-LIVE-PROGRAM-SUBSET-REBUILD. -/
def liveProgramSubsetRebuildSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Program subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Program subset package identity (programSubsetEmitReady /
  programSubsetEmitWroteExpected / slake_program_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Program unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Greppable: SYSTEMS_LEAN_HOST, PROGRAM-SUBSET-REBUILD, SLAKE_PROGRAM_SUBSET_REBUILD,
  SLAKE_PROGRAM_SUBSET_REBUILD_V0, HOST-PROGRAM-SUBSET-REBUILD, programSubsetRebuildReady,
  programSubsetRebuildInputReady, programSubsetRebuildSelfApplyOk,
  programSubsetRebuildWroteExpected, programSubsetRebuildReady_true,
  PROGRAM-SUBSET-REBUILD-SMOKE, PROGRAM-SUBSET-REBUILD-THEOREM, PROGRAM-SUBSET-EMIT,
  programSubsetEmitReady, programSubsetEmitWroteExpected, slake-program-subset-rebuild,
  just program-subset-rebuild, slake_program_subset.h, slake_program_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, UNIT_SURFACE host surface,
  IR_PROGRAM_V0 (Program subset package dialect).
  Module: SystemsLean.ProgramSubsetRebuild
  Short role name (not ProductPathFreestandingProgramSubsetRebuild kitchen-sink).
  Honesty dual evidence: programSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe programSubsetRebuildWrite (IO.FS.writeFile) plus just
  program-subset-rebuild greps on emit/slake_program_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ProgramSubsetRebuild;
  lake exe slake-program-subset-rebuild; just program-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.ProgramSubsetEmit

namespace SystemsLean.ProgramSubsetRebuild

open SystemsLean.ProgramSubsetEmit

/-! ### PROGRAM-SUBSET-REBUILD / SLAKE_PROGRAM_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Program subset package identity (`programSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Program unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Program subset rebuild). -/
def stageId : String := "SLAKE_PROGRAM_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-PROGRAM-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "PROGRAM-SUBSET-REBUILD"

/-- M1 Program subset package identity reused as rebuild input.
    Greppable: programSubsetRebuildInputId, PROGRAM-SUBSET-EMIT, SLAKE_PROGRAM_SUBSET_EMIT_V0. -/
def programSubsetRebuildInputId : String := ProgramSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-program-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "program-subset-rebuild"

/-- Relative emit header base (same Program unit package as M1). -/
def emitHeaderBase : String := ProgramSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Program unit package as M1). -/
def emitSourceBase : String := ProgramSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def programSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def programSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def programSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def programSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: programSubsetRebuildWithoutLakeFinishedClaimed. -/
def programSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Program subset emit structural readiness reused as rebuild input.
    Greppable: programSubsetRebuildInputReady, programSubsetEmitReady. -/
def programSubsetRebuildInputReady : Bool := programSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: programSubsetRebuildPackagePinOk, programSubsetEmitWroteExpected. -/
def programSubsetRebuildPackagePinOk : Bool := programSubsetEmitWroteExpected

/-- Self-application structural bar: same Program unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: programSubsetRebuildSelfApplyOk, programSubsetHeaderPackage,
    programSubsetSourcePackage. -/
def programSubsetRebuildSelfApplyOk : Bool :=
  programSubsetRebuildInputReady
    && programSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_program_subset.h")
    && (emitSourceBase == "slake_program_subset.c")
    && (programSubsetRebuildInputId == "SLAKE_PROGRAM_SUBSET_EMIT_V0")
    && programSubsetEmitWroteExpected
    && (programSubsetHeaderPackage.length > 0)
    && (programSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: programSubsetRebuildWrite
    + just program-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 programSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: programSubsetRebuildWroteExpected. -/
def programSubsetRebuildWroteExpected : Bool :=
  programSubsetRebuildSelfApplyOk && programSubsetEmitWroteExpected

/-- Structural ready for Program subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: programSubsetRebuildReady, PROGRAM-SUBSET-REBUILD,
    SLAKE_PROGRAM_SUBSET_REBUILD. -/
def programSubsetRebuildReady : Bool :=
  programSubsetRebuildInputReady
    && programSubsetRebuildPackagePinOk
    && programSubsetRebuildSelfApplyOk
    && programSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !programSubsetRebuildResidualFreeClaimed
    && !programSubsetRebuildProductSelfHostCompleteClaimed
    && !programSubsetRebuildProofCompleteClaimed
    && !programSubsetRebuildLlvmUnlocked
    && !programSubsetRebuildProvablyUnlocked
    && !programSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_PROGRAM_SUBSET_REBUILD_V0")
    && (hostId == "HOST-PROGRAM-SUBSET-REBUILD")
    && (surfaceId == "PROGRAM-SUBSET-REBUILD")
    && (programSubsetRebuildInputId == "SLAKE_PROGRAM_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-program-subset-rebuild")
    && (justRecipe == "program-subset-rebuild")
    && (emitHeaderBase == "slake_program_subset.h")
    && (emitSourceBase == "slake_program_subset.c")

/-- programSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: programSubsetRebuildDoesNotRetireLake. -/
def programSubsetRebuildDoesNotRetireLake : Bool :=
  programSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- programSubsetRebuildReady is not product residual free claim.
    Greppable: programSubsetRebuildDoesNotMeanResidualFree. -/
def programSubsetRebuildDoesNotMeanResidualFree : Bool :=
  programSubsetRebuildReady && !programSubsetRebuildResidualFreeClaimed

/-- programSubsetRebuildReady is not without-Lake finished.
    Greppable: programSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def programSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  programSubsetRebuildReady && !programSubsetRebuildWithoutLakeFinishedClaimed

/-! ### PROGRAM-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Program subset input ready for rebuild.
    Greppable: programSubsetRebuildInputReady_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildInputReady_true :
    programSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: programSubsetRebuildPackagePinOk_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildPackagePinOk_true :
    programSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: programSubsetRebuildSelfApplyOk_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildSelfApplyOk_true :
    programSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: programSubsetRebuildWroteExpected_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildWroteExpected_true :
    programSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Program subset rebuild structural ready (M1 follow-on).
    Greppable: programSubsetRebuildReady_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildReady_true : programSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: programSubsetRebuildDoesNotRetireLake_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildDoesNotRetireLake_true :
    programSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: programSubsetRebuildDoesNotMeanResidualFree_true, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildDoesNotMeanResidualFree_true :
    programSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: programSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    programSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: programSubsetRebuild_claims_false, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuild_claims_false :
    (programSubsetRebuildResidualFreeClaimed = false)
      /\ (programSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (programSubsetRebuildProofCompleteClaimed = false)
      /\ (programSubsetRebuildLlvmUnlocked = false)
      /\ (programSubsetRebuildProvablyUnlocked = false)
      /\ (programSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: programSubsetRebuild_ids_eq, PROGRAM-SUBSET-REBUILD-THEOREM. -/
theorem programSubsetRebuild_ids_eq :
    (stageId = "SLAKE_PROGRAM_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-PROGRAM-SUBSET-REBUILD")
      /\ (surfaceId = "PROGRAM-SUBSET-REBUILD")
      /\ (programSubsetRebuildInputId = "SLAKE_PROGRAM_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-program-subset-rebuild")
      /\ (justRecipe = "program-subset-rebuild")
      /\ (emitHeaderBase = "slake_program_subset.h")
      /\ (emitSourceBase = "slake_program_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### PROGRAM-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: PROGRAM-SUBSET-REBUILD-SMOKE, PROGRAM-SUBSET-REBUILD, PROGRAM-SUBSET-EMIT. -/

/-- PROGRAM-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : programSubsetRebuildInputReady = true := by native_decide
example : programSubsetRebuildPackagePinOk = true := by native_decide
example : programSubsetRebuildSelfApplyOk = true := by native_decide
example : programSubsetRebuildWroteExpected = true := by native_decide

/-- PROGRAM-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : programSubsetRebuildReady = true := by native_decide
example : programSubsetRebuildDoesNotRetireLake = true := by native_decide
example : programSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : programSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : programSubsetRebuildResidualFreeClaimed = false := rfl
example : programSubsetRebuildLlvmUnlocked = false := rfl
example : programSubsetRebuildProvablyUnlocked = false := rfl
example : programSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : programSubsetRebuildInputId = "SLAKE_PROGRAM_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-program-subset-rebuild" := rfl
example : emitHeaderBase = "slake_program_subset.h" := rfl
example : emitSourceBase = "slake_program_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Program subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateProgramSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  ProgramSubsetEmit.validateProgramSubsetPackage label text isSource
  pure ()

/-- Rebuild Program subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Program package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    programSubsetRebuildWrite, slake_program_subset.h, slake_program_subset.c,
    IO.FS.writeFile, PROGRAM-SUBSET-REBUILD. -/
def programSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless programSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: programSubsetRebuildReady false"
    throw (IO.userError "programSubsetRebuildReady false")
  unless programSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: programSubsetRebuildWroteExpected false"
    throw (IO.userError "programSubsetRebuildWroteExpected false")
  unless programSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: programSubsetRebuildSelfApplyOk false"
    throw (IO.userError "programSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Program subset rebuild =="
  IO.println s!"  readyPin={programSubsetRebuildReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH programSubsetHeaderPackage
  IO.FS.writeFile outC programSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Program subset header ({emitHeaderBase})"
  requireFile outC s!"Program subset source ({emitSourceBase})"
  if headerWritten != programSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != programSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateProgramSubsetRebuildPackage emitHeaderBase headerWritten false
  validateProgramSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: PROGRAM-SUBSET-REBUILD, SLAKE_PROGRAM_SUBSET_REBUILD_V0, PROGRAM-SUBSET-EMIT, programSubsetRebuildReady"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Program subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    programSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ProgramSubsetRebuild
"#

end SystemsLean.HostFrontLiveProgramSubsetRebuild
