/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ComposeSubsetRebuild.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveComposeSubsetRebuildSource. Not occupancy name 50. Not mill 70.
  This wrap is ComposeSubsetRebuild.lean. It is not ComposeSubsetRebuildMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveComposeSubsetRebuildSource,
  HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveComposeSubsetRebuildSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveComposeSubsetRebuild

/-- Dual-pinned live ComposeSubsetRebuild.lean bytes (must match on-disk file).
    Greppable: liveComposeSubsetRebuildSource, HOST-FRONT-LIVE-COMPOSE-SUBSET-REBUILD. -/
def liveComposeSubsetRebuildSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Compose subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Compose subset package identity (composeSubsetEmitReady /
  composeSubsetEmitWroteExpected / slake_compose_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Compose unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Not full CFG/SSA. Not elaborator MULT-1 freestanding residual free.
  Greppable: SYSTEMS_LEAN_HOST, COMPOSE-SUBSET-REBUILD, SLAKE_COMPOSE_SUBSET_REBUILD,
  SLAKE_COMPOSE_SUBSET_REBUILD_V0, HOST-COMPOSE-SUBSET-REBUILD, composeSubsetRebuildReady,
  composeSubsetRebuildInputReady, composeSubsetRebuildSelfApplyOk,
  composeSubsetRebuildWroteExpected, composeSubsetRebuildReady_true,
  COMPOSE-SUBSET-REBUILD-SMOKE, COMPOSE-SUBSET-REBUILD-THEOREM, COMPOSE-SUBSET-EMIT,
  composeSubsetEmitReady, composeSubsetEmitWroteExpected, slake-compose-subset-rebuild,
  just compose-subset-rebuild, slake_compose_subset.h, slake_compose_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, HOST_COMPOSE_V0, IR_GRAPH_EDGES_V0,
  UNIT_SURFACE host surface, HOST-EMIT-COMPOSE.
  Module: SystemsLean.ComposeSubsetRebuild
  Short role name (not ProductPathFreestandingComposeSubsetRebuild kitchen-sink).
  Honesty dual evidence: composeSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe composeSubsetRebuildWrite (IO.FS.writeFile) plus just
  compose-subset-rebuild greps on emit/slake_compose_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.ComposeSubsetRebuild;
  lake exe slake-compose-subset-rebuild; just compose-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.ComposeSubsetEmit

namespace SystemsLean.ComposeSubsetRebuild

open SystemsLean.ComposeSubsetEmit

/-! ### COMPOSE-SUBSET-REBUILD / SLAKE_COMPOSE_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Compose subset package identity (`composeSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Compose unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Compose subset rebuild). -/
def stageId : String := "SLAKE_COMPOSE_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-COMPOSE-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "COMPOSE-SUBSET-REBUILD"

/-- M1 Compose subset package identity reused as rebuild input.
    Greppable: composeSubsetRebuildInputId, COMPOSE-SUBSET-EMIT, SLAKE_COMPOSE_SUBSET_EMIT_V0. -/
def composeSubsetRebuildInputId : String := ComposeSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-compose-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "compose-subset-rebuild"

/-- Relative emit header base (same Compose unit package as M1). -/
def emitHeaderBase : String := ComposeSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Compose unit package as M1). -/
def emitSourceBase : String := ComposeSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def composeSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def composeSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def composeSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def composeSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: composeSubsetRebuildWithoutLakeFinishedClaimed. -/
def composeSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Compose subset emit structural readiness reused as rebuild input.
    Greppable: composeSubsetRebuildInputReady, composeSubsetEmitReady. -/
def composeSubsetRebuildInputReady : Bool := composeSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: composeSubsetRebuildPackagePinOk, composeSubsetEmitWroteExpected. -/
def composeSubsetRebuildPackagePinOk : Bool := composeSubsetEmitWroteExpected

/-- Self-application structural bar: same Compose unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: composeSubsetRebuildSelfApplyOk, composeSubsetHeaderPackage,
    composeSubsetSourcePackage. -/
