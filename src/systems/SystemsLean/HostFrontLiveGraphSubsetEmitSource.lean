/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live GraphSubsetEmit.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraphSubsetEmitSource. Not occupancy name 50. Not mill 70.
  This wrap is GraphSubsetEmit.lean. It is not GraphSubsetEmitMain.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveGraphSubsetEmitSource,
  HOST-FRONT-LIVE-GRAPH-SUBSET-EMIT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveGraphSubsetEmitSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. The live def graphSubsetEmitLlvmUnlocked stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveGraphSubsetEmit

/-- Dual-pinned live GraphSubsetEmit.lean bytes (must match on-disk file).
    Greppable: liveGraphSubsetEmitSource, HOST-FRONT-LIVE-GRAPH-SUBSET-EMIT. -/
def liveGraphSubsetEmitSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Graph subset freestanding emit (ideal ladder M1).
  Host-built Slake path: fixed Graph unit input (COMPILE-PATH-GRAPH /
  GRAPH-FIXTURE / graphFixtureCompilePathReady) -> write freestanding Graph
  unit package (header + body) under emit/, reusing HOST-EMIT-GRAPH dialect
  (EmitGraph fragments). Not full freestanding API dialect rewrite as sole
  success. Lake host remains (stillUsesLake / dependsOnLake true until S4).
  Not Graph subset rebuild (follow-on). Not S4 Lake retire. Not free/complete
  flip. Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit as full dialect success criterion.
  Not PROVABLY. Not llvm unlock. Not hand-authored product C features.
  Not full CFG/SSA.
  Greppable: SYSTEMS_LEAN_HOST, GRAPH-SUBSET-EMIT, SLAKE_GRAPH_SUBSET_EMIT,
  SLAKE_GRAPH_SUBSET_EMIT_V0, HOST-GRAPH-SUBSET-EMIT, graphSubsetEmitReady,
  graphSubsetEmitInputId, graphSubsetEmitWroteExpected, graphSubsetEmitReady_true,
  GRAPH-SUBSET-EMIT-SMOKE, GRAPH-SUBSET-EMIT-THEOREM, COMPILE-PATH-GRAPH,
  GRAPH-FIXTURE, SLAKE_GRAPH_SUBSET_GRAPH, HOST-EMIT-GRAPH, emitGraphReady,
  graphFixtureCompilePathReady, slake-graph-subset-emit, just graph-subset-emit,
  slake_graph_subset.h, slake_graph_subset.c, StillUsesLake, DependsOnLake,
  RUNTIME-FS, IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX, UNIT_SURFACE host surface.
  Module: SystemsLean.GraphSubsetEmit
  Short role name (not ProductPathFreestandingGraphSubset kitchen-sink).
  Honesty dual evidence: graphSubsetEmitWroteExpected is a structural package
  identity pin only (banner + Graph fragments equal expected assembly). Actual
  on-disk file write is proven by lake exe graphSubsetEmitWrite (IO.FS.writeFile)
  plus just graph-subset-emit greps on emit/slake_graph_subset.{h,c}. Do not
  read the Lean Bool alone as filesystem write proof.
  Red/green: lake build SystemsLean.GraphSubsetEmit; lake exe slake-graph-subset-emit;
  just graph-subset-emit. Module must stay ASCII.
-/

import SystemsLean.CompilePathGraph
import SystemsLean.EmitGraph

namespace SystemsLean.GraphSubsetEmit

open SystemsLean.CompilePath
open SystemsLean.EmitGraph

/-! ### GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT (ideal ladder M1)

  Input identity reuses COMPILE-PATH-GRAPH / GRAPH-FIXTURE structural
  readiness (`graphFixtureCompilePathReady`).
  Output: written Graph freestanding C unit package (header + body fragments
  from HOST-EMIT-GRAPH), not full slake_freestanding.{c,h} dialect regenerate.
-/

/-- Greppable primary stage id (ideal M1 Graph subset emit). -/
def stageId : String := "SLAKE_GRAPH_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-GRAPH-SUBSET-EMIT"

/-- Short surface name (product role). -/
def surfaceId : String := "GRAPH-SUBSET-EMIT"

/-- Graph unit input identity (COMPILE-PATH-GRAPH / GRAPH-FIXTURE content).
    Greppable: graphSubsetEmitInputId, SLAKE_GRAPH_SUBSET_GRAPH. -/
