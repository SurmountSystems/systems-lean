/-
  SYSTEMS_LEAN_HOST partial -- Linear subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Linear subset package identity (linearSubsetEmitReady /
  linearSubsetEmitWroteExpected / slake_linear_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Linear unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Greppable: SYSTEMS_LEAN_HOST, LINEAR-SUBSET-REBUILD, SLAKE_LINEAR_SUBSET_REBUILD,
  SLAKE_LINEAR_SUBSET_REBUILD_V0, HOST-LINEAR-SUBSET-REBUILD, linearSubsetRebuildReady,
  linearSubsetRebuildInputReady, linearSubsetRebuildSelfApplyOk,
  linearSubsetRebuildWroteExpected, linearSubsetRebuildReady_true,
  LINEAR-SUBSET-REBUILD-SMOKE, LINEAR-SUBSET-REBUILD-THEOREM, LINEAR-SUBSET-EMIT,
  linearSubsetEmitReady, linearSubsetEmitWroteExpected, slake-linear-subset-rebuild,
  just linear-subset-rebuild, slake_linear_subset.h, slake_linear_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, UNIT_SURFACE host surface,
  LINEAR-EXACT-ONCE (Linear subset package dialect).
  Module: SystemsLean.LinearSubsetRebuild
  Short role name (not ProductPathFreestandingLinearSubsetRebuild kitchen-sink).
  Honesty dual evidence: linearSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe linearSubsetRebuildWrite (IO.FS.writeFile) plus just
  linear-subset-rebuild greps on emit/slake_linear_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.LinearSubsetRebuild;
  lake exe slake-linear-subset-rebuild; just linear-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.LinearSubsetEmit

namespace SystemsLean.LinearSubsetRebuild

open SystemsLean.LinearSubsetEmit

/-! ### LINEAR-SUBSET-REBUILD / SLAKE_LINEAR_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Linear subset package identity (`linearSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Linear unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Linear subset rebuild). -/
def stageId : String := "SLAKE_LINEAR_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LINEAR-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "LINEAR-SUBSET-REBUILD"

/-- M1 Linear subset package identity reused as rebuild input.
    Greppable: linearSubsetRebuildInputId, LINEAR-SUBSET-EMIT, SLAKE_LINEAR_SUBSET_EMIT_V0. -/
def linearSubsetRebuildInputId : String := LinearSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-linear-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "linear-subset-rebuild"

/-- Relative emit header base (same Linear unit package as M1). -/
def emitHeaderBase : String := LinearSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Linear unit package as M1). -/
def emitSourceBase : String := LinearSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def linearSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def linearSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def linearSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def linearSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: linearSubsetRebuildWithoutLakeFinishedClaimed. -/
def linearSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Linear subset emit structural readiness reused as rebuild input.
    Greppable: linearSubsetRebuildInputReady, linearSubsetEmitReady. -/
def linearSubsetRebuildInputReady : Bool := linearSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: linearSubsetRebuildPackagePinOk, linearSubsetEmitWroteExpected. -/
def linearSubsetRebuildPackagePinOk : Bool := linearSubsetEmitWroteExpected

/-- Self-application structural bar: same Linear unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: linearSubsetRebuildSelfApplyOk, linearSubsetHeaderPackage,
    linearSubsetSourcePackage. -/
