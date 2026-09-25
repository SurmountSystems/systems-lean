/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmCfgGeneral.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmCfgGeneralSource. Not occupancy name 50. Not mill 70.
  This wrap is LlvmCfgGeneral.lean. It is not LlvmCfgFixture.lean.
  Not an LLVM backend. FullBackend stays false in the wrap.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmCfgGeneralSource,
  HOST-FRONT-LIVE-LLVM-CFG-GENERAL, GENERAL-CFG-CONSTRUCTION-PARTIAL, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmCfgGeneralSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmCfgGeneralSource

/-- Dual-pinned live LlvmCfgGeneral.lean bytes (must match on-disk file).
    Greppable: liveLlvmCfgGeneralSource, HOST-FRONT-LIVE-LLVM-CFG-GENERAL. -/
def liveLlvmCfgGeneralSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- general program CFG + iterative CFG over IR.
  Beyond five hand-table unit diamonds: multi-unit compose chain + multi-merge
  inventory dual-pinned to Mult..Graph production CFG readiness and generator-
  owned unit SSA peers. Beyond fixed compose multi-merge inventory: iterative
  CFG construction by walking multi-node ordered IR program / IrGraph edges
  (KernelProgram three-node chain fixture), not Mult grade_tag diamond tables.
  Not full dominance pipeline. Not production opt. Progressive independent of
  fixture tip fullBackend polarity (A-light tip may be true).
  Greppable: GENERAL-CFG-CONSTRUCTION-PARTIAL, generalCfgConstructionPartial,
  general-program-cfg-partial, GENERAL-CFG-UNIT-ROOTS, generalCfgUnitRoots,
  GENERAL-CFG-COMPOSE-EDGES, generalCfgComposeEdges, GENERAL-CFG-MULTI-MERGE,
  generalCfgMultiMergeTable, generalCfgDualPin, GENERAL-CFG-DUAL-PIN,
  productionCfgUnitDiamondsOnlyClaimed, UNIT-DIAMONDS-ONLY,
  fullLlvmBarEvidencePartial, FULL-LLVM-BAR-EVIDENCE-PARTIAL,
  ITERATIVE-CFG, iterativeCfgConstructionPartial,
  iterative-cfg-construction-partial, ITERATIVE-CFG-CONSTRUCTION-PARTIAL,
  iterativeCfgBlocksFromProgram, iterativeCfgEdgesFromGraph,
  iterativeCfgDualPin, ITERATIVE-CFG-DUAL-PIN.
  Module: SystemsLean.LlvmCfgGeneral
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Same namespace SystemsLean.LlvmCfgFixture.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.LlvmCfgUnitProduction
import SystemsLean.LlvmCfgMultDf
import SystemsLean.LlvmComposeText
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.IrGraph
import SystemsLean.KernelProgram

namespace SystemsLean.LlvmCfgFixture

open SystemsLean.Types (IrNode NodeKind)
open SystemsLean.IrProgram (Program)
open SystemsLean.IrGraph (Graph Edge)

/-! ### GENERAL-CFG-CONSTRUCTION-PARTIAL (beyond unit diamonds)

  Unit diamonds alone (Mult grade_tag / Linear live_flag / Types kind_tag /
  Program push_status / Graph add_edge) are R1a..R1d success. This residual
  dual-pins a multi-unit compose CFG posture: ordered unit roots, compose-chain
  edges between bands, and a multi-merge table (five unit merges + compose exit).
  That shape is not a copy of any single unit diamond. Still not a general
  iterative CFG constructor over arbitrary multi-node IR.
  Progressive independent of tip fullBackend; production opt / DominanceClaimed
  stay false; band FullBackend stays false.
  Greppable: GENERAL-CFG-CONSTRUCTION-PARTIAL.
-/

/-- Ordered multi-unit CFG roots (band order Mult..Graph; not a unit diamond).
    Greppable: generalCfgUnitRoots, GENERAL-CFG-UNIT-ROOTS. -/
def generalCfgUnitRoots : List String :=
  [ "mult:grade_tag"
  , "linear:live_flag"
  , "types:kind_tag"
  , "program:push_status"
  , "graph:add_edge"
  ]