def graphSubsetEmitInputId : String := "SLAKE_GRAPH_SUBSET_GRAPH"

/-- Lake exe name. -/
def lakeExeName : String := "slake-graph-subset-emit"

/-- just recipe name. -/
def justRecipe : String := "graph-subset-emit"

/-- Relative emit header base (Graph unit package only). -/
def emitHeaderBase : String := "slake_graph_subset.h"

/-- Relative emit source base (Graph unit package only). -/
def emitSourceBase : String := "slake_graph_subset.c"

/-- Host elaborator still Lake (M1 under Lake; S4 only retires).
    Greppable: StillUsesLake, DependsOnLake. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true

/-- Local honesty: M1 does not claim product residual free flip. -/
def graphSubsetEmitResidualFreeClaimed : Bool := false

/-- Local honesty: M1 is not freestanding product self-host complete rebrand. -/
def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: M1 does not claim proof complete. -/
def graphSubsetEmitProofCompleteClaimed : Bool := false

/-- Local honesty: M1 does not unlock llvm. -/
def graphSubsetEmitLlvmUnlocked : Bool := false

/-- Local honesty: M1 does not unlock PROVABLY. -/
def graphSubsetEmitProvablyUnlocked : Bool := false

/-- Graph unit input structural readiness reused.
    Greppable: graphSubsetEmitInputReady, graphFixtureCompilePathReady. -/
def graphSubsetEmitInputReady : Bool := graphFixtureCompilePathReady

/-- HOST-EMIT-GRAPH dialect readiness (no second Graph dialect).
    Greppable: graphSubsetEmitGraphDialectOk, emitGraphReady, HOST-EMIT-GRAPH. -/
def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady

/-- Package banner (header) with greppable M1 honesty; Graph dialect follows. -/
def graphSubsetHeaderBanner : String :=
  "/* GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT_V0\n"
    ++ " * Host-built Graph subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_GRAPH_SUBSET_GRAPH (COMPILE-PATH-GRAPH / GRAPH-FIXTURE).\n"
    ++ " * Dialect: HOST-EMIT-GRAPH (EmitGraph; no second Graph dialect).\n"
    ++ " * Not full freestanding API dialect rewrite; Graph unit package only.\n"
    ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
    ++ " * RUNTIME-FS; IR_GRAPH_EDGES_V0; SLAKE_IR_EDGE_MAX; no product GC on this Graph subset package.\n"
    ++ " * Not full CFG/SSA.\n"
    ++ " */\n"
    ++ "\n"

/-- Package banner (source) with greppable M1 honesty; Graph body follows. -/
def graphSubsetSourceBanner : String :=
  "/* GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT_V0 body\n"
    ++ " * Host-built Graph subset freestanding C (ideal ladder M1).\n"
    ++ " * Input: SLAKE_GRAPH_SUBSET_GRAPH; dialect HOST-EMIT-GRAPH.\n"
    ++ " * Not full slake_freestanding.c regenerate; Graph unit only.\n"
    ++ " * RUNTIME-FS; IR_GRAPH_EDGES_V0; SLAKE_IR_EDGE_MAX; no product GC.\n"
    ++ " * Not full CFG/SSA.\n"
    ++ " */\n"
    ++ "\n"

/-- Graph subset header package text (banner + graphHeaderFragment).
    Greppable: graphSubsetHeaderPackage, slake_graph_subset.h. -/
def graphSubsetHeaderPackage : String :=
  graphSubsetHeaderBanner ++ graphHeaderFragment

/-- Graph subset source package text (banner + graphBodyFragment).
    Greppable: graphSubsetSourcePackage, slake_graph_subset.c. -/
def graphSubsetSourcePackage : String :=
  graphSubsetSourceBanner ++ graphBodyFragment

/-- Package text honesty: banners + Graph dialect pieces present.
    Greppable: graphSubsetEmitPackageOk. -/
