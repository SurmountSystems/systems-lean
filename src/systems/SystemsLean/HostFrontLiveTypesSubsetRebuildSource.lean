/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live TypesSubsetRebuild.lean bytes.
  Module: SystemsLean.HostFrontLiveTypesSubsetRebuildSource
  liveRel is TypesSubsetRebuild.lean. Not FullHost. Not TypesSubsetRebuildMain.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveTypesSubsetRebuild

/-- Dual-pinned live TypesSubsetRebuild.lean bytes. -/
def liveTypesSubsetRebuildSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- Types subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Types subset package identity (typesSubsetEmitReady /
  typesSubsetEmitWroteExpected / slake_types_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Types unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Greppable: SYSTEMS_LEAN_HOST, TYPES-SUBSET-REBUILD, SLAKE_TYPES_SUBSET_REBUILD,
  SLAKE_TYPES_SUBSET_REBUILD_V0, HOST-TYPES-SUBSET-REBUILD, typesSubsetRebuildReady,
  typesSubsetRebuildInputReady, typesSubsetRebuildSelfApplyOk,
  typesSubsetRebuildWroteExpected, typesSubsetRebuildReady_true,
  TYPES-SUBSET-REBUILD-SMOKE, TYPES-SUBSET-REBUILD-THEOREM, TYPES-SUBSET-EMIT,
  typesSubsetEmitReady, typesSubsetEmitWroteExpected, slake-types-subset-rebuild,
  just types-subset-rebuild, slake_types_subset.h, slake_types_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, UNIT_SURFACE host surface,
  TYPED_IR_V0 (Types subset package dialect).
  Module: SystemsLean.TypesSubsetRebuild
  Short role name (not ProductPathFreestandingTypesSubsetRebuild kitchen-sink).
  Honesty dual evidence: typesSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe typesSubsetRebuildWrite (IO.FS.writeFile) plus just
  types-subset-rebuild greps on emit/slake_types_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.TypesSubsetRebuild;
  lake exe slake-types-subset-rebuild; just types-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.TypesSubsetEmit

namespace SystemsLean.TypesSubsetRebuild

open SystemsLean.TypesSubsetEmit

/-! ### TYPES-SUBSET-REBUILD / SLAKE_TYPES_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Types subset package identity (`typesSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Types unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Types subset rebuild). -/
def stageId : String := "SLAKE_TYPES_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-TYPES-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "TYPES-SUBSET-REBUILD"

/-- M1 Types subset package identity reused as rebuild input.
    Greppable: typesSubsetRebuildInputId, TYPES-SUBSET-EMIT, SLAKE_TYPES_SUBSET_EMIT_V0. -/
def typesSubsetRebuildInputId : String := TypesSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-types-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "types-subset-rebuild"

/-- Relative emit header base (same Types unit package as M1). -/
def emitHeaderBase : String := TypesSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Types unit package as M1). -/
def emitSourceBase : String := TypesSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def typesSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def typesSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def typesSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def typesSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: typesSubsetRebuildWithoutLakeFinishedClaimed. -/
def typesSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Types subset emit structural readiness reused as rebuild input.
    Greppable: typesSubsetRebuildInputReady, typesSubsetEmitReady. -/
def typesSubsetRebuildInputReady : Bool := typesSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: typesSubsetRebuildPackagePinOk, typesSubsetEmitWroteExpected. -/
def typesSubsetRebuildPackagePinOk : Bool := typesSubsetEmitWroteExpected

/-- Self-application structural bar: same Types unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: typesSubsetRebuildSelfApplyOk, typesSubsetHeaderPackage,
    typesSubsetSourcePackage. -/
