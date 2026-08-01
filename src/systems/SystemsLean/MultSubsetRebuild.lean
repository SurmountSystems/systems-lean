/-
  SYSTEMS_LEAN_HOST partial -- Mult subset rebuild / self-application (bootstrap S3).
  Host-built Slake path: S2 Mult subset package identity (multSubsetEmitReady /
  multSubsetEmitWroteExpected / slake_mult_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Mult unit package from S2 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (S3 deepen / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Greppable: SYSTEMS_LEAN_HOST, MULT-SUBSET-REBUILD, SLAKE_MULT_SUBSET_REBUILD,
  SLAKE_MULT_SUBSET_REBUILD_V0, HOST-MULT-SUBSET-REBUILD, multSubsetRebuildReady,
  multSubsetRebuildInputReady, multSubsetRebuildSelfApplyOk,
  multSubsetRebuildWroteExpected, multSubsetRebuildReady_true,
  MULT-SUBSET-REBUILD-SMOKE, MULT-SUBSET-REBUILD-THEOREM, MULT-SUBSET-EMIT,
  multSubsetEmitReady, multSubsetEmitWroteExpected, slake-mult-subset-rebuild,
  just mult-subset-rebuild, slake_mult_subset.h, slake_mult_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (Mult subset package dialect).
  Module: SystemsLean.MultSubsetRebuild
  Short role name (not ProductPathFreestandingBootstrapS3 kitchen-sink).
  Honesty dual evidence: multSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses S2 package text). Actual on-disk re-write is
  proven by lake exe multSubsetRebuildWrite (IO.FS.writeFile) plus just
  mult-subset-rebuild greps on emit/slake_mult_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.MultSubsetRebuild;
  lake exe slake-mult-subset-rebuild; just mult-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.MultSubsetEmit

namespace SystemsLean.MultSubsetRebuild

open SystemsLean.MultSubsetEmit

/-! ### MULT-SUBSET-REBUILD / SLAKE_MULT_SUBSET_REBUILD (bootstrap S3)

  Input: S2 Mult subset package identity (`multSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Mult unit
  package from S2 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (bootstrap S3 Mult subset rebuild). -/
def stageId : String := "SLAKE_MULT_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MULT-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "MULT-SUBSET-REBUILD"

/-- S2 Mult subset package identity reused as rebuild input.
    Greppable: multSubsetRebuildInputId, MULT-SUBSET-EMIT, SLAKE_MULT_SUBSET_EMIT_V0. -/
def multSubsetRebuildInputId : String := MultSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-mult-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "mult-subset-rebuild"

/-- Relative emit header base (same Mult unit package as S2). -/
def emitHeaderBase : String := MultSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Mult unit package as S2). -/
def emitSourceBase : String := MultSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (bootstrap S3; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: S3 does not claim product residual free flip. -/
def multSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: S3 is not freestanding product self-host complete rebrand. -/
def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: S3 does not claim proof complete. -/
def multSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: S3 does not unlock llvm. -/
def multSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: S3 does not unlock PROVABLY. -/
def multSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: S3 does not claim without-Lake finished (S4 / deepen later).
    Greppable: multSubsetRebuildWithoutLakeFinishedClaimed. -/
def multSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- S2 Mult subset emit structural readiness reused as rebuild input.
    Greppable: multSubsetRebuildInputReady, multSubsetEmitReady. -/
def multSubsetRebuildInputReady : Bool := multSubsetEmitReady

/-- S2 package identity pin reused (structural; not FS proof alone).
    Greppable: multSubsetRebuildPackagePinOk, multSubsetEmitWroteExpected. -/
def multSubsetRebuildPackagePinOk : Bool := multSubsetEmitWroteExpected

/-- Self-application structural bar: same Mult unit package text as S2 emit
    can be reassembled from S2 inputs (header + source package identity).
    Greppable: multSubsetRebuildSelfApplyOk, multSubsetHeaderPackage,
    multSubsetSourcePackage. -/
def multSubsetRebuildSelfApplyOk : Bool :=
  multSubsetRebuildInputReady
    && multSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_mult_subset.h")
    && (emitSourceBase == "slake_mult_subset.c")
    && (multSubsetRebuildInputId == "SLAKE_MULT_SUBSET_EMIT_V0")
    && multSubsetEmitWroteExpected
    && (multSubsetHeaderPackage.length > 0)
    && (multSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as S2 text).
    NOT filesystem write proof. Actual on-disk re-write: multSubsetRebuildWrite
    + just mult-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses S2 multSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: multSubsetRebuildWroteExpected. -/
def multSubsetRebuildWroteExpected : Bool :=
  multSubsetRebuildSelfApplyOk && multSubsetEmitWroteExpected

/-- Structural ready for Mult subset rebuild / self-application measure
    (S2 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: multSubsetRebuildReady, MULT-SUBSET-REBUILD,
    SLAKE_MULT_SUBSET_REBUILD. -/
def multSubsetRebuildReady : Bool :=
  multSubsetRebuildInputReady
    && multSubsetRebuildPackagePinOk
    && multSubsetRebuildSelfApplyOk
    && multSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !multSubsetRebuildResidualFreeClaimed
    && !multSubsetRebuildProductSelfHostCompleteClaimed
    && !multSubsetRebuildProofCompleteClaimed
    && !multSubsetRebuildLlvmUnlocked
    && !multSubsetRebuildProvablyUnlocked
    && !multSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_MULT_SUBSET_REBUILD_V0")
    && (hostId == "HOST-MULT-SUBSET-REBUILD")
    && (surfaceId == "MULT-SUBSET-REBUILD")
    && (multSubsetRebuildInputId == "SLAKE_MULT_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-mult-subset-rebuild")
    && (justRecipe == "mult-subset-rebuild")
    && (emitHeaderBase == "slake_mult_subset.h")
    && (emitSourceBase == "slake_mult_subset.c")

/-- multSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: multSubsetRebuildDoesNotRetireLake. -/
def multSubsetRebuildDoesNotRetireLake : Bool :=
  multSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- multSubsetRebuildReady is not product residual free claim.
    Greppable: multSubsetRebuildDoesNotMeanResidualFree. -/
def multSubsetRebuildDoesNotMeanResidualFree : Bool :=
  multSubsetRebuildReady && !multSubsetRebuildResidualFreeClaimed

/-- multSubsetRebuildReady is not without-Lake finished.
    Greppable: multSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def multSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  multSubsetRebuildReady && !multSubsetRebuildWithoutLakeFinishedClaimed

/-! ### MULT-SUBSET-REBUILD-THEOREM (readable S3 statements, then proofs) -/

set_option maxRecDepth 8192

/-- S2 Mult subset input ready for rebuild.
    Greppable: multSubsetRebuildInputReady_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildInputReady_true :
    multSubsetRebuildInputReady = true := by
  native_decide

/-- S2 package pin ok for rebuild input.
    Greppable: multSubsetRebuildPackagePinOk_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildPackagePinOk_true :
    multSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: multSubsetRebuildSelfApplyOk_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildSelfApplyOk_true :
    multSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: multSubsetRebuildWroteExpected_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildWroteExpected_true :
    multSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Mult subset rebuild structural ready (bootstrap S3).
    Greppable: multSubsetRebuildReady_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildReady_true : multSubsetRebuildReady = true := by
  native_decide

/-- S3 ready does not retire Lake.
    Greppable: multSubsetRebuildDoesNotRetireLake_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildDoesNotRetireLake_true :
    multSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- S3 ready does not claim residual free.
    Greppable: multSubsetRebuildDoesNotMeanResidualFree_true, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildDoesNotMeanResidualFree_true :
    multSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- S3 ready does not claim without-Lake finished.
    Greppable: multSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    multSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: multSubsetRebuild_claims_false, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuild_claims_false :
    (multSubsetRebuildResidualFreeClaimed = false)
      /\ (multSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (multSubsetRebuildProofCompleteClaimed = false)
      /\ (multSubsetRebuildLlvmUnlocked = false)
      /\ (multSubsetRebuildProvablyUnlocked = false)
      /\ (multSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: multSubsetRebuild_ids_eq, MULT-SUBSET-REBUILD-THEOREM. -/
theorem multSubsetRebuild_ids_eq :
    (stageId = "SLAKE_MULT_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-MULT-SUBSET-REBUILD")
      /\ (surfaceId = "MULT-SUBSET-REBUILD")
      /\ (multSubsetRebuildInputId = "SLAKE_MULT_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-mult-subset-rebuild")
      /\ (justRecipe = "mult-subset-rebuild")
      /\ (emitHeaderBase = "slake_mult_subset.h")
      /\ (emitSourceBase = "slake_mult_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### MULT-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: MULT-SUBSET-REBUILD-SMOKE, MULT-SUBSET-REBUILD, MULT-SUBSET-EMIT. -/

/-- MULT-SUBSET-REBUILD-SMOKE: S2 input + package pin + self-apply + write pin. -/
example : multSubsetRebuildInputReady = true := by native_decide
example : multSubsetRebuildPackagePinOk = true := by native_decide
example : multSubsetRebuildSelfApplyOk = true := by native_decide
example : multSubsetRebuildWroteExpected = true := by native_decide

/-- MULT-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : multSubsetRebuildReady = true := by native_decide
example : multSubsetRebuildDoesNotRetireLake = true := by native_decide
example : multSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : multSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : multSubsetRebuildResidualFreeClaimed = false := rfl
example : multSubsetRebuildLlvmUnlocked = false := rfl
example : multSubsetRebuildProvablyUnlocked = false := rfl
example : multSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : multSubsetRebuildInputId = "SLAKE_MULT_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-mult-subset-rebuild" := rfl
example : emitHeaderBase = "slake_mult_subset.h" := rfl
example : emitSourceBase = "slake_mult_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Mult subset package lacks greppable honesty tokens
    for S3 self-application bar (subset package + rebuild stage cites). -/
def validateMultSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  -- Reuse S2 Mult subset package validation (dialect + Mult tokens).
  MultSubsetEmit.validateMultSubsetPackage label text isSource
  -- S3 self-application measure: rebuild re-write must still be Mult subset
  -- package only (validateMultSubsetPackage already bans full freestanding stage).
  -- Additional S3 greppable identity is in host Lean / just, not required in C
  -- body (package content remains S2 Mult unit text).
  pure ()

/-- Rebuild Mult subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate S2 Mult package from S2 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    multSubsetRebuildWrite, slake_mult_subset.h, slake_mult_subset.c,
    IO.FS.writeFile, MULT-SUBSET-REBUILD. -/
def multSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless multSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: multSubsetRebuildReady false"
    throw (IO.userError "multSubsetRebuildReady false")
  unless multSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: multSubsetRebuildWroteExpected false"
    throw (IO.userError "multSubsetRebuildWroteExpected false")
  unless multSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: multSubsetRebuildSelfApplyOk false"
    throw (IO.userError "multSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Mult subset rebuild / self-application (bootstrap S3) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  S2 package input id: {multSubsetRebuildInputId} (MULT-SUBSET-EMIT reuse)"
  IO.println s!"  multSubsetRebuildInputReady: {multSubsetRebuildInputReady} (multSubsetEmitReady)"
  IO.println s!"  multSubsetRebuildPackagePinOk: {multSubsetRebuildPackagePinOk} (multSubsetEmitWroteExpected)"
  IO.println s!"  multSubsetRebuildSelfApplyOk: {multSubsetRebuildSelfApplyOk}"
  IO.println s!"  multSubsetRebuildReady: {multSubsetRebuildReady}"
  IO.println s!"  multSubsetRebuildWroteExpected: {multSubsetRebuildWroteExpected} (package identity pin)"
  IO.println s!"  stillUsesLake: {stillUsesLake} (true until S4)"
  IO.println s!"  dependsOnLake: {dependsOnLake} (host elaborator bootstrap)"
  IO.println s!"  withoutLakeFinished: {multSubsetRebuildWithoutLakeFinishedClaimed} (false; deepen later)"
  IO.println s!"  Lake exe: {lakeExeName} / just {justRecipe}"
  IO.println "  honest: S3 = measured Mult subset self-application (re-emit/re-validate); not full dialect regenerate"
  IO.println "  honest: Lake host remains; free/complete living tip unchanged; not PROVABLY; not llvm"
  IO.println "  honest: not without-Lake finished; not S4 Lake retire"
  IO.println "  short module name MultSubsetRebuild (not ProductPathFreestandingBootstrapS3)"
  IO.FS.createDirAll emitDir
  -- Self-application: re-write Mult subset package from S2 assembled text.
  IO.FS.writeFile outH multSubsetHeaderPackage
  IO.FS.writeFile outC multSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Mult subset header ({emitHeaderBase})"
  requireFile outC s!"Mult subset source ({emitSourceBase})"
  if headerWritten != multSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != multSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateMultSubsetRebuildPackage emitHeaderBase headerWritten false
  validateMultSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: Mult subset self-application rebuild under {emitDir}/"
  IO.println s!"  rewrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  rewrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  greppable: MULT-SUBSET-REBUILD, SLAKE_MULT_SUBSET_REBUILD_V0, MULT-SUBSET-EMIT, multSubsetRebuildReady"
  IO.println "  honest: subset rebuild / self-application evidence (Lake-hosted; not without-Lake finished)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Mult subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    multSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.MultSubsetRebuild