/-- Compose-chain edges between unit CFG roots (program-order multi-unit join).
    Greppable: generalCfgComposeEdges, GENERAL-CFG-COMPOSE-EDGES. -/
def generalCfgComposeEdges : List String :=
  [ "mult:grade_tag->linear:live_flag"
  , "linear:live_flag->types:kind_tag"
  , "types:kind_tag->program:push_status"
  , "program:push_status->graph:add_edge"
  ]

/-- Multi-merge inventory: five unit merges + compose exit (beyond one diamond).
    Greppable: generalCfgMultiMergeTable, GENERAL-CFG-MULTI-MERGE. -/
def generalCfgMultiMergeTable : List String :=
  [ "mult:merge"
  , "linear:merge"
  , "types:merge"
  , "program:merge"
  , "graph:merge"
  , "compose:exit"
  ]

/-- Sum of Mult..Graph unit diamond block inventories (multi-CFG join size).
    Greppable: generalCfgTotalUnitBlocks, GENERAL-CFG-TOTAL-UNIT-BLOCKS. -/
def generalCfgTotalUnitBlocks : Nat :=
  multSsaCfgBlocks.length
    + linearSsaCfgBlocks.length
    + typesSsaCfgBlocks.length
    + programSsaCfgBlocks.length
    + graphSsaCfgBlocks.length

/-- Multi-merge table has six named joins (five unit + compose exit).
    Greppable: generalCfgMultiMergeOk, GENERAL-CFG-MULTI-MERGE-OK. -/
def generalCfgMultiMergeOk : Bool :=
  (generalCfgMultiMergeTable.length == 6)
    && generalCfgMultiMergeTable.contains "mult:merge"
    && generalCfgMultiMergeTable.contains "linear:merge"
    && generalCfgMultiMergeTable.contains "types:merge"
    && generalCfgMultiMergeTable.contains "program:merge"
    && generalCfgMultiMergeTable.contains "graph:merge"
    && generalCfgMultiMergeTable.contains "compose:exit"
    && !(generalCfgMultiMergeTable.contains "entry:merge")

/-- Compose chain is a path of four edges over five unit roots (not a diamond).
    Greppable: generalCfgComposeChainOk, GENERAL-CFG-COMPOSE-CHAIN-OK. -/
def generalCfgComposeChainOk : Bool :=
  (generalCfgUnitRoots.length == 5)
    && (generalCfgComposeEdges.length == 4)
    && generalCfgComposeEdges.contains "mult:grade_tag->linear:live_flag"
    && generalCfgComposeEdges.contains "linear:live_flag->types:kind_tag"
    && generalCfgComposeEdges.contains "types:kind_tag->program:push_status"
    && generalCfgComposeEdges.contains "program:push_status->graph:add_edge"
    && (generalCfgTotalUnitBlocks == 34)

/-- Dual-pin general compose CFG against Mult..Graph multi-unit production + DF.
    Greppable: generalCfgDualPin, GENERAL-CFG-DUAL-PIN.
    Progressive; independent of fixture tip fullBackend polarity (A-light). -/
def generalCfgDualPin : Bool :=
  generalCfgComposeChainOk
    && generalCfgMultiMergeOk
    && multiUnitCfgProductionDeepenGraph
    && multDominanceFrontierPartial
    && LlvmComposeText.llvmComposeTextReady
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- just recipe name for general program CFG partial residual.
    Greppable: justRecipeGeneralProgramCfgPartial, general-program-cfg-partial. -/
def justRecipeGeneralProgramCfgPartial : String := "general-program-cfg-partial"

/-- General program CFG construction posture (beyond five unit diamonds only).
    Greppable: generalCfgConstructionPartial, GENERAL-CFG-CONSTRUCTION-PARTIAL.
    Progressive evidence pin; not a synonym of fixture tip fullBackend
    (A-light tip may be true while this partial stays true).
    Production opt / full dominance pipeline stay false. -/
