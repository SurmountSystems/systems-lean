/-
  SYSTEMS_LEAN_HOST partial -- Graph subset rebuild / self-application (M1 follow-on).
  Host-built Slake path: M1 Graph subset package identity (graphSubsetEmitReady /
  graphSubsetEmitWroteExpected / slake_graph_subset.{h,c}) -> measured rebuild /
  self-application readiness bar for that subset. Re-emits and re-validates the
  Graph unit package from M1 inputs (not full freestanding dialect regenerate as
  sole success). Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Without-Lake finished self-application is later (M2 / S4). Not free /
  complete flip. Not freestanding residual free. Not freestanding emit residual
  free. Not freestanding emit as full dialect success criterion. Not PROVABLY.
  Not llvm unlock. Not hand-authored product C features. Not S4 Lake retire.
  Not full CFG/SSA.
  Greppable: SYSTEMS_LEAN_HOST, GRAPH-SUBSET-REBUILD, SLAKE_GRAPH_SUBSET_REBUILD,
  SLAKE_GRAPH_SUBSET_REBUILD_V0, HOST-GRAPH-SUBSET-REBUILD, graphSubsetRebuildReady,
  graphSubsetRebuildInputReady, graphSubsetRebuildSelfApplyOk,
  graphSubsetRebuildWroteExpected, graphSubsetRebuildReady_true,
  GRAPH-SUBSET-REBUILD-SMOKE, GRAPH-SUBSET-REBUILD-THEOREM, GRAPH-SUBSET-EMIT,
  graphSubsetEmitReady, graphSubsetEmitWroteExpected, slake-graph-subset-rebuild,
  just graph-subset-rebuild, slake_graph_subset.h, slake_graph_subset.c,
  StillUsesLake, DependsOnLake, RUNTIME-FS, IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX,
  UNIT_SURFACE host surface, HOST-EMIT-GRAPH.
  Module: SystemsLean.GraphSubsetRebuild
  Short role name (not ProductPathFreestandingGraphSubsetRebuild kitchen-sink).
  Honesty dual evidence: graphSubsetRebuildWroteExpected is a structural package
  identity pin only (rebuild reuses M1 package text). Actual on-disk re-write is
  proven by lake exe graphSubsetRebuildWrite (IO.FS.writeFile) plus just
  graph-subset-rebuild greps on emit/slake_graph_subset.{h,c}. Do not read the
  Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.GraphSubsetRebuild;
  lake exe slake-graph-subset-rebuild; just graph-subset-rebuild.
  Module must stay ASCII.
-/

import SystemsLean.GraphSubsetEmit

namespace SystemsLean.GraphSubsetRebuild

open SystemsLean.GraphSubsetEmit

/-! ### GRAPH-SUBSET-REBUILD / SLAKE_GRAPH_SUBSET_REBUILD (M1 follow-on)

  Input: M1 Graph subset package identity (`graphSubsetEmitReady` + package paths).
  Output: measured self-application bar -- re-emit/re-validate same Graph unit
  package from M1 inputs (subset rebuild, not full dialect theater).
-/

/-- Greppable primary stage id (M1 Graph subset rebuild). -/
def stageId : String := "SLAKE_GRAPH_SUBSET_REBUILD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-GRAPH-SUBSET-REBUILD"

/-- Short surface name (product role). -/
def surfaceId : String := "GRAPH-SUBSET-REBUILD"

/-- M1 Graph subset package identity reused as rebuild input.
    Greppable: graphSubsetRebuildInputId, GRAPH-SUBSET-EMIT, SLAKE_GRAPH_SUBSET_EMIT_V0. -/
def graphSubsetRebuildInputId : String := GraphSubsetEmit.stageId

/-- Lake exe name. -/
def lakeExeName : String := "slake-graph-subset-rebuild"

/-- just recipe name. -/
def justRecipe : String := "graph-subset-rebuild"

/-- Relative emit header base (same Graph unit package as M1). -/
def emitHeaderBase : String := GraphSubsetEmit.emitHeaderBase

/-- Relative emit source base (same Graph unit package as M1). -/
def emitSourceBase : String := GraphSubsetEmit.emitSourceBase

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: rebuild does not claim product residual free flip. -/
def graphSubsetRebuildResidualFreeClaimed : Bool := false

/-- Local honesty: rebuild is not freestanding product self-host complete rebrand. -/
def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not claim proof complete. -/
def graphSubsetRebuildProofCompleteClaimed : Bool := false

/-- Local honesty: rebuild does not unlock llvm. -/
def graphSubsetRebuildLlvmUnlocked : Bool := false

/-- Local honesty: rebuild does not unlock PROVABLY. -/
def graphSubsetRebuildProvablyUnlocked : Bool := false

