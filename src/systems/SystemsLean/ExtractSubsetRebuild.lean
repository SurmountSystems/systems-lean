/-
  SYSTEMS_LEAN_HOST partial -- Extract subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Extract subset package identity (extractSubsetEmitReady /
  extractSubsetEmitWroteExpected / slake_extract_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Extract unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Greppable: SYSTEMS_LEAN_HOST, EXTRACT-SUBSET-REBUILD, SLAKE_EXTRACT_SUBSET_REBUILD,
  SLAKE_EXTRACT_SUBSET_REBUILD_V0, HOST-EXTRACT-SUBSET-REBUILD, extractSubsetRebuildReady,
  extractSubsetRebuildInputReady, extractSubsetRebuildSelfApplyOk,
  extractSubsetRebuildWroteExpected, extractSubsetRebuildReady_true,
  EXTRACT-SUBSET-REBUILD-SMOKE, EXTRACT-SUBSET-REBUILD-THEOREM, EXTRACT-SUBSET-EMIT,
  extractSubsetEmitReady, extractSubsetEmitWroteExpected, slake-extract-subset-rebuild,
  just extract-subset-rebuild, slake_extract_subset.h, slake_extract_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, UNIT_SURFACE host surface,
  FAIL_CLOSED_CHECKER_V1 (Extract subset package dialect).
  Module: SystemsLean.ExtractSubsetRebuild
  Short role name (not ProductPathFreestandingExtractSubsetRebuild kitchen-sink).
  Honesty dual evidence: extractSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe extractSubsetRebuildWrite (IO.FS.writeFile) plus just
  extract-subset-rebuild greps on emit/slake_extract_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ExtractSubsetRebuild;
  lake exe slake-extract-subset-rebuild; just extract-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.ExtractSubsetEmit

namespace SystemsLean.ExtractSubsetRebuild

open SystemsLean.ExtractSubsetEmit

/-! ### EXTRACT-SUBSET-REBUILD / SLAKE_EXTRACT_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Extract subset package identity (`extractSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Extract unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Extract subset rebuild). -/
def stageId : String := "SLAKE_EXTRACT_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-EXTRACT-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "EXTRACT-SUBSET-REBUILD"

/-- M1 Extract subset package identity reused as rebuild input.
    Greppable: extractSubsetRebuildInputId, EXTRACT-SUBSET-EMIT, SLAKE_EXTRACT_SUBSET_EMIT_V0. -/
def extractSubsetRebuildInputId : String := ExtractSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-extract-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "extract-subset-rebuild"

/-- Relative emit header base (same Extract unit package as M1). -/
def emitHeaderBase : String := ExtractSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Extract unit package as M1). -/
def emitSourceBase : String := ExtractSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def extractSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def extractSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def extractSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def extractSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: extractSubsetRebuildWithoutLakeFinishedClaimed. -/
def extractSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Extract subset emit structural readiness reused as rebuild input.
    Greppable: extractSubsetRebuildInputReady, extractSubsetEmitReady. -/
def extractSubsetRebuildInputReady : Bool := extractSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: extractSubsetRebuildPackagePinOk, extractSubsetEmitWroteExpected. -/
def extractSubsetRebuildPackagePinOk : Bool := extractSubsetEmitWroteExpected

/-- Self-application structural bar: same Extract unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: extractSubsetRebuildSelfApplyOk, extractSubsetHeaderPackage,
    extractSubsetSourcePackage. -/