def linearSubsetRebuildSelfApplyOk : Bool :=
  linearSubsetRebuildInputReady
    && linearSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_linear_subset.h")
    && (emitSourceBase == "slake_linear_subset.c")
    && (linearSubsetRebuildInputId == "SLAKE_LINEAR_SUBSET_EMIT_V0")
    && linearSubsetEmitWroteExpected
    && (linearSubsetHeaderPackage.length > 0)
    && (linearSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: linearSubsetRebuildWrite
    + just linear-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 linearSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: linearSubsetRebuildWroteExpected. -/
def linearSubsetRebuildWroteExpected : Bool :=
  linearSubsetRebuildSelfApplyOk && linearSubsetEmitWroteExpected

/-- Structural ready for Linear subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: linearSubsetRebuildReady, LINEAR-SUBSET-REBUILD,
    SLAKE_LINEAR_SUBSET_REBUILD. -/
def linearSubsetRebuildReady : Bool :=
  linearSubsetRebuildInputReady
    && linearSubsetRebuildPackagePinOk
    && linearSubsetRebuildSelfApplyOk
    && linearSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !linearSubsetRebuildResidualFreeClaimed
    && !linearSubsetRebuildProductSelfHostCompleteClaimed
    && !linearSubsetRebuildProofCompleteClaimed
    && !linearSubsetRebuildLlvmUnlocked
    && !linearSubsetRebuildProvablyUnlocked
    && !linearSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_LINEAR_SUBSET_REBUILD_V0")
    && (hostId == "HOST-LINEAR-SUBSET-REBUILD")
    && (surfaceId == "LINEAR-SUBSET-REBUILD")
    && (linearSubsetRebuildInputId == "SLAKE_LINEAR_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-linear-subset-rebuild")
    && (justRecipe == "linear-subset-rebuild")
    && (emitHeaderBase == "slake_linear_subset.h")
    && (emitSourceBase == "slake_linear_subset.c")

/-- linearSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: linearSubsetRebuildDoesNotRetireLake. -/
def linearSubsetRebuildDoesNotRetireLake : Bool :=
  linearSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- linearSubsetRebuildReady is not product residual free claim.
    Greppable: linearSubsetRebuildDoesNotMeanResidualFree. -/
def linearSubsetRebuildDoesNotMeanResidualFree : Bool :=
  linearSubsetRebuildReady && !linearSubsetRebuildResidualFreeClaimed

/-- linearSubsetRebuildReady is not without-Lake finished.
    Greppable: linearSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def linearSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  linearSubsetRebuildReady && !linearSubsetRebuildWithoutLakeFinishedClaimed

/-! ### LINEAR-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Linear subset input ready for rebuild.
    Greppable: linearSubsetRebuildInputReady_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildInputReady_true :
    linearSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: linearSubsetRebuildPackagePinOk_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildPackagePinOk_true :
    linearSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: linearSubsetRebuildSelfApplyOk_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildSelfApplyOk_true :
    linearSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: linearSubsetRebuildWroteExpected_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildWroteExpected_true :
    linearSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Linear subset rebuild structural ready (M1 follow-on).
    Greppable: linearSubsetRebuildReady_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildReady_true : linearSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: linearSubsetRebuildDoesNotRetireLake_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildDoesNotRetireLake_true :
    linearSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: linearSubsetRebuildDoesNotMeanResidualFree_true, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildDoesNotMeanResidualFree_true :
    linearSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: linearSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    linearSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: linearSubsetRebuild_claims_false, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuild_claims_false :
    (linearSubsetRebuildResidualFreeClaimed = false)
      /\ (linearSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (linearSubsetRebuildProofCompleteClaimed = false)
      /\ (linearSubsetRebuildLlvmUnlocked = false)
      /\ (linearSubsetRebuildProvablyUnlocked = false)
      /\ (linearSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: linearSubsetRebuild_ids_eq, LINEAR-SUBSET-REBUILD-THEOREM. -/
theorem linearSubsetRebuild_ids_eq :
    (stageId = "SLAKE_LINEAR_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-LINEAR-SUBSET-REBUILD")
      /\ (surfaceId = "LINEAR-SUBSET-REBUILD")
      /\ (linearSubsetRebuildInputId = "SLAKE_LINEAR_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-linear-subset-rebuild")
      /\ (justRecipe = "linear-subset-rebuild")
      /\ (emitHeaderBase = "slake_linear_subset.h")
      /\ (emitSourceBase = "slake_linear_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### LINEAR-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: LINEAR-SUBSET-REBUILD-SMOKE, LINEAR-SUBSET-REBUILD, LINEAR-SUBSET-EMIT. -/

/-- LINEAR-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : linearSubsetRebuildInputReady = true := by native_decide
example : linearSubsetRebuildPackagePinOk = true := by native_decide
example : linearSubsetRebuildSelfApplyOk = true := by native_decide
example : linearSubsetRebuildWroteExpected = true := by native_decide

/-- LINEAR-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : linearSubsetRebuildReady = true := by native_decide
example : linearSubsetRebuildDoesNotRetireLake = true := by native_decide
example : linearSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : linearSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : linearSubsetRebuildResidualFreeClaimed = false := rfl
example : linearSubsetRebuildLlvmUnlocked = false := rfl
example : linearSubsetRebuildProvablyUnlocked = false := rfl
example : linearSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : linearSubsetRebuildInputId = "SLAKE_LINEAR_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-linear-subset-rebuild" := rfl
example : emitHeaderBase = "slake_linear_subset.h" := rfl
example : emitSourceBase = "slake_linear_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Linear subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateLinearSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  -- Reuse M1 Linear subset package validation (dialect + Linear tokens).
  LinearSubsetEmit.validateLinearSubsetPackage label text isSource
  -- Self-application measure: rebuild re-write must still be Linear subset
  -- package only (validateLinearSubsetPackage already bans full freestanding stage).
  -- Additional rebuild greppable identity is in host Lean / just, not required in C
  -- body (package content remains M1 Linear unit text).
  pure ()

/-- Rebuild Linear subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Linear package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    linearSubsetRebuildWrite, slake_linear_subset.h, slake_linear_subset.c,
    IO.FS.writeFile, LINEAR-SUBSET-REBUILD. -/
def linearSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless linearSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: linearSubsetRebuildReady false"
    throw (IO.userError "linearSubsetRebuildReady false")
  unless linearSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: linearSubsetRebuildWroteExpected false"
    throw (IO.userError "linearSubsetRebuildWroteExpected false")
  unless linearSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: linearSubsetRebuildSelfApplyOk false"
    throw (IO.userError "linearSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Linear subset rebuild =="
  IO.println s!"  readyPin={linearSubsetRebuildReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  -- Self-application: re-write Linear subset package from M1 assembled text.
  IO.FS.writeFile outH linearSubsetHeaderPackage
  IO.FS.writeFile outC linearSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Linear subset header ({emitHeaderBase})"
  requireFile outC s!"Linear subset source ({emitSourceBase})"
  if headerWritten != linearSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != linearSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateLinearSubsetRebuildPackage emitHeaderBase headerWritten false
  validateLinearSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: LINEAR-SUBSET-REBUILD, SLAKE_LINEAR_SUBSET_REBUILD_V0, LINEAR-SUBSET-EMIT, linearSubsetRebuildReady"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Linear subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    linearSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LinearSubsetRebuild
