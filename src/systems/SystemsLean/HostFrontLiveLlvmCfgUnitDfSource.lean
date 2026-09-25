/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmCfgUnitDf.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmCfgUnitDfSource. Not occupancy name 50. Not mill 70.
  This wrap is LlvmCfgUnitDf.lean. It is not LlvmCfg.lean.
  It is not LlvmCfgGeneral.lean and not a full LLVM backend.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmCfgUnitDfSource,
  HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmCfgUnitDfSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmCfgUnitDf

/-- Dual-pinned live LlvmCfgUnitDf.lean bytes (must match on-disk file).
    Greppable: liveLlvmCfgUnitDfSource, HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF. -/
def liveLlvmCfgUnitDfSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- multi-unit Linear..Graph DF deepen (N4).
  Long-file split role from LlvmCfgFixture: Linear/Types/Program/Graph
  dominance frontier dual-pins + multi-unit Mult..Graph join, beyond Mult-only
  multDominanceFrontierDeepen (R5 added Linear+Types; N4 adds Program+Graph).
  Structural DF tables + Cytron-style compute over unit SSA edges + production
  idom tables. Multi-unit fixture evidence only -- not proved general
  dominator-tree construction, not arbitrary-graph DF export, not
  DominanceClaimed. Band Mult..Graph FullBackend stays false.
  Greppable: LINEAR-DOMINANCE-FRONTIER-PARTIAL, linearDominanceFrontierPartial,
  LINEAR-DF-TABLE, linearDfTable, LINEAR-DOMINANCE-FRONTIER-DEEPEN,
  linearDominanceFrontierDeepen, linearDfComputed, linearDfAlgorithmOk,
  TYPES-DOMINANCE-FRONTIER-PARTIAL, typesDominanceFrontierPartial,
  TYPES-DF-TABLE, typesDfTable, TYPES-DOMINANCE-FRONTIER-DEEPEN,
  typesDominanceFrontierDeepen, typesDfComputed, typesDfAlgorithmOk,
  PROGRAM-DOMINANCE-FRONTIER-PARTIAL, programDominanceFrontierPartial,
  PROGRAM-DF-TABLE, programDfTable, PROGRAM-DOMINANCE-FRONTIER-DEEPEN,
  programDominanceFrontierDeepen, programDfComputed, programDfAlgorithmOk,
  GRAPH-DOMINANCE-FRONTIER-PARTIAL, graphDominanceFrontierPartial,
  GRAPH-DF-TABLE, graphDfTable, GRAPH-DOMINANCE-FRONTIER-DEEPEN,
  graphDominanceFrontierDeepen, graphDfComputed, graphDfAlgorithmOk,
  MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN, multiUnitDominanceFrontierDeepen,
  multi-unit-dominance-frontier-deepen, UNIT-DF-CYTRON, unitDfCytronFromJoin.
  Module: SystemsLean.LlvmCfgUnitDf
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Same namespace SystemsLean.LlvmCfgFixture.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.LlvmCfgMultDf
import SystemsLean.LlvmCfgUnitProduction

namespace SystemsLean.LlvmCfgFixture

/-! ### Shared unit DF Cytron helpers (parameterized over edges + idom table)

  Same walk shape as Mult multDf* helpers, parameterized so Linear and Types
  share one algorithm dual-pin path. Not a claim of proved general dominance.
  Greppable: UNIT-DF-CYTRON, unitDfCytronFromJoin, unitDfComputed.
-/

/-- Parse unit edge label "src->tgt". Greppable: unitDfParseEdge. -/
def unitDfParseEdge (e : String) : Option (Prod String String) :=
  match e.splitOn "->" with
  | [src, tgt] => some (src, tgt)
  | _ => none

/-- Parse idom row "block:idom". Greppable: unitDfParseIdom. -/
def unitDfParseIdom (row : String) : Option (Prod String String) :=
  match row.splitOn ":" with
  | [b, i] => some (b, i)
  | _ => none