def graphSubsetEmitPackageOk : Bool :=
  graphSubsetEmitGraphDialectOk
    && (emitHeaderBase == "slake_graph_subset.h")
    && (emitSourceBase == "slake_graph_subset.c")
    && (graphSubsetHeaderBanner
      == "/* GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT_V0\n"
        ++ " * Host-built Graph subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_GRAPH_SUBSET_GRAPH (COMPILE-PATH-GRAPH / GRAPH-FIXTURE).\n"
        ++ " * Dialect: HOST-EMIT-GRAPH (EmitGraph; no second Graph dialect).\n"
        ++ " * Not full freestanding API dialect rewrite; Graph unit package only.\n"
        ++ " * Lake host remains (StillUsesLake / DependsOnLake).\n"
        ++ " * RUNTIME-FS; IR_GRAPH_EDGES_V0; SLAKE_IR_EDGE_MAX; no product GC on this Graph subset package.\n"
        ++ " * Not full CFG/SSA.\n"
        ++ " */\n"
        ++ "\n")
    && (graphSubsetSourceBanner
      == "/* GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT_V0 body\n"
        ++ " * Host-built Graph subset freestanding C (ideal ladder M1).\n"
        ++ " * Input: SLAKE_GRAPH_SUBSET_GRAPH; dialect HOST-EMIT-GRAPH.\n"
        ++ " * Not full slake_freestanding.c regenerate; Graph unit only.\n"
        ++ " * RUNTIME-FS; IR_GRAPH_EDGES_V0; SLAKE_IR_EDGE_MAX; no product GC.\n"
        ++ " * Not full CFG/SSA.\n"
        ++ " */\n"
        ++ "\n")

/-- Structural ready for Graph subset emit (Graph fixture input + Graph
    dialect + package pins + Lake host + local free/complete/proof/llvm/PROVABLY
    non-claims).
    Greppable: graphSubsetEmitReady, GRAPH-SUBSET-EMIT, SLAKE_GRAPH_SUBSET_EMIT. -/
def graphSubsetEmitReady : Bool :=
  graphSubsetEmitInputReady
    && graphSubsetEmitGraphDialectOk
    && graphSubsetEmitPackageOk
    && stillUsesLake
    && dependsOnLake
    && !graphSubsetEmitResidualFreeClaimed
    && !graphSubsetEmitProductSelfHostCompleteClaimed
    && !graphSubsetEmitProofCompleteClaimed
    && !graphSubsetEmitLlvmUnlocked
    && !graphSubsetEmitProvablyUnlocked
    && (stageId == "SLAKE_GRAPH_SUBSET_EMIT_V0")
    && (hostId == "HOST-GRAPH-SUBSET-EMIT")
    && (surfaceId == "GRAPH-SUBSET-EMIT")
    && (graphSubsetEmitInputId == "SLAKE_GRAPH_SUBSET_GRAPH")
    && (lakeExeName == "slake-graph-subset-emit")
    && (justRecipe == "graph-subset-emit")

/-- graphSubsetEmitReady does not retire Lake (S4 only).
    Greppable: graphSubsetEmitDoesNotRetireLake. -/
def graphSubsetEmitDoesNotRetireLake : Bool :=
  graphSubsetEmitReady && stillUsesLake && dependsOnLake

/-- graphSubsetEmitReady is not product residual free claim.
    Greppable: graphSubsetEmitDoesNotMeanResidualFree. -/
def graphSubsetEmitDoesNotMeanResidualFree : Bool :=
  graphSubsetEmitReady && !graphSubsetEmitResidualFreeClaimed

/-- Structural package identity pin only: assembled Graph subset text equals
    banner + HOST-EMIT-GRAPH fragments. NOT filesystem write proof.
    Actual on-disk write: graphSubsetEmitWrite (IO.FS.writeFile) + post-read
    equality + validateGraphSubsetPackage; host gate just graph-subset-emit
    greps emit/slake_graph_subset.{h,c}. Dual evidence = Lean pin + lake exe /
    just. Greppable: graphSubsetEmitWroteExpected (structural package pin). -/
def graphSubsetEmitWroteExpected : Bool :=
  graphSubsetEmitPackageOk
    && (graphSubsetHeaderPackage == graphSubsetHeaderBanner ++ graphHeaderFragment)
    && (graphSubsetSourcePackage == graphSubsetSourceBanner ++ graphBodyFragment)

/-! ### GRAPH-SUBSET-EMIT-THEOREM (readable M1 statements, then proofs) -/

set_option maxRecDepth 8192

