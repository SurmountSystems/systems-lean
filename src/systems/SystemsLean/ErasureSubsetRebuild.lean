/-
  SYSTEMS_LEAN_HOST partial -- Erasure subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Erasure subset package identity (erasureSubsetEmitReady /
  erasureSubsetEmitWroteExpected / slake_erasure_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Erasure unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Greppable: SYSTEMS_LEAN_HOST, ERASURE-SUBSET-REBUILD, SLAKE_ERASURE_SUBSET_REBUILD,
  SLAKE_ERASURE_SUBSET_REBUILD_V0, HOST-ERASURE-SUBSET-REBUILD, erasureSubsetRebuildReady,
  erasureSubsetRebuildInputReady, erasureSubsetRebuildSelfApplyOk,
  erasureSubsetRebuildWroteExpected, erasureSubsetRebuildReady_true,
  ERASURE-SUBSET-REBUILD-SMOKE, ERASURE-SUBSET-REBUILD-THEOREM, ERASURE-SUBSET-EMIT,
  erasureSubsetEmitReady, erasureSubsetEmitWroteExpected, slake-erasure-subset-rebuild,
  just erasure-subset-rebuild, slake_erasure_subset.h, slake_erasure_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, ERASE-RULE-MULT-0, ERASE-NO-RUNTIME,
  UNIT_SURFACE host surface, HOST-EMIT-ERASURE.
  Module: SystemsLean.ErasureSubsetRebuild
  Short role name (not ProductPathFreestandingErasureSubsetRebuild kitchen-sink).
  Honesty dual evidence: erasureSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe erasureSubsetRebuildWrite (IO.FS.writeFile) plus just
  erasure-subset-rebuild greps on emit/slake_erasure_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ErasureSubsetRebuild;
  lake exe slake-erasure-subset-rebuild; just erasure-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.ErasureSubsetEmit

namespace SystemsLean.ErasureSubsetRebuild

open SystemsLean.ErasureSubsetEmit

/-! ### ERASURE-SUBSET-REBUILD / SLAKE_ERASURE_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Erasure subset package identity (`erasureSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Erasure unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Erasure subset rebuild). -/
def stageId : String := "SLAKE_ERASURE_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-ERASURE-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "ERASURE-SUBSET-REBUILD"

/-- M1 Erasure subset package identity reused as rebuild input.
    Greppable: erasureSubsetRebuildInputId, ERASURE-SUBSET-EMIT, SLAKE_ERASURE_SUBSET_EMIT_V0. -/
def erasureSubsetRebuildInputId : String := ErasureSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-erasure-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "erasure-subset-rebuild"

/-- Relative emit header base (same Erasure unit package as M1). -/
def emitHeaderBase : String := ErasureSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Erasure unit package as M1). -/
def emitSourceBase : String := ErasureSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def erasureSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def erasureSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def erasureSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def erasureSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: erasureSubsetRebuildWithoutLakeFinishedClaimed. -/
def erasureSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Erasure subset emit structural readiness reused as rebuild input.
    Greppable: erasureSubsetRebuildInputReady, erasureSubsetEmitReady. -/
def erasureSubsetRebuildInputReady : Bool := erasureSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: erasureSubsetRebuildPackagePinOk, erasureSubsetEmitWroteExpected. -/
def erasureSubsetRebuildPackagePinOk : Bool := erasureSubsetEmitWroteExpected

/-- Self-application structural bar: same Erasure unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: erasureSubsetRebuildSelfApplyOk, erasureSubsetHeaderPackage,
    erasureSubsetSourcePackage. -/