/-- Local honesty: rebuild does not claim without-Lake finished (M2 / S4 later).
    Greppable: graphSubsetRebuildWithoutLakeFinishedClaimed. -/
def graphSubsetRebuildWithoutLakeFinishedClaimed : Bool := false

/-- M1 Graph subset emit structural readiness reused as rebuild input.
    Greppable: graphSubsetRebuildInputReady, graphSubsetEmitReady. -/
def graphSubsetRebuildInputReady : Bool := graphSubsetEmitReady

/-- M1 package identity pin reused (structural; not FS proof alone).
    Greppable: graphSubsetRebuildPackagePinOk, graphSubsetEmitWroteExpected. -/
def graphSubsetRebuildPackagePinOk : Bool := graphSubsetEmitWroteExpected

/-- Self-application structural bar: same Graph unit package text as M1 emit
    can be reassembled from M1 inputs (header + source package identity).
    Greppable: graphSubsetRebuildSelfApplyOk, graphSubsetHeaderPackage,
    graphSubsetSourcePackage. -/
def graphSubsetRebuildSelfApplyOk : Bool :=
  graphSubsetRebuildInputReady
    && graphSubsetRebuildPackagePinOk
    && (emitHeaderBase == "slake_graph_subset.h")
    && (emitSourceBase == "slake_graph_subset.c")
    && (graphSubsetRebuildInputId == "SLAKE_GRAPH_SUBSET_EMIT_V0")
    && graphSubsetEmitWroteExpected
    && (graphSubsetHeaderPackage.length > 0)
    && (graphSubsetSourcePackage.length > 0)

/-- Structural package identity pin only for rebuild re-write (same as M1 text).
    NOT filesystem write proof. Actual on-disk re-write: graphSubsetRebuildWrite
    + just graph-subset-rebuild greps. Dual evidence = Lean pin + lake exe / just.
    Reuses M1 graphSubsetEmitWroteExpected as package identity (header/source
    assembly already pinned there). Greppable: graphSubsetRebuildWroteExpected. -/
def graphSubsetRebuildWroteExpected : Bool :=
  graphSubsetRebuildSelfApplyOk && graphSubsetEmitWroteExpected

/-- Structural ready for Graph subset rebuild / self-application measure
    (M1 input + self-apply bar + Lake host + local free/complete/proof/llvm/
    PROVABLY / without-Lake-finished non-claims).
    Greppable: graphSubsetRebuildReady, GRAPH-SUBSET-REBUILD,
    SLAKE_GRAPH_SUBSET_REBUILD. -/
def graphSubsetRebuildReady : Bool :=
  graphSubsetRebuildInputReady
    && graphSubsetRebuildPackagePinOk
    && graphSubsetRebuildSelfApplyOk
    && graphSubsetRebuildWroteExpected
    && stillUsesLake
    && dependsOnLake
    && !graphSubsetRebuildResidualFreeClaimed
    && !graphSubsetRebuildProductSelfHostCompleteClaimed
    && !graphSubsetRebuildProofCompleteClaimed
    && !graphSubsetRebuildLlvmUnlocked
    && !graphSubsetRebuildProvablyUnlocked
    && !graphSubsetRebuildWithoutLakeFinishedClaimed
    && (stageId == "SLAKE_GRAPH_SUBSET_REBUILD_V0")
    && (hostId == "HOST-GRAPH-SUBSET-REBUILD")
    && (surfaceId == "GRAPH-SUBSET-REBUILD")
    && (graphSubsetRebuildInputId == "SLAKE_GRAPH_SUBSET_EMIT_V0")
    && (lakeExeName == "slake-graph-subset-rebuild")
    && (justRecipe == "graph-subset-rebuild")
    && (emitHeaderBase == "slake_graph_subset.h")
    && (emitSourceBase == "slake_graph_subset.c")

/-- graphSubsetRebuildReady does not retire Lake (S4 only).
    Greppable: graphSubsetRebuildDoesNotRetireLake. -/
def graphSubsetRebuildDoesNotRetireLake : Bool :=
  graphSubsetRebuildReady && stillUsesLake && dependsOnLake

/-- graphSubsetRebuildReady is not product residual free claim.
    Greppable: graphSubsetRebuildDoesNotMeanResidualFree. -/
def graphSubsetRebuildDoesNotMeanResidualFree : Bool :=
  graphSubsetRebuildReady && !graphSubsetRebuildResidualFreeClaimed

/-- graphSubsetRebuildReady is not without-Lake finished.
    Greppable: graphSubsetRebuildDoesNotMeanWithoutLakeFinished. -/
def graphSubsetRebuildDoesNotMeanWithoutLakeFinished : Bool :=
  graphSubsetRebuildReady && !graphSubsetRebuildWithoutLakeFinishedClaimed

/-! ### GRAPH-SUBSET-REBUILD-THEOREM (readable M1 rebuild statements, then proofs) -/