/-- Immediate dominator from a structural idom table. Entry is root.
    Greppable: unitDfIdomOf. -/
def unitDfIdomOf (idomTable : List String) (b : String) : String :=
  if b == "entry" then
    "entry"
  else
    let rec find : List String -> String
      | [] => "entry"
      | row :: rest =>
        match unitDfParseIdom row with
        | some (blk, id) => if blk == b then id else find rest
        | none => find rest
    find idomTable

/-- Immediate predecessors of tgt from unit CFG edges.
    Greppable: unitDfPredsOf. -/
def unitDfPredsOf (edges : List String) (tgt : String) : List String :=
  let rec go : List String -> List String
    | [] => []
    | e :: rest =>
      match unitDfParseEdge e with
      | some (src, t) =>
        if t == tgt then src :: go rest else go rest
      | none => go rest
  go edges

/-- Walk idom chain from runner until stop, emitting node:join DF rows.
    Fuel-bounded for native_decide. Greppable: unitDfWalkRunner. -/
def unitDfWalkRunner (idomTable : List String) (join stop runner : String)
    : List String :=
  let rec go (r : String) (fuel : Nat) : List String :=
    match fuel with
    | 0 => []
    | fuel' + 1 =>
      if r == stop then
        []
      else
        s!"{r}:{join}" :: go (unitDfIdomOf idomTable r) fuel'
  go runner 16

/-- Cytron-style DF contribution of one multi-pred join.
    Greppable: unitDfCytronFromJoin, UNIT-DF-CYTRON. -/
def unitDfCytronFromJoin (edges idomTable : List String) (join : String)
    : List String :=
  let preds := unitDfPredsOf edges join
  let stop := unitDfIdomOf idomTable join
  if preds.length < 2 then
    []
  else
    preds.foldl
      (fun acc p => acc ++ unitDfWalkRunner idomTable join stop p) []

/-- Dedup list preserving first occurrence. Greppable: unitDfDedup. -/
def unitDfDedup (xs : List String) : List String :=
  let rec go (seen acc : List String) : List String -> List String
    | [] => acc.reverse
    | x :: rest =>
      if seen.contains x then
        go seen acc rest
      else
        go (x :: seen) (x :: acc) rest
  go [] [] xs

/-- DF computed from blocks + edges + idom (Cytron joins).
    Greppable: unitDfComputed. -/
def unitDfComputed (blocks edges idomTable : List String) : List String :=
  unitDfDedup
    (blocks.foldl
      (fun acc b => acc ++ unitDfCytronFromJoin edges idomTable b) [])

/-- Set equality for DF row lists. Greppable: unitDfSetEq. -/
def unitDfSetEq (a b : List String) : Bool :=
  a.length == b.length
    && a.all (fun x => b.contains x)
    && b.all (fun x => a.contains x)

/-! ### LINEAR-DOMINANCE-FRONTIER (structural + Cytron deepen)

  Linear SSA live_flag diamond: two merge preds (bb_live, bb_reject). Entry
  strictly dominates merge so entry is not a DF row. Beyond Mult-only DF.
  Greppable: LINEAR-DOMINANCE-FRONTIER-PARTIAL, LINEAR-DOMINANCE-FRONTIER-DEEPEN.
-/

/-- Structural Linear DF table: node:frontierMember.
    Greppable: linearDfTable, LINEAR-DF-TABLE. -/
def linearDfTable : List String :=
  [ "bb_live:merge"
  , "bb_reject:merge"
  ]

/-- Merge is the sole DF join for Linear live arms. Entry excluded.
    Greppable: linearDfMergeIsJoin, LINEAR-DF-MERGE-JOIN. -/
def linearDfMergeIsJoin : Bool :=
  (linearDfTable.length == 2)
    && linearDfTable.contains "bb_live:merge"
    && linearDfTable.contains "bb_reject:merge"
    && !(linearDfTable.contains "entry:merge")
    && linearMergePhiPredsTwo
    && linearMergeIdomIsEntry