def composeSubsetRebuildSelfApplyOk : Bool :=
  composeSubsetRebuildInputReady
    && composeSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_compose_subset.h")
    && (emitSourceBase == "slake_compose_subset.c")
    && (composeSubsetRebuildInputId == "SLAKE_COMPOSE_SUBSET_EMIT_V0")
    && composeSubsetEmitWroteExpected
    && (composeSubsetHeaderPackage.length > 0)
    && (composeSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: composeSubsetRebuildWrite
    + just compose-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 composeSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: composeSubsetRebuildWroteExpected. -/
def composeSubsetRebuildWroteExpected : Bool :=
  composeSubsetRebuildSelfApplyOk && composeSubsetEmitWroteExpected

/-- Structural ready for Compose subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: composeSubsetRebuildReady, COMPOSE-SUBSET-REBUILD,
    SLAKE_COMPOSE_SUBSET_REBUILD. -/
def composeSubsetRebuildReady : Bool :=
  composeSubsetRebuildInputReady
    && composeSubsetRebuildPackagePinOk
    && composeSubsetRebuildSelfApplyOk
    && composeSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !composeSubsetRebuildResidualFreeClaimed
    && !composeSubsetRebuildProductSelfHostCompleteClaimed
    && !composeSubsetRebuildProofCompleteClaimed
    && !composeSubsetRebuildLlvmUnlocked
    && !composeSubsetRebuildProvablyUnlocked
    && !composeSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_COMPOSE_SUBSET_REBUILD_V0")
    && (hostId == "HOST-COMPOSE-SUBSET-REBUILD")
    && (surfaceId == "COMPOSE-SUBSET-REBUILD")
    && (composeSubsetRebuildInputId == "SLAKE_COMPOSE_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-compose-subset-rebuild")
    && (justRecipe == "compose-subset-rebuild")
    && (emitHeaderBase == "slake_compose_subset.h")
    && (emitSourceBase == "slake_compose_subset.c")

/-- composeSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: composeSubsetRebuildDoesNotRetireLake. -/
def composeSubsetRebuildDoesNotRetireLake : Bool :=
  composeSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- composeSubsetRebuildReady is not product residual free claim.
    Greppable: composeSubsetRebuildDoesNotMeanResidualFree. -/
def composeSubsetRebuildDoesNotMeanResidualFree : Bool :=
  composeSubsetRebuildReady && !composeSubsetRebuildResidualFreeClaimed

/-- composeSubsetRebuildReady is not without-Lake finished.
    Greppable: composeSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def composeSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  composeSubsetRebuildReady && !composeSubsetRebuildWithoutLakeFinishedClaimed

/-! ### COMPOSE-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Compose subset input ready for rebuild.
    Greppable: composeSubsetRebuildInputReady_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildInputReady_true :
    composeSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: composeSubsetRebuildPackagePinOk_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildPackagePinOk_true :
    composeSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: composeSubsetRebuildSelfApplyOk_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildSelfApplyOk_true :
    composeSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: composeSubsetRebuildWroteExpected_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildWroteExpected_true :
    composeSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Compose subset rebuild structural ready (M1 follow-on).
    Greppable: composeSubsetRebuildReady_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildReady_true : composeSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: composeSubsetRebuildDoesNotRetireLake_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildDoesNotRetireLake_true :
    composeSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: composeSubsetRebuildDoesNotMeanResidualFree_true, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildDoesNotMeanResidualFree_true :
    composeSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: composeSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    composeSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: composeSubsetRebuild_claims_false, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuild_claims_false :
    (composeSubsetRebuildResidualFreeClaimed = false)
      /\ (composeSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (composeSubsetRebuildProofCompleteClaimed = false)
      /\ (composeSubsetRebuildLlvmUnlocked = false)
      /\ (composeSubsetRebuildProvablyUnlocked = false)
      /\ (composeSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: composeSubsetRebuild_ids_eq, COMPOSE-SUBSET-REBUILD-THEOREM. -/
theorem composeSubsetRebuild_ids_eq :
    (stageId = "SLAKE_COMPOSE_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-COMPOSE-SUBSET-REBUILD")
      /\ (surfaceId = "COMPOSE-SUBSET-REBUILD")
      /\ (composeSubsetRebuildInputId = "SLAKE_COMPOSE_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-compose-subset-rebuild")
      /\ (justRecipe = "compose-subset-rebuild")
      /\ (emitHeaderBase = "slake_compose_subset.h")
      /\ (emitSourceBase = "slake_compose_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### COMPOSE-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: COMPOSE-SUBSET-REBUILD-SMOKE, COMPOSE-SUBSET-REBUILD, COMPOSE-SUBSET-EMIT. -/

/-- COMPOSE-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : composeSubsetRebuildInputReady = true := by native_decide
example : composeSubsetRebuildPackagePinOk = true := by native_decide
example : composeSubsetRebuildSelfApplyOk = true := by native_decide
example : composeSubsetRebuildWroteExpected = true := by native_decide

/-- COMPOSE-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : composeSubsetRebuildReady = true := by native_decide
example : composeSubsetRebuildDoesNotRetireLake = true := by native_decide
example : composeSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : composeSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : composeSubsetRebuildResidualFreeClaimed = false := rfl
example : composeSubsetRebuildLlvmUnlocked = false := rfl
example : composeSubsetRebuildProvablyUnlocked = false := rfl
example : composeSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : composeSubsetRebuildInputId = "SLAKE_COMPOSE_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-compose-subset-rebuild" := rfl
example : emitHeaderBase = "slake_compose_subset.h" := rfl
example : emitSourceBase = "slake_compose_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Compose subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateComposeSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  ComposeSubsetEmit.validateComposeSubsetPackage label text isSource
  pure ()

/-- Rebuild Compose subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Compose package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    composeSubsetRebuildWrite, slake_compose_subset.h, slake_compose_subset.c,
    IO.FS.writeFile, COMPOSE-SUBSET-REBUILD. -/
def composeSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless composeSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: composeSubsetRebuildReady false"
    throw (IO.userError "composeSubsetRebuildReady false")
  unless composeSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: composeSubsetRebuildWroteExpected false"
    throw (IO.userError "composeSubsetRebuildWroteExpected false")
  unless composeSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: composeSubsetRebuildSelfApplyOk false"
    throw (IO.userError "composeSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Compose subset rebuild =="
  IO.println s!"  readyPin={composeSubsetRebuildReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH composeSubsetHeaderPackage
  IO.FS.writeFile outC composeSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Compose subset header ({emitHeaderBase})"
  requireFile outC s!"Compose subset source ({emitSourceBase})"
  if headerWritten != composeSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != composeSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateComposeSubsetRebuildPackage emitHeaderBase headerWritten false
  validateComposeSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: COMPOSE-SUBSET-REBUILD, SLAKE_COMPOSE_SUBSET_REBUILD_V0, COMPOSE-SUBSET-EMIT, composeSubsetRebuildReady"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Compose subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    composeSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.ComposeSubsetRebuild
"#

end SystemsLean.HostFrontLiveComposeSubsetRebuild