/-- Graph unit input ready for subset emit.
    Greppable: graphSubsetEmitInputReady_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitInputReady_true :
    graphSubsetEmitInputReady = true := by
  native_decide

/-- HOST-EMIT-GRAPH dialect ok for subset package.
    Greppable: graphSubsetEmitGraphDialectOk_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitGraphDialectOk_true :
    graphSubsetEmitGraphDialectOk = true := by
  native_decide

/-- Package banner + path honesty.
    Greppable: graphSubsetEmitPackageOk_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitPackageOk_true :
    graphSubsetEmitPackageOk = true := by
  native_decide

/-- Expected write content identity.
    Greppable: graphSubsetEmitWroteExpected_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitWroteExpected_true :
    graphSubsetEmitWroteExpected = true := by
  native_decide

/-- End-to-end Graph subset emit structural ready (ideal ladder M1).
    Greppable: graphSubsetEmitReady_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitReady_true : graphSubsetEmitReady = true := by
  native_decide

/-- M1 ready does not retire Lake.
    Greppable: graphSubsetEmitDoesNotRetireLake_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitDoesNotRetireLake_true :
    graphSubsetEmitDoesNotRetireLake = true := by
  native_decide

/-- M1 ready does not claim residual free.
    Greppable: graphSubsetEmitDoesNotMeanResidualFree_true, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmitDoesNotMeanResidualFree_true :
    graphSubsetEmitDoesNotMeanResidualFree = true := by
  native_decide

/-- Local free/complete/proof/llvm/PROVABLY honesty stays false; Lake stays.
    Greppable: graphSubsetEmit_claims_false, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmit_claims_false :
    (graphSubsetEmitResidualFreeClaimed = false)
      /\ (graphSubsetEmitProductSelfHostCompleteClaimed = false)
      /\ (graphSubsetEmitProofCompleteClaimed = false)
      /\ (graphSubsetEmitLlvmUnlocked = false)
      /\ (graphSubsetEmitProvablyUnlocked = false)
      /\ (stillUsesLake = true)
      /\ (dependsOnLake = true) :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl (And.intro rfl rfl)))))

/-- Stage / input / exe / path name pins.
    Greppable: graphSubsetEmit_ids_eq, GRAPH-SUBSET-EMIT-THEOREM. -/
theorem graphSubsetEmit_ids_eq :
    (stageId = "SLAKE_GRAPH_SUBSET_EMIT_V0")
      /\ (hostId = "HOST-GRAPH-SUBSET-EMIT")
      /\ (surfaceId = "GRAPH-SUBSET-EMIT")
      /\ (graphSubsetEmitInputId = "SLAKE_GRAPH_SUBSET_GRAPH")
      /\ (lakeExeName = "slake-graph-subset-emit")
      /\ (justRecipe = "graph-subset-emit")
      /\ (emitHeaderBase = "slake_graph_subset.h")
      /\ (emitSourceBase = "slake_graph_subset.c") :=
  And.intro rfl
    (And.intro rfl
      (And.intro rfl
        (And.intro rfl
          (And.intro rfl
            (And.intro rfl (And.intro rfl rfl))))))

/-! ### GRAPH-SUBSET-EMIT-SMOKE (lake fails if examples fail)
    Greppable: GRAPH-SUBSET-EMIT-SMOKE, GRAPH-SUBSET-EMIT, SLAKE_GRAPH_SUBSET_GRAPH. -/

/-- GRAPH-SUBSET-EMIT-SMOKE: Graph input + Graph dialect + package + write pin. -/
example : graphSubsetEmitInputReady = true := by native_decide
example : graphSubsetEmitGraphDialectOk = true := by native_decide
example : graphSubsetEmitPackageOk = true := by native_decide
example : graphSubsetEmitWroteExpected = true := by native_decide

/-- GRAPH-SUBSET-EMIT-SMOKE: full ready; Lake remains; free/llvm stay local-false. -/
example : graphSubsetEmitReady = true := by native_decide
example : graphSubsetEmitDoesNotRetireLake = true := by native_decide
example : graphSubsetEmitDoesNotMeanResidualFree = true := by native_decide
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : graphSubsetEmitResidualFreeClaimed = false := rfl
example : graphSubsetEmitLlvmUnlocked = false := rfl
example : graphSubsetEmitProvablyUnlocked = false := rfl
example : graphSubsetEmitInputId = "SLAKE_GRAPH_SUBSET_GRAPH" := rfl
example : lakeExeName = "slake-graph-subset-emit" := rfl
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