/-- Dual-pin Linear DF table against Linear SSA CFG inventory.
    Greppable: linearDfTableDualPin, LINEAR-DF-TABLE-DUAL-PIN. -/
def linearDfTableDualPin : Bool :=
  linearDfMergeIsJoin
    && (linearSsaCfgBlocks.length == 4)
    && (linearSsaCfgEdges.length == 4)
    && (linearProductionIdomTable.length == 3)
    && LlvmLinearSsa.llvmLinearSsaReady
    && LlvmLinearSsa.llvmLinearSsaPartialClaimed
    && !LlvmLinearSsa.llvmLinearSsaFullBackendClaimed
    && !LlvmLinearSsa.llvmLinearSsaCfgProductionClaimed

/-- just recipe name for Linear DF partial residual.
    Greppable: justRecipeLinearDominanceFrontierPartial,
    linear-dominance-frontier-partial. -/
def justRecipeLinearDominanceFrontierPartial : String :=
  "linear-dominance-frontier-partial"

/-- Linear dominance frontier partial: structural DF table dual-pin.
    Greppable: linearDominanceFrontierPartial, LINEAR-DOMINANCE-FRONTIER-PARTIAL.
    Does NOT flip DominanceClaimed. -/
def linearDominanceFrontierPartial : Bool :=
  linearCfgProductionDeepen
    && linearDfTableDualPin
    && (justRecipeLinearDominanceFrontierPartial
      == "linear-dominance-frontier-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Linear DF computed via shared unit Cytron helpers.
    Greppable: linearDfComputed, LINEAR-DF-COMPUTED. -/
def linearDfComputed : List String :=
  unitDfComputed linearSsaCfgBlocks linearSsaCfgEdges linearProductionIdomTable

/-- Computed Linear DF matches structural table.
    Greppable: linearDfAlgorithmOk, LINEAR-DF-ALGORITHM-OK. -/
def linearDfAlgorithmOk : Bool :=
  unitDfSetEq linearDfComputed linearDfTable
    && (linearDfComputed.length == 2)
    && !(linearDfComputed.contains "entry:merge")
    && linearDfComputed.contains "bb_live:merge"
    && linearDfComputed.contains "bb_reject:merge"
    && (unitDfPredsOf linearSsaCfgEdges "merge").length == 2
    && unitDfIdomOf linearProductionIdomTable "merge" == "entry"
    && unitDfIdomOf linearProductionIdomTable "bb_live" == "entry"
    && unitDfIdomOf linearProductionIdomTable "bb_reject" == "entry"

/-- just recipe name for Linear DF deepen residual.
    Greppable: justRecipeLinearDominanceFrontierDeepen,
    linear-dominance-frontier-deepen. -/
def justRecipeLinearDominanceFrontierDeepen : String :=
  "linear-dominance-frontier-deepen"

/-- Linear DF deepen: structural partial + Cytron dual-pin.
    Greppable: linearDominanceFrontierDeepen, LINEAR-DOMINANCE-FRONTIER-DEEPEN.
    DominanceClaimed stays false. -/
def linearDominanceFrontierDeepen : Bool :=
  linearDominanceFrontierPartial
    && linearDfAlgorithmOk
    && (justRecipeLinearDominanceFrontierDeepen
      == "linear-dominance-frontier-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### TYPES-DOMINANCE-FRONTIER (structural + Cytron deepen)

  Types SSA kind_tag diamond: four merge preds + check1/check2 on idom walks.
  Same shape as Mult DF table (six merge-join rows). Beyond Mult+Linear.
  Greppable: TYPES-DOMINANCE-FRONTIER-PARTIAL, TYPES-DOMINANCE-FRONTIER-DEEPEN.
-/

/-- Structural Types DF table: node:frontierMember.
    Greppable: typesDfTable, TYPES-DF-TABLE. -/
def typesDfTable : List String :=
  [ "bb_value:merge"
  , "bb_linear:merge"
  , "bb_erased:merge"
  , "bb_reject:merge"
  , "check1:merge"
  , "check2:merge"
  ]

/-- Merge is the sole DF join for Types kind arms and check nodes.
    Greppable: typesDfMergeIsJoin, TYPES-DF-MERGE-JOIN. -/
def typesDfMergeIsJoin : Bool :=
  (typesDfTable.length == 6)
    && typesDfTable.contains "bb_value:merge"
    && typesDfTable.contains "bb_linear:merge"
    && typesDfTable.contains "bb_erased:merge"
    && typesDfTable.contains "bb_reject:merge"
    && typesDfTable.contains "check1:merge"
    && typesDfTable.contains "check2:merge"
    && !(typesDfTable.contains "entry:merge")
    && typesMergePhiPredsFour
    && typesMergeIdomIsEntry

/-- Dual-pin Types DF table against Types SSA CFG inventory.
    Greppable: typesDfTableDualPin, TYPES-DF-TABLE-DUAL-PIN. -/
def typesDfTableDualPin : Bool :=
  typesDfMergeIsJoin
    && (typesSsaCfgBlocks.length == 8)
    && (typesSsaCfgEdges.length == 10)
    && (typesProductionIdomTable.length == 7)
    && LlvmTypesSsa.llvmTypesSsaReady
    && LlvmTypesSsa.llvmTypesSsaPartialClaimed
    && !LlvmTypesSsa.llvmTypesSsaFullBackendClaimed
    && !LlvmTypesSsa.llvmTypesSsaCfgProductionClaimed

/-- just recipe name for Types DF partial residual.
    Greppable: justRecipeTypesDominanceFrontierPartial,
    types-dominance-frontier-partial. -/
def justRecipeTypesDominanceFrontierPartial : String :=
  "types-dominance-frontier-partial"

/-- Types dominance frontier partial: structural DF table dual-pin.
    Greppable: typesDominanceFrontierPartial, TYPES-DOMINANCE-FRONTIER-PARTIAL.
    Does NOT flip DominanceClaimed. -/
def typesDominanceFrontierPartial : Bool :=
  typesCfgProductionDeepen
    && typesDfTableDualPin
    && (justRecipeTypesDominanceFrontierPartial
      == "types-dominance-frontier-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Types DF computed via shared unit Cytron helpers.
    Greppable: typesDfComputed, TYPES-DF-COMPUTED. -/
def typesDfComputed : List String :=
  unitDfComputed typesSsaCfgBlocks typesSsaCfgEdges typesProductionIdomTable

/-- Computed Types DF matches structural table.
    Greppable: typesDfAlgorithmOk, TYPES-DF-ALGORITHM-OK. -/
def typesDfAlgorithmOk : Bool :=
  unitDfSetEq typesDfComputed typesDfTable
    && (typesDfComputed.length == 6)
    && !(typesDfComputed.contains "entry:merge")
    && typesDfComputed.contains "bb_value:merge"
    && typesDfComputed.contains "bb_linear:merge"
    && typesDfComputed.contains "bb_erased:merge"
    && typesDfComputed.contains "bb_reject:merge"
    && typesDfComputed.contains "check1:merge"
    && typesDfComputed.contains "check2:merge"
    && (unitDfPredsOf typesSsaCfgEdges "merge").length == 4
    && unitDfIdomOf typesProductionIdomTable "merge" == "entry"
    && unitDfIdomOf typesProductionIdomTable "bb_value" == "entry"
    && unitDfIdomOf typesProductionIdomTable "check1" == "entry"
    && unitDfIdomOf typesProductionIdomTable "check2" == "check1"

/-- just recipe name for Types DF deepen residual.
    Greppable: justRecipeTypesDominanceFrontierDeepen,
    types-dominance-frontier-deepen. -/
def justRecipeTypesDominanceFrontierDeepen : String :=
  "types-dominance-frontier-deepen"

/-- Types DF deepen: structural partial + Cytron dual-pin.
    Greppable: typesDominanceFrontierDeepen, TYPES-DOMINANCE-FRONTIER-DEEPEN.
    DominanceClaimed stays false. -/
def typesDominanceFrontierDeepen : Bool :=
  typesDominanceFrontierPartial
    && typesDfAlgorithmOk
    && (justRecipeTypesDominanceFrontierDeepen
      == "types-dominance-frontier-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### PROGRAM-DOMINANCE-FRONTIER (structural + Cytron deepen)

  Program SSA push-status diamond: four merge preds + check1/check2 (same
  Mult/Types join shape; names bb_ok/bb_bad/bb_full/bb_reject). Beyond
  Mult+Linear+Types DF (N4).
  Greppable: PROGRAM-DOMINANCE-FRONTIER-PARTIAL, PROGRAM-DOMINANCE-FRONTIER-DEEPEN.
-/

/-- Structural Program DF table: node:frontierMember.
    Greppable: programDfTable, PROGRAM-DF-TABLE. -/
def programDfTable : List String :=
  [ "bb_ok:merge"
  , "bb_bad:merge"
  , "bb_full:merge"
  , "bb_reject:merge"
  , "check1:merge"
  , "check2:merge"
  ]

/-- Merge is the sole DF join for Program push arms and check nodes.
    Greppable: programDfMergeIsJoin, PROGRAM-DF-MERGE-JOIN. -/
def programDfMergeIsJoin : Bool :=
  (programDfTable.length == 6)
    && programDfTable.contains "bb_ok:merge"
    && programDfTable.contains "bb_bad:merge"
    && programDfTable.contains "bb_full:merge"
    && programDfTable.contains "bb_reject:merge"
    && programDfTable.contains "check1:merge"
    && programDfTable.contains "check2:merge"
    && !(programDfTable.contains "entry:merge")
    && programMergePhiPredsFour
    && programMergeIdomIsEntry

/-- Dual-pin Program DF table against Program SSA CFG inventory.
    Greppable: programDfTableDualPin, PROGRAM-DF-TABLE-DUAL-PIN. -/
def programDfTableDualPin : Bool :=
  programDfMergeIsJoin
    && (programSsaCfgBlocks.length == 8)
    && (programSsaCfgEdges.length == 10)
    && (programProductionIdomTable.length == 7)
    && LlvmProgramSsa.llvmProgramSsaReady
    && LlvmProgramSsa.llvmProgramSsaPartialClaimed
    && !LlvmProgramSsa.llvmProgramSsaFullBackendClaimed
    && !LlvmProgramSsa.llvmProgramSsaCfgProductionClaimed

/-- just recipe name for Program DF partial residual.
    Greppable: justRecipeProgramDominanceFrontierPartial,
    program-dominance-frontier-partial. -/
def justRecipeProgramDominanceFrontierPartial : String :=
  "program-dominance-frontier-partial"

/-- Program dominance frontier partial: structural DF table dual-pin.
    Greppable: programDominanceFrontierPartial, PROGRAM-DOMINANCE-FRONTIER-PARTIAL.
    Does NOT flip DominanceClaimed. -/
def programDominanceFrontierPartial : Bool :=
  programCfgProductionDeepen
    && programDfTableDualPin
    && (justRecipeProgramDominanceFrontierPartial
      == "program-dominance-frontier-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Program DF computed via shared unit Cytron helpers.
    Greppable: programDfComputed, PROGRAM-DF-COMPUTED. -/
def programDfComputed : List String :=
  unitDfComputed programSsaCfgBlocks programSsaCfgEdges programProductionIdomTable

/-- Computed Program DF matches structural table.
    Greppable: programDfAlgorithmOk, PROGRAM-DF-ALGORITHM-OK. -/
def programDfAlgorithmOk : Bool :=
  unitDfSetEq programDfComputed programDfTable
    && (programDfComputed.length == 6)
    && !(programDfComputed.contains "entry:merge")
    && programDfComputed.contains "bb_ok:merge"
    && programDfComputed.contains "bb_bad:merge"
    && programDfComputed.contains "bb_full:merge"
    && programDfComputed.contains "bb_reject:merge"
    && programDfComputed.contains "check1:merge"
    && programDfComputed.contains "check2:merge"
    && (unitDfPredsOf programSsaCfgEdges "merge").length == 4
    && unitDfIdomOf programProductionIdomTable "merge" == "entry"
    && unitDfIdomOf programProductionIdomTable "bb_ok" == "entry"
    && unitDfIdomOf programProductionIdomTable "check1" == "entry"
    && unitDfIdomOf programProductionIdomTable "check2" == "check1"

/-- just recipe name for Program DF deepen residual.
    Greppable: justRecipeProgramDominanceFrontierDeepen,
    program-dominance-frontier-deepen. -/
def justRecipeProgramDominanceFrontierDeepen : String :=
  "program-dominance-frontier-deepen"

/-- Program DF deepen: structural partial + Cytron dual-pin.
    Greppable: programDominanceFrontierDeepen, PROGRAM-DOMINANCE-FRONTIER-DEEPEN.
    DominanceClaimed stays false. -/
def programDominanceFrontierDeepen : Bool :=
  programDominanceFrontierPartial
    && programDfAlgorithmOk
    && (justRecipeProgramDominanceFrontierDeepen
      == "program-dominance-frontier-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### GRAPH-DOMINANCE-FRONTIER (structural + Cytron deepen)

  Graph SSA addEdge-status diamond: three merge preds (bb_ok/bb_fail/bb_reject)
  + check1 on idom walks. Completes Mult..Graph unit DF dual-pin (N4).
  Greppable: GRAPH-DOMINANCE-FRONTIER-PARTIAL, GRAPH-DOMINANCE-FRONTIER-DEEPEN.
-/

/-- Structural Graph DF table: node:frontierMember.
    Greppable: graphDfTable, GRAPH-DF-TABLE. -/
def graphDfTable : List String :=
  [ "bb_ok:merge"
  , "bb_fail:merge"
  , "bb_reject:merge"
  , "check1:merge"
  ]

/-- Merge is the sole DF join for Graph addEdge arms and check1.
    Greppable: graphDfMergeIsJoin, GRAPH-DF-MERGE-JOIN. -/
def graphDfMergeIsJoin : Bool :=
  (graphDfTable.length == 4)
    && graphDfTable.contains "bb_ok:merge"
    && graphDfTable.contains "bb_fail:merge"
    && graphDfTable.contains "bb_reject:merge"
    && graphDfTable.contains "check1:merge"
    && !(graphDfTable.contains "entry:merge")
    && graphMergePhiPredsThree
    && graphMergeIdomIsEntry

/-- Dual-pin Graph DF table against Graph SSA CFG inventory.
    Greppable: graphDfTableDualPin, GRAPH-DF-TABLE-DUAL-PIN. -/
def graphDfTableDualPin : Bool :=
  graphDfMergeIsJoin
    && (graphSsaCfgBlocks.length == 6)
    && (graphSsaCfgEdges.length == 7)
    && (graphProductionIdomTable.length == 5)
    && LlvmGraphSsa.llvmGraphSsaReady
    && LlvmGraphSsa.llvmGraphSsaPartialClaimed
    && !LlvmGraphSsa.llvmGraphSsaFullBackendClaimed
    && !LlvmGraphSsa.llvmGraphSsaCfgProductionClaimed

/-- just recipe name for Graph DF partial residual.
    Greppable: justRecipeGraphDominanceFrontierPartial,
    graph-dominance-frontier-partial. -/
def justRecipeGraphDominanceFrontierPartial : String :=
  "graph-dominance-frontier-partial"

/-- Graph dominance frontier partial: structural DF table dual-pin.
    Greppable: graphDominanceFrontierPartial, GRAPH-DOMINANCE-FRONTIER-PARTIAL.
    Does NOT flip DominanceClaimed. -/
def graphDominanceFrontierPartial : Bool :=
  graphCfgProductionDeepen
    && graphDfTableDualPin
    && (justRecipeGraphDominanceFrontierPartial
      == "graph-dominance-frontier-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-- Graph DF computed via shared unit Cytron helpers.
    Greppable: graphDfComputed, GRAPH-DF-COMPUTED. -/
def graphDfComputed : List String :=
  unitDfComputed graphSsaCfgBlocks graphSsaCfgEdges graphProductionIdomTable

/-- Computed Graph DF matches structural table.
    Greppable: graphDfAlgorithmOk, GRAPH-DF-ALGORITHM-OK. -/
def graphDfAlgorithmOk : Bool :=
  unitDfSetEq graphDfComputed graphDfTable
    && (graphDfComputed.length == 4)
    && !(graphDfComputed.contains "entry:merge")
    && graphDfComputed.contains "bb_ok:merge"
    && graphDfComputed.contains "bb_fail:merge"
    && graphDfComputed.contains "bb_reject:merge"
    && graphDfComputed.contains "check1:merge"
    && (unitDfPredsOf graphSsaCfgEdges "merge").length == 3
    && unitDfIdomOf graphProductionIdomTable "merge" == "entry"
    && unitDfIdomOf graphProductionIdomTable "bb_ok" == "entry"
    && unitDfIdomOf graphProductionIdomTable "bb_fail" == "check1"
    && unitDfIdomOf graphProductionIdomTable "check1" == "entry"

/-- just recipe name for Graph DF deepen residual.
    Greppable: justRecipeGraphDominanceFrontierDeepen,
    graph-dominance-frontier-deepen. -/
def justRecipeGraphDominanceFrontierDeepen : String :=
  "graph-dominance-frontier-deepen"

/-- Graph DF deepen: structural partial + Cytron dual-pin.
    Greppable: graphDominanceFrontierDeepen, GRAPH-DOMINANCE-FRONTIER-DEEPEN.
    DominanceClaimed stays false. -/
def graphDominanceFrontierDeepen : Bool :=
  graphDominanceFrontierPartial
    && graphDfAlgorithmOk
    && (justRecipeGraphDominanceFrontierDeepen
      == "graph-dominance-frontier-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN (Mult..Graph)

  Multi-unit Mult + Linear + Types + Program + Graph DF Cytron dual-pin.
  Still NOT DominanceClaimed: structural idom tables per band (not a proved
  dominator-tree constructor), fixed unit diamonds only (not general
  arbitrary-graph DF export / multi-join production pipeline). Path B:
  dominancePipelineRequiredForFullBackend stays false. Band FullBackend false.
  Greppable: MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN,
  multiUnitDominanceFrontierDeepen, multi-unit-dominance-frontier-deepen.
-/

/-- just recipe name for multi-unit DF deepen residual.
    Greppable: justRecipeMultiUnitDominanceFrontierDeepen,
    multi-unit-dominance-frontier-deepen. -/
def justRecipeMultiUnitDominanceFrontierDeepen : String :=
  "multi-unit-dominance-frontier-deepen"

/-- Multi-unit Mult..Graph DF deepen join pin.
    Greppable: multiUnitDominanceFrontierDeepen,
    MULTI-UNIT-DOMINANCE-FRONTIER-DEEPEN.
    Requires Mult + Linear + Types + Program + Graph DF deepen.
    Does NOT flip llvmCfgFixtureDominanceClaimed (see module header why).
    Production opt / band FullBackend stay false. -/
def multiUnitDominanceFrontierDeepen : Bool :=
  multDominanceFrontierDeepen
    && linearDominanceFrontierDeepen
    && typesDominanceFrontierDeepen
    && programDominanceFrontierDeepen
    && graphDominanceFrontierDeepen
    && multiUnitCfgProductionDeepenGraph
    && (justRecipeMultiUnitDominanceFrontierDeepen
      == "multi-unit-dominance-frontier-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

end SystemsLean.LlvmCfgFixture
"#

end SystemsLean.HostFrontLiveLlvmCfgUnitDf