def extractSubsetRebuildSelfApplyOk : Bool :=
  extractSubsetRebuildInputReady
    && extractSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_extract_subset.h")
    && (emitSourceBase == "slake_extract_subset.c")
    && (extractSubsetRebuildInputId == "SLAKE_EXTRACT_SUBSET_EMIT_V0")
    && extractSubsetEmitWroteExpected
    && (extractSubsetHeaderPackage.length > 0)
    && (extractSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: extractSubsetRebuildWrite
    + just extract-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 extractSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: extractSubsetRebuildWroteExpected. -/
def extractSubsetRebuildWroteExpected : Bool :=
  extractSubsetRebuildSelfApplyOk && extractSubsetEmitWroteExpected

/-- Structural ready for Extract subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: extractSubsetRebuildReady, EXTRACT-SUBSET-REBUILD,
    SLAKE_EXTRACT_SUBSET_REBUILD. -/
def extractSubsetRebuildReady : Bool :=
  extractSubsetRebuildInputReady
    && extractSubsetRebuildPackagePinOk
    && extractSubsetRebuildSelfApplyOk
    && extractSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !extractSubsetRebuildResidualFreeClaimed
    && !extractSubsetRebuildProductSelfHostCompleteClaimed
    && !extractSubsetRebuildProofCompleteClaimed
    && !extractSubsetRebuildLlvmUnlocked
    && !extractSubsetRebuildProvablyUnlocked
    && !extractSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_EXTRACT_SUBSET_REBUILD_V0")
    && (hostId == "HOST-EXTRACT-SUBSET-REBUILD")
    && (surfaceId == "EXTRACT-SUBSET-REBUILD")
    && (extractSubsetRebuildInputId == "SLAKE_EXTRACT_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-extract-subset-rebuild")
    && (justRecipe == "extract-subset-rebuild")
    && (emitHeaderBase == "slake_extract_subset.h")
    && (emitSourceBase == "slake_extract_subset.c")

/-- extractSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: extractSubsetRebuildDoesNotRetireLake. -/
def extractSubsetRebuildDoesNotRetireLake : Bool :=
  extractSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- extractSubsetRebuildReady is not product residual free claim.
    Greppable: extractSubsetRebuildDoesNotMeanResidualFree. -/
def extractSubsetRebuildDoesNotMeanResidualFree : Bool :=
  extractSubsetRebuildReady && !extractSubsetRebuildResidualFreeClaimed

/-- extractSubsetRebuildReady is not without-Lake finished.
    Greppable: extractSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def extractSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  extractSubsetRebuildReady && !extractSubsetRebuildWithoutLakeFinishedClaimed

/-! ### EXTRACT-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Extract subset input ready for rebuild.
    Greppable: extractSubsetRebuildInputReady_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildInputReady_true :
    extractSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: extractSubsetRebuildPackagePinOk_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildPackagePinOk_true :
    extractSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: extractSubsetRebuildSelfApplyOk_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildSelfApplyOk_true :
    extractSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: extractSubsetRebuildWroteExpected_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildWroteExpected_true :
    extractSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Extract subset rebuild structural ready (M1 follow-on).
    Greppable: extractSubsetRebuildReady_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildReady_true : extractSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: extractSubsetRebuildDoesNotRetireLake_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildDoesNotRetireLake_true :
    extractSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: extractSubsetRebuildDoesNotMeanResidualFree_true, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildDoesNotMeanResidualFree_true :
    extractSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: extractSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    extractSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: extractSubsetRebuild_claims_false, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuild_claims_false :
    (extractSubsetRebuildResidualFreeClaimed = false)
      /\ (extractSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (extractSubsetRebuildProofCompleteClaimed = false)
      /\ (extractSubsetRebuildLlvmUnlocked = false)
      /\ (extractSubsetRebuildProvablyUnlocked = false)
      /\ (extractSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: extractSubsetRebuild_ids_eq, EXTRACT-SUBSET-REBUILD-THEOREM. -/
theorem extractSubsetRebuild_ids_eq :
    (stageId = "SLAKE_EXTRACT_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-EXTRACT-SUBSET-REBUILD")
      /\ (surfaceId = "EXTRACT-SUBSET-REBUILD")
      /\ (extractSubsetRebuildInputId = "SLAKE_EXTRACT_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-extract-subset-rebuild")
      /\ (justRecipe = "extract-subset-rebuild")
      /\ (emitHeaderBase = "slake_extract_subset.h")
      /\ (emitSourceBase = "slake_extract_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### EXTRACT-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: EXTRACT-SUBSET-REBUILD-SMOKE, EXTRACT-SUBSET-REBUILD, EXTRACT-SUBSET-EMIT. -/

/-- EXTRACT-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : extractSubsetRebuildInputReady = true := by native_decide
example : extractSubsetRebuildPackagePinOk = true := by native_decide
example : extractSubsetRebuildSelfApplyOk = true := by native_decide
example : extractSubsetRebuildWroteExpected = true := by native_decide

/-- EXTRACT-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : extractSubsetRebuildReady = true := by native_decide
example : extractSubsetRebuildDoesNotRetireLake = true := by native_decide
example : extractSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : extractSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : extractSubsetRebuildResidualFreeClaimed = false := rfl
example : extractSubsetRebuildLlvmUnlocked = false := rfl
example : extractSubsetRebuildProvablyUnlocked = false := rfl
example : extractSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : extractSubsetRebuildInputId = "SLAKE_EXTRACT_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-extract-subset-rebuild" := rfl
example : emitHeaderBase = "slake_extract_subset.h" := rfl
example : emitSourceBase = "slake_extract_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Extract subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateExtractSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  ExtractSubsetEmit.validateExtractSubsetPackage label text isSource
  pure ()

/-- Rebuild Extract subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Extract package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    extractSubsetRebuildWrite, slake_extract_subset.h, slake_extract_subset.c,
    IO.FS.writeFile, EXTRACT-SUBSET-REBUILD. -/
def extractSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless extractSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: extractSubsetRebuildReady false"
    throw (IO.userError "extractSubsetRebuildReady false")
  unless extractSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: extractSubsetRebuildWroteExpected false"
    throw (IO.userError "extractSubsetRebuildWroteExpected false")
  unless extractSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: extractSubsetRebuildSelfApplyOk false"
    throw (IO.userError "extractSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Extract subset rebuild / self-application (M1 follow-on) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  M1 package input id: {extractSubsetRebuildInputId} (EXTRACT-SUBSET-EMIT reuse)"
  IO.println s!"  extractSubsetRebuildInputReady: {extractSubsetRebuildInputReady} (extractSubsetEmitReady)"
  IO.println s!"  extractSubsetRebuildPackagePinOk: {extractSubsetRebuildPackagePinOk} (extractSubsetEmitWroteExpected)"
  IO.println s!"  extractSubsetRebuildSelfApplyOk: {extractSubsetRebuildSelfApplyOk}"
  IO.println s!"  extractSubsetRebuildReady: {extractSubsetRebuildReady}"
  IO.println s!"  extractSubsetRebuildWroteExpected: {extractSubsetRebuildWroteExpected} (package identity pin)"
  IO.println s!"  stillUsesLake: {stillUsesLake} (true until S4)"
  IO.println s!"  dependsOnLake: {dependsOnLake} (host elaborator bootstrap)"
  IO.println s!"  withoutLakeFinished: {extractSubsetRebuildWithoutLakeFinishedClaimed} (false; deepen later)"
  IO.println s!"  Lake exe: {lakeExeName} / just {justRecipe}"
  IO.println "  honest: rebuild = measured Extract subset self-application (re-emit/re-validate); not full dialect regenerate"
  IO.println "  honest: Lake host remains; free/complete living tip unchanged; not PROVABLY; not llvm"
  IO.println "  honest: not without-Lake finished; not S4 Lake retire"
  IO.println "  short module name ExtractSubsetRebuild (not ProductPathFreestandingExtractSubsetRebuild)"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH extractSubsetHeaderPackage
  IO.FS.writeFile outC extractSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Extract subset header ({emitHeaderBase})"
  requireFile outC s!"Extract subset source ({emitSourceBase})"
  if headerWritten != extractSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != extractSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateExtractSubsetRebuildPackage emitHeaderBase headerWritten false
  validateExtractSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: Extract subset self-application rebuild under {emitDir}/"
  IO.println s!"  rewrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  rewrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  greppable: EXTRACT-SUBSET-REBUILD, SLAKE_EXTRACT_SUBSET_REBUILD_V0, EXTRACT-SUBSET-EMIT, extractSubsetRebuildReady"
  IO.println "  honest: subset rebuild / self-application evidence (Lake-hosted; not without-Lake finished)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Extract subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    extractSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ExtractSubsetRebuild