def generalCfgConstructionPartial : Bool :=
  generalCfgDualPin
    && (justRecipeGeneralProgramCfgPartial == "general-program-cfg-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Unit-diamonds-only honesty: false when general dual-pin is green.
    Greppable: productionCfgUnitDiamondsOnlyClaimed, UNIT-DIAMONDS-ONLY.
    true would mean production CFG evidence is only the five hand-table diamonds.
    false after generalCfgConstructionPartial (compose multi-merge dual-pin). -/
def productionCfgUnitDiamondsOnlyClaimed : Bool := false

/-- Unit-diamonds-only pin agrees with general posture (false iff general green).
    Greppable: productionCfgUnitDiamondsOnlyHonesty,
    UNIT-DIAMONDS-ONLY-HONESTY. -/
def productionCfgUnitDiamondsOnlyHonesty : Bool :=
  (productionCfgUnitDiamondsOnlyClaimed == false)
    && generalCfgConstructionPartial

/-! ### ITERATIVE-CFG (walk multi-node IR / graph; beyond fixed compose inventory)

  generalCfgConstructionPartial dual-pins a fixed multi-unit compose multi-merge
  inventory. This residual constructs CFG blocks and edges by **iteratively
  walking** a multi-node ordered IR program + IrGraph edge list (KernelProgram
  lowerProgramGraph: three nodes ERASED/LINEAR/VALUE, chain edges 0->1, 1->2).
  Construction is fold/map over program nodes and graph edges -- not Mult
  grade_tag diamond hand tables and not a static five-root compose list alone.
  Greppable: ITERATIVE-CFG, ITERATIVE-CFG-CONSTRUCTION-PARTIAL.
  Progressive independent of tip fullBackend; production opt / DominanceClaimed
  stay false; band FullBackend stays false.
-/

/-- Block label from ordered IR node index + kind name.
    Greppable: iterativeCfgBlockLabel, ITERATIVE-CFG-BLOCK-LABEL. -/
def iterativeCfgBlockLabel (idx : Nat) (n : IrNode) : String :=
  s!"n{idx}:{n.kind.name}"

/-- Iteratively construct CFG block inventory by walking ordered IR program nodes.
    Not a hardcoded Mult grade_tag diamond table.
    Greppable: iterativeCfgBlocksFromProgram, ITERATIVE-CFG-BLOCKS-FROM-PROGRAM. -/
def iterativeCfgBlocksFromProgram (p : Program) : List String :=
  let rec go (i : Nat) (ns : List IrNode) : List String :=
    match ns with
    | [] => []
    | n :: rest => iterativeCfgBlockLabel i n :: go (i + 1) rest
  go 0 p.nodes

/-- Edge label from directed IR graph edge indices.
    Greppable: iterativeCfgEdgeLabel, ITERATIVE-CFG-EDGE-LABEL. -/
def iterativeCfgEdgeLabel (e : Edge) : String :=
  s!"n{e.fromIdx}->n{e.toIdx}"

/-- Iteratively construct CFG edges by walking IrGraph edges.
    Greppable: iterativeCfgEdgesFromGraph, ITERATIVE-CFG-EDGES-FROM-GRAPH. -/
def iterativeCfgEdgesFromGraph (g : Graph) : List String :=
  g.edges.map iterativeCfgEdgeLabel

/-- Multi-node IR graph fixture for iterative CFG (KernelProgram three-node chain).
    Greppable: iterativeCfgFixtureGraph, ITERATIVE-CFG-FIXTURE-GRAPH. -/
def iterativeCfgFixtureGraph : Option Graph :=
  KernelProgram.lowerProgramGraph

/-- CFG blocks produced by walking the multi-node fixture program.
    Greppable: iterativeCfgBlocks, ITERATIVE-CFG-BLOCKS. -/
def iterativeCfgBlocks : List String :=
  match iterativeCfgFixtureGraph with
  | some g => iterativeCfgBlocksFromProgram g.prog
  | none => []

/-- CFG edges produced by walking the multi-node fixture graph edges.
    Greppable: iterativeCfgEdges, ITERATIVE-CFG-EDGES. -/
def iterativeCfgEdges : List String :=
  match iterativeCfgFixtureGraph with
  | some g => iterativeCfgEdgesFromGraph g
  | none => []

/-- Expected dual-pin inventory for KernelProgram chain (not unit diamonds).
    Greppable: iterativeCfgExpectedBlocks, ITERATIVE-CFG-EXPECTED-BLOCKS. -/
def iterativeCfgExpectedBlocks : List String :=
  [ "n0:ERASED"
  , "n1:LINEAR"
  , "n2:VALUE"
  ]

/-- Expected dual-pin edges for KernelProgram chain 0->1, 1->2.
    Greppable: iterativeCfgExpectedEdges, ITERATIVE-CFG-EXPECTED-EDGES. -/
def iterativeCfgExpectedEdges : List String :=
  [ "n0->n1"
  , "n1->n2"
  ]

/-- Walk produces expected multi-node chain CFG; dual-pin KernelProgram graph path.
    Greppable: iterativeCfgWalkOk, ITERATIVE-CFG-WALK-OK. -/
def iterativeCfgWalkOk : Bool :=
  (iterativeCfgBlocks == iterativeCfgExpectedBlocks)
    && (iterativeCfgEdges == iterativeCfgExpectedEdges)
    && (iterativeCfgBlocks.length == 3)
    && (iterativeCfgEdges.length == 2)
    && KernelProgram.programGraphPathReady
    && (match iterativeCfgFixtureGraph with
        | some g =>
            IrGraph.isWellTyped g
              && IrGraph.nodeCount g == 3
              && IrGraph.edgeCount g == 2
              && IrProgram.isWellTyped g.prog
        | none => false)

/-- Dual-pin iterative walk vs multi-unit production + general compose posture.
    Greppable: iterativeCfgDualPin, ITERATIVE-CFG-DUAL-PIN.
    Progressive; independent of fixture tip fullBackend polarity (A-light). -/
def iterativeCfgDualPin : Bool :=
  iterativeCfgWalkOk
    && generalCfgConstructionPartial
    && multiUnitCfgProductionDeepenGraph
    && multDominanceFrontierPartial
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- just recipe name for iterative CFG construction partial residual.
    Greppable: justRecipeIterativeCfgConstructionPartial,
    iterative-cfg-construction-partial. -/
def justRecipeIterativeCfgConstructionPartial : String :=
  "iterative-cfg-construction-partial"

/-- Iterative CFG construction partial (walk multi-node IR / graph).
    Greppable: iterativeCfgConstructionPartial, ITERATIVE-CFG-CONSTRUCTION-PARTIAL,
    ITERATIVE-CFG.
    Progressive pin; independent of fixture tip fullBackend polarity (A-light).
    Production opt / full dominance pipeline stay false. -/
def iterativeCfgConstructionPartial : Bool :=
  iterativeCfgDualPin
    && (justRecipeIterativeCfgConstructionPartial
      == "iterative-cfg-construction-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Progressive Full LLVM bar evidence partial (R1e honesty readiness pin).
    True when multi-unit Mult..Graph CFG dual-pin + Mult DF partial + general
    compose CFG posture + iterative multi-node IR walk are green and production
    opt / full dominance stay false. Independent of fixture tip fullBackend
    polarity (Option A-light 2026-08-10): progressive rungs stay true when tip
    fullBackend is claimed. Path B: full DF pipeline is not required for bar (2)
    (`dominancePipelineRequiredForFullBackend` false). Short role name for
    progressive bar (1)-(3) + iterative partial + DF non-requirement + opt
    non-claim. Never a synonym of tip fullBackend; never alias of llvmUnlocked.
    Greppable: fullLlvmBarEvidencePartial, FULL-LLVM-BAR-EVIDENCE-PARTIAL. -/
def fullLlvmBarEvidencePartial : Bool :=
  multiUnitCfgProductionDeepenGraph
    && multDominanceFrontierPartial
    && generalCfgConstructionPartial
    && iterativeCfgConstructionPartial
    && (productionCfgUnitDiamondsOnlyClaimed == false)
    && (dominancePipelineRequiredForFullBackend == false)
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

end SystemsLean.LlvmCfgFixture
"#

end SystemsLean.HostFrontLiveLlvmCfgGeneralSource

namespace SystemsLean.HostFrontLiveLlvmCfgGeneral

/-- Same bytes, visible in the parser namespace. -/
def liveLlvmCfgGeneralSource : String :=
  SystemsLean.HostFrontLiveLlvmCfgGeneralSource.liveLlvmCfgGeneralSource

end SystemsLean.HostFrontLiveLlvmCfgGeneral