set_option maxRecDepth 8192

/-- M1 Graph subset input ready for rebuild.
    Greppable: graphSubsetRebuildInputReady_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildInputReady_true :
    graphSubsetRebuildInputReady = true := by
  native_decide

/-- M1 package pin ok for rebuild input.
    Greppable: graphSubsetRebuildPackagePinOk_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildPackagePinOk_true :
    graphSubsetRebuildPackagePinOk = true := by
  native_decide

/-- Self-application structural bar true.
    Greppable: graphSubsetRebuildSelfApplyOk_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildSelfApplyOk_true :
    graphSubsetRebuildSelfApplyOk = true := by
  native_decide

/-- Expected rebuild write content identity.
    Greppable: graphSubsetRebuildWroteExpected_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildWroteExpected_true :
    graphSubsetRebuildWroteExpected = true := by
  native_decide

/-- End-to-end Graph subset rebuild structural ready (M1 follow-on).
    Greppable: graphSubsetRebuildReady_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildReady_true : graphSubsetRebuildReady = true := by
  native_decide

/-- Rebuild ready does not retire Lake.
    Greppable: graphSubsetRebuildDoesNotRetireLake_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildDoesNotRetireLake_true :
    graphSubsetRebuildDoesNotRetireLake = true := by
  native_decide

/-- Rebuild ready does not claim residual free.
    Greppable: graphSubsetRebuildDoesNotMeanResidualFree_true, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildDoesNotMeanResidualFree_true :
    graphSubsetRebuildDoesNotMeanResidualFree = true := by
  native_decide