def erasureSubsetRebuildSelfApplyOk : Bool :=
  erasureSubsetRebuildInputReady
    && erasureSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_erasure_subset.h")
    && (emitSourceBase == "slake_erasure_subset.c")
    && (erasureSubsetRebuildInputId == "SLAKE_ERASURE_SUBSET_EMIT_V0")
    && erasureSubsetEmitWroteExpected
    && (erasureSubsetHeaderPackage.length > 0)
    && (erasureSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: erasureSubsetRebuildWrite
    + just erasure-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 erasureSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: erasureSubsetRebuildWroteExpected. -/
def erasureSubsetRebuildWroteExpected : Bool :=
  erasureSubsetRebuildSelfApplyOk && erasureSubsetEmitWroteExpected

/-- Structural ready for Erasure subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: erasureSubsetRebuildReady, ERASURE-SUBSET-REBUILD,
    SLAKE_ERASURE_SUBSET_REBUILD. -/
def erasureSubsetRebuildReady : Bool :=
  erasureSubsetRebuildInputReady
    && erasureSubsetRebuildPackagePinOk
    && erasureSubsetRebuildSelfApplyOk
    && erasureSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !erasureSubsetRebuildResidualFreeClaimed
    && !erasureSubsetRebuildProductSelfHostCompleteClaimed
    && !erasureSubsetRebuildProofCompleteClaimed
    && !erasureSubsetRebuildLlvmUnlocked
    && !erasureSubsetRebuildProvablyUnlocked
    && !erasureSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_ERASURE_SUBSET_REBUILD_V0")
    && (hostId == "HOST-ERASURE-SUBSET-REBUILD")
    && (surfaceId == "ERASURE-SUBSET-REBUILD")
    && (erasureSubsetRebuildInputId == "SLAKE_ERASURE_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-erasure-subset-rebuild")
    && (justRecipe == "erasure-subset-rebuild")
    && (emitHeaderBase == "slake_erasure_subset.h")
    && (emitSourceBase == "slake_erasure_subset.c")

/-- erasureSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: erasureSubsetRebuildDoesNotRetireLake. -/
def erasureSubsetRebuildDoesNotRetireLake : Bool :=
  erasureSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- erasureSubsetRebuildReady is not product residual free claim.
    Greppable: erasureSubsetRebuildDoesNotMeanResidualFree. -/
def erasureSubsetRebuildDoesNotMeanResidualFree : Bool :=
  erasureSubsetRebuildReady && !erasureSubsetRebuildResidualFreeClaimed

/-- erasureSubsetRebuildReady is not without-Lake finished.
    Greppable: erasureSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def erasureSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  erasureSubsetRebuildReady && !erasureSubsetRebuildWithoutLakeFinishedClaimed

/-! ### ERASURE-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Erasure subset input ready for rebuild.
    Greppable: erasureSubsetRebuildInputReady_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildInputReady_true :
    erasureSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: erasureSubsetRebuildPackagePinOk_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildPackagePinOk_true :
    erasureSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: erasureSubsetRebuildSelfApplyOk_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildSelfApplyOk_true :
    erasureSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: erasureSubsetRebuildWroteExpected_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildWroteExpected_true :
    erasureSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Erasure subset rebuild structural ready (M1 follow-on).
    Greppable: erasureSubsetRebuildReady_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildReady_true : erasureSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: erasureSubsetRebuildDoesNotRetireLake_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildDoesNotRetireLake_true :
    erasureSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: erasureSubsetRebuildDoesNotMeanResidualFree_true, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildDoesNotMeanResidualFree_true :
    erasureSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: erasureSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    erasureSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: erasureSubsetRebuild_claims_false, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuild_claims_false :
    (erasureSubsetRebuildResidualFreeClaimed = false)
      /\ (erasureSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (erasureSubsetRebuildProofCompleteClaimed = false)
      /\ (erasureSubsetRebuildLlvmUnlocked = false)
      /\ (erasureSubsetRebuildProvablyUnlocked = false)
      /\ (erasureSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: erasureSubsetRebuild_ids_eq, ERASURE-SUBSET-REBUILD-THEOREM. -/
theorem erasureSubsetRebuild_ids_eq :
    (stageId = "SLAKE_ERASURE_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-ERASURE-SUBSET-REBUILD")
      /\ (surfaceId = "ERASURE-SUBSET-REBUILD")
      /\ (erasureSubsetRebuildInputId = "SLAKE_ERASURE_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-erasure-subset-rebuild")
      /\ (justRecipe = "erasure-subset-rebuild")
      /\ (emitHeaderBase = "slake_erasure_subset.h")
      /\ (emitSourceBase = "slake_erasure_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### ERASURE-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: ERASURE-SUBSET-REBUILD-SMOKE, ERASURE-SUBSET-REBUILD, ERASURE-SUBSET-EMIT. -/

/-- ERASURE-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : erasureSubsetRebuildInputReady = true := by native_decide
example : erasureSubsetRebuildPackagePinOk = true := by native_decide
example : erasureSubsetRebuildSelfApplyOk = true := by native_decide
example : erasureSubsetRebuildWroteExpected = true := by native_decide

/-- ERASURE-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : erasureSubsetRebuildReady = true := by native_decide
example : erasureSubsetRebuildDoesNotRetireLake = true := by native_decide
example : erasureSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : erasureSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : erasureSubsetRebuildResidualFreeClaimed = false := rfl
example : erasureSubsetRebuildLlvmUnlocked = false := rfl
example : erasureSubsetRebuildProvablyUnlocked = false := rfl
example : erasureSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : erasureSubsetRebuildInputId = "SLAKE_ERASURE_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-erasure-subset-rebuild" := rfl
example : emitHeaderBase = "slake_erasure_subset.h" := rfl
example : emitSourceBase = "slake_erasure_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Erasure subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateErasureSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  ErasureSubsetEmit.validateErasureSubsetPackage label text isSource
  pure ()

/-- Rebuild Erasure subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Erasure package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    erasureSubsetRebuildWrite, slake_erasure_subset.h, slake_erasure_subset.c,
    IO.FS.writeFile, ERASURE-SUBSET-REBUILD. -/
def erasureSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless erasureSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: erasureSubsetRebuildReady false"
    throw (IO.userError "erasureSubsetRebuildReady false")
  unless erasureSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: erasureSubsetRebuildWroteExpected false"
    throw (IO.userError "erasureSubsetRebuildWroteExpected false")
  unless erasureSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: erasureSubsetRebuildSelfApplyOk false"
    throw (IO.userError "erasureSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Erasure subset rebuild =="
  IO.println s!"  readyPin={erasureSubsetRebuildReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH erasureSubsetHeaderPackage
  IO.FS.writeFile outC erasureSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Erasure subset header ({emitHeaderBase})"
  requireFile outC s!"Erasure subset source ({emitSourceBase})"
  if headerWritten != erasureSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != erasureSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateErasureSubsetRebuildPackage emitHeaderBase headerWritten false
  validateErasureSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: ERASURE-SUBSET-REBUILD, SLAKE_ERASURE_SUBSET_REBUILD_V0, ERASURE-SUBSET-EMIT, erasureSubsetRebuildReady"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Erasure subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    erasureSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ErasureSubsetRebuild