def typesSubsetRebuildSelfApplyOk : Bool :=
  typesSubsetRebuildInputReady
    && typesSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_types_subset.h")
    && (emitSourceBase == "slake_types_subset.c")
    && (typesSubsetRebuildInputId == "SLAKE_TYPES_SUBSET_EMIT_V0")
    && typesSubsetEmitWroteExpected
    && (typesSubsetHeaderPackage.length > 0)
    && (typesSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: typesSubsetRebuildWrite
    + just types-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 typesSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: typesSubsetRebuildWroteExpected. -/
def typesSubsetRebuildWroteExpected : Bool :=
  typesSubsetRebuildSelfApplyOk && typesSubsetEmitWroteExpected

/-- Structural ready for Types subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: typesSubsetRebuildReady, TYPES-SUBSET-REBUILD,
    SLAKE_TYPES_SUBSET_REBUILD. -/
def typesSubsetRebuildReady : Bool :=
  typesSubsetRebuildInputReady
    && typesSubsetRebuildPackagePinOk
    && typesSubsetRebuildSelfApplyOk
    && typesSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !typesSubsetRebuildResidualFreeClaimed
    && !typesSubsetRebuildProductSelfHostCompleteClaimed
    && !typesSubsetRebuildProofCompleteClaimed
    && !typesSubsetRebuildLlvmUnlocked
    && !typesSubsetRebuildProvablyUnlocked
    && !typesSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_TYPES_SUBSET_REBUILD_V0")
    && (hostId == "HOST-TYPES-SUBSET-REBUILD")
    && (surfaceId == "TYPES-SUBSET-REBUILD")
    && (typesSubsetRebuildInputId == "SLAKE_TYPES_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-types-subset-rebuild")
    && (justRecipe == "types-subset-rebuild")
    && (emitHeaderBase == "slake_types_subset.h")
    && (emitSourceBase == "slake_types_subset.c")

/-- typesSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: typesSubsetRebuildDoesNotRetireLake. -/
def typesSubsetRebuildDoesNotRetireLake : Bool :=
  typesSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- typesSubsetRebuildReady is not product residual free claim.
    Greppable: typesSubsetRebuildDoesNotMeanResidualFree. -/
def typesSubsetRebuildDoesNotMeanResidualFree : Bool :=
  typesSubsetRebuildReady && !typesSubsetRebuildResidualFreeClaimed

/-- typesSubsetRebuildReady is not without-Lake finished.
    Greppable: typesSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def typesSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  typesSubsetRebuildReady && !typesSubsetRebuildWithoutLakeFinishedClaimed

/-! ### TYPES-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Types subset input ready for rebuild.
    Greppable: typesSubsetRebuildInputReady_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildInputReady_true :
    typesSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: typesSubsetRebuildPackagePinOk_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildPackagePinOk_true :
    typesSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: typesSubsetRebuildSelfApplyOk_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildSelfApplyOk_true :
    typesSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: typesSubsetRebuildWroteExpected_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildWroteExpected_true :
    typesSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Types subset rebuild structural ready (M1 follow-on).
    Greppable: typesSubsetRebuildReady_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildReady_true : typesSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: typesSubsetRebuildDoesNotRetireLake_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildDoesNotRetireLake_true :
    typesSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: typesSubsetRebuildDoesNotMeanResidualFree_true, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildDoesNotMeanResidualFree_true :
    typesSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: typesSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    typesSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: typesSubsetRebuild_claims_false, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuild_claims_false :
    (typesSubsetRebuildResidualFreeClaimed = false)
      /\ (typesSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (typesSubsetRebuildProofCompleteClaimed = false)
      /\ (typesSubsetRebuildLlvmUnlocked = false)
      /\ (typesSubsetRebuildProvablyUnlocked = false)
      /\ (typesSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: typesSubsetRebuild_ids_eq, TYPES-SUBSET-REBUILD-THEOREM. -/
theorem typesSubsetRebuild_ids_eq :
    (stageId = "SLAKE_TYPES_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-TYPES-SUBSET-REBUILD")
      /\ (surfaceId = "TYPES-SUBSET-REBUILD")
      /\ (typesSubsetRebuildInputId = "SLAKE_TYPES_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-types-subset-rebuild")
      /\ (justRecipe = "types-subset-rebuild")
      /\ (emitHeaderBase = "slake_types_subset.h")
      /\ (emitSourceBase = "slake_types_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### TYPES-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: TYPES-SUBSET-REBUILD-SMOKE, TYPES-SUBSET-REBUILD, TYPES-SUBSET-EMIT. -/

/-- TYPES-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : typesSubsetRebuildInputReady = true := by native_decide
example : typesSubsetRebuildPackagePinOk = true := by native_decide
example : typesSubsetRebuildSelfApplyOk = true := by native_decide
example : typesSubsetRebuildWroteExpected = true := by native_decide

/-- TYPES-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : typesSubsetRebuildReady = true := by native_decide
example : typesSubsetRebuildDoesNotRetireLake = true := by native_decide
example : typesSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : typesSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : typesSubsetRebuildResidualFreeClaimed = false := rfl
example : typesSubsetRebuildLlvmUnlocked = false := rfl
example : typesSubsetRebuildProvablyUnlocked = false := rfl
example : typesSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : typesSubsetRebuildInputId = "SLAKE_TYPES_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-types-subset-rebuild" := rfl
example : emitHeaderBase = "slake_types_subset.h" := rfl
example : emitSourceBase = "slake_types_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Types subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateTypesSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  -- Reuse M1 Types subset package validation (dialect + Types tokens).
  TypesSubsetEmit.validateTypesSubsetPackage label text isSource
  -- Self-application measure: rebuild re-write must still be Types subset
  -- package only (validateTypesSubsetPackage already bans full freestanding stage).
  -- Additional rebuild greppable identity is in host Lean / just, not required in C
  -- body (package content remains M1 Types unit text).
  pure ()

/-- Rebuild Types subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Types package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    typesSubsetRebuildWrite, slake_types_subset.h, slake_types_subset.c,
    IO.FS.writeFile, TYPES-SUBSET-REBUILD. -/
def typesSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless typesSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: typesSubsetRebuildReady false"
    throw (IO.userError "typesSubsetRebuildReady false")
  unless typesSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: typesSubsetRebuildWroteExpected false"
    throw (IO.userError "typesSubsetRebuildWroteExpected false")
  unless typesSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: typesSubsetRebuildSelfApplyOk false"
    throw (IO.userError "typesSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Types subset rebuild =="
  IO.println s!"  readyPin={typesSubsetRebuildReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  -- Self-application: re-write Types subset package from M1 assembled text.
  IO.FS.writeFile outH typesSubsetHeaderPackage
  IO.FS.writeFile outC typesSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Types subset header ({emitHeaderBase})"
  requireFile outC s!"Types subset source ({emitSourceBase})"
  if headerWritten != typesSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != typesSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateTypesSubsetRebuildPackage emitHeaderBase headerWritten false
  validateTypesSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: TYPES-SUBSET-REBUILD, SLAKE_TYPES_SUBSET_REBUILD_V0, TYPES-SUBSET-EMIT, typesSubsetRebuildReady"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Types subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    typesSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.TypesSubsetRebuild
"##

end SystemsLean.HostFrontLiveTypesSubsetRebuild