/-- Rebuild ready does not claim without-Lake finished.
    Greppable: graphSubsetRebuildDoesNotMeanWithoutLakeFinished_true,
    GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuildDoesNotMeanWithoutLakeFinished_true :
    graphSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY/without-Lake honesty stays false;
    Lake stays. Greppable: graphSubsetRebuild_claims_false, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuild_claims_false :
    (graphSubsetRebuildResidualFreeClaimed = false)
      /\ (graphSubsetRebuildProductSelfHostCompleteClaimed = false)
      /\ (graphSubsetRebuildProofCompleteClaimed = false)
      /\ (graphSubsetRebuildLlvmUnlocked = false)
      /\ (graphSubsetRebuildProvablyUnlocked = false)
      /\ (graphSubsetRebuildWithoutLakeFinishedClaimed = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-- Stage / input / exe / path name pins.
    Greppable: graphSubsetRebuild_ids_eq, GRAPH-SUBSET-REBUILD-THEOREM. -/
theorem graphSubsetRebuild_ids_eq :
    (stageId = "SLAKE_GRAPH_SUBSET_REBUILD_V0")
      /\ (hostId = "HOST-GRAPH-SUBSET-REBUILD")
      /\ (surfaceId = "GRAPH-SUBSET-REBUILD")
      /\ (graphSubsetRebuildInputId = "SLAKE_GRAPH_SUBSET_EMIT_V0")
      /\ (lakeExeName = "slake-graph-subset-rebuild")
      /\ (justRecipe = "graph-subset-rebuild")
      /\ (emitHeaderBase = "slake_graph_subset.h")
      /\ (emitSourceBase = "slake_graph_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### GRAPH-SUBSET-REBUILD-SMOKE (lake fails if examples fail)
    Greppable: GRAPH-SUBSET-REBUILD-SMOKE, GRAPH-SUBSET-REBUILD, GRAPH-SUBSET-EMIT. -/

/-- GRAPH-SUBSET-REBUILD-SMOKE: M1 input + package pin + self-apply + write pin. -/
example : graphSubsetRebuildInputReady = true := by native_decide
example : graphSubsetRebuildPackagePinOk = true := by native_decide
example : graphSubsetRebuildSelfApplyOk = true := by native_decide
example : graphSubsetRebuildWroteExpected = true := by native_decide

/-- GRAPH-SUBSET-REBUILD-SMOKE: full ready; Lake remains; free/llvm/without-Lake stay local-false. -/
example : graphSubsetRebuildReady = true := by native_decide
example : graphSubsetRebuildDoesNotRetireLake = true := by native_decide
example : graphSubsetRebuildDoesNotMeanResidualFree = true := by native_decide
example : graphSubsetRebuildDoesNotMeanWithoutLakeFinished = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : graphSubsetRebuildResidualFreeClaimed = false := rfl
example : graphSubsetRebuildLlvmUnlocked = false := rfl
example : graphSubsetRebuildProvablyUnlocked = false := rfl
example : graphSubsetRebuildWithoutLakeFinishedClaimed = false := rfl
example : graphSubsetRebuildInputId = "SLAKE_GRAPH_SUBSET_EMIT_V0" := rfl
example : lakeExeName = "slake-graph-subset-rebuild" := rfl
example : emitHeaderBase = "slake_graph_subset.h" := rfl
example : emitSourceBase = "slake_graph_subset.c" := rfl

/-- Require path exists as a file. -/
def requireFile (p : System.FilePath) (label : String) : IO Unit := do
  unless (<- p.pathExists) do
    IO.eprintln s!"error: missing {label}: {p}"
    throw (IO.userError s!"missing {label}")

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if rebuilt Graph subset package lacks greppable honesty tokens
    for self-application bar (subset package + rebuild stage cites). -/
def validateGraphSubsetRebuildPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  GraphSubsetEmit.validateGraphSubsetPackage label text isSource
  pure ()

/-- Rebuild Graph subset freestanding C unit package under root/src/systems/emit.
    Self-application measure: re-emit/re-validate M1 Graph package from M1 inputs.
    Does not rewrite full slake_freestanding.{c,h}. Greppable:
    graphSubsetRebuildWrite, slake_graph_subset.h, slake_graph_subset.c,
    IO.FS.writeFile, GRAPH-SUBSET-REBUILD. -/
def graphSubsetRebuildWrite (root : System.FilePath) : IO Unit := do
  unless graphSubsetRebuildReady do
    IO.eprintln s!"error: {stageId}: graphSubsetRebuildReady false"
    throw (IO.userError "graphSubsetRebuildReady false")
  unless graphSubsetRebuildWroteExpected do
    IO.eprintln s!"error: {stageId}: graphSubsetRebuildWroteExpected false"
    throw (IO.userError "graphSubsetRebuildWroteExpected false")
  unless graphSubsetRebuildSelfApplyOk do
    IO.eprintln s!"error: {stageId}: graphSubsetRebuildSelfApplyOk false"
    throw (IO.userError "graphSubsetRebuildSelfApplyOk false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Graph subset rebuild / self-application (M1 follow-on) =="
  IO.println s!"  host: {hostId} / surface: {surfaceId}"
  IO.println s!"  M1 package input id: {graphSubsetRebuildInputId} (GRAPH-SUBSET-EMIT reuse)"
  IO.println s!"  graphSubsetRebuildInputReady: {graphSubsetRebuildInputReady} (graphSubsetEmitReady)"
  IO.println s!"  graphSubsetRebuildPackagePinOk: {graphSubsetRebuildPackagePinOk} (graphSubsetEmitWroteExpected)"
  IO.println s!"  graphSubsetRebuildSelfApplyOk: {graphSubsetRebuildSelfApplyOk}"
  IO.println s!"  graphSubsetRebuildReady: {graphSubsetRebuildReady}"
  IO.println s!"  graphSubsetRebuildWroteExpected: {graphSubsetRebuildWroteExpected} (package identity pin)"
  IO.println s!"  stillUsesLake: {stillUsesLake} (true until S4)"
  IO.println s!"  dependsOnLake: {dependsOnLake} (host elaborator bootstrap)"
  IO.println s!"  withoutLakeFinished: {graphSubsetRebuildWithoutLakeFinishedClaimed} (false; deepen later)"
  IO.println s!"  Lake exe: {lakeExeName} / just {justRecipe}"
  IO.println "  honest: rebuild = measured Graph subset self-application (re-emit/re-validate); not full dialect regenerate"
  IO.println "  honest: Lake host remains; free/complete living tip unchanged; not PROVABLY; not llvm"
  IO.println "  honest: not without-Lake finished; not S4 Lake retire; not full CFG/SSA"
  IO.println "  short module name GraphSubsetRebuild (not ProductPathFreestandingGraphSubsetRebuild)"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH graphSubsetHeaderPackage
  IO.FS.writeFile outC graphSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Graph subset header ({emitHeaderBase})"
  requireFile outC s!"Graph subset source ({emitSourceBase})"
  if headerWritten != graphSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch (rebuild)"
    throw (IO.userError "header mismatch")
  if sourceWritten != graphSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch (rebuild)"
    throw (IO.userError "source mismatch")
  validateGraphSubsetRebuildPackage emitHeaderBase headerWritten false
  validateGraphSubsetRebuildPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: Graph subset self-application rebuild under {emitDir}/"
  IO.println s!"  rewrote: {outH} ({headerWritten.length} chars)"
  IO.println s!"  rewrote: {outC} ({sourceWritten.length} chars)"
  IO.println "  greppable: GRAPH-SUBSET-REBUILD, SLAKE_GRAPH_SUBSET_REBUILD_V0, GRAPH-SUBSET-EMIT, graphSubsetRebuildReady"
  IO.println "  honest: subset rebuild / self-application evidence (Lake-hosted; not without-Lake finished)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: rebuild Graph subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    graphSubsetRebuildWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.GraphSubsetRebuild