/-- Fail closed if written Graph subset package lacks greppable honesty tokens. -/
def validateGraphSubsetPackage (label : String) (text : String) (isSource : Bool) :
    IO Unit := do
  let need : List String :=
    [ "GRAPH-SUBSET-EMIT"
    , "SLAKE_GRAPH_SUBSET_EMIT_V0"
    , "SLAKE_GRAPH_SUBSET_GRAPH"
    , "HOST-EMIT-GRAPH"
    , "RUNTIME-FS"
    , "no product GC"
    , "IR_GRAPH_EDGES_V0"
    , "SLAKE_IR_EDGE_MAX"
    , "slake_ir_graph"
    , "slake_ir_graph_init"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if isSource then
    unless containsSub text "slake_ir_graph_add_edge" do
      IO.eprintln s!"error: {label}: missing slake_ir_graph_add_edge body"
      throw (IO.userError s!"{label}: missing add_edge body")
    unless containsSub text "slake_ir_graph_is_well_typed" do
      IO.eprintln s!"error: {label}: missing slake_ir_graph_is_well_typed body"
      throw (IO.userError s!"{label}: missing is_well_typed body")
  else
    unless containsSub text "typedef struct slake_ir_graph" do
      IO.eprintln s!"error: {label}: missing typedef struct slake_ir_graph"
      throw (IO.userError s!"{label}: missing ir_graph typedef")
  -- Fail closed: must not be full freestanding dialect package.
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected full freestanding emit stage (subset only)"
    throw (IO.userError s!"{label}: full dialect")

/-- Write Graph subset freestanding C unit package under root/src/systems/emit.
    Reuses Graph fixture input identity + HOST-EMIT-GRAPH fragments; does not
    rewrite full slake_freestanding.{c,h}. Greppable: graphSubsetEmitWrite,
    slake_graph_subset.h, slake_graph_subset.c, IO.FS.writeFile. -/
def graphSubsetEmitWrite (root : System.FilePath) : IO Unit := do
  unless graphSubsetEmitReady do
    IO.eprintln s!"error: {stageId}: graphSubsetEmitReady false"
    throw (IO.userError "graphSubsetEmitReady false")
  unless graphSubsetEmitWroteExpected do
    IO.eprintln s!"error: {stageId}: graphSubsetEmitWroteExpected false"
    throw (IO.userError "graphSubsetEmitWroteExpected false")
  let emitDir := root / "src" / "systems" / "emit"
  let outH := emitDir / emitHeaderBase
  let outC := emitDir / emitSourceBase
  IO.println s!"== {stageId}: Graph subset emit =="
  IO.println s!"  readyPin={graphSubsetEmitReady} stillUsesLake={stillUsesLake}"
  IO.FS.createDirAll emitDir
  IO.FS.writeFile outH graphSubsetHeaderPackage
  IO.FS.writeFile outC graphSubsetSourcePackage
  let headerWritten <- IO.FS.readFile outH
  let sourceWritten <- IO.FS.readFile outC
  requireFile outH s!"Graph subset header ({emitHeaderBase})"
  requireFile outC s!"Graph subset source ({emitSourceBase})"
  if headerWritten != graphSubsetHeaderPackage then
    IO.eprintln "error: header written content mismatch"
    throw (IO.userError "header mismatch")
  if sourceWritten != graphSubsetSourcePackage then
    IO.eprintln "error: source written content mismatch"
    throw (IO.userError "source mismatch")
  validateGraphSubsetPackage emitHeaderBase headerWritten false
  validateGraphSubsetPackage emitSourceBase sourceWritten true
  IO.println s!"GREEN {stageId}: wrote {outH} ({headerWritten.length}) {outC} ({sourceWritten.length})"
  IO.println "  greppable: GRAPH-SUBSET-EMIT, SLAKE_GRAPH_SUBSET_EMIT_V0, HOST-EMIT-GRAPH, IR_GRAPH_EDGES_V0"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Graph subset package under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    graphSubsetEmitWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.GraphSubsetEmit
"#

end SystemsLean.HostFrontLiveGraphSubsetEmit

