/-
  SYSTEMS_LEAN_HOST partial -- Mult dominance frontier partial + algorithm deepen.
  Long-file split role from LlvmCfgFixture: multDominanceFrontierPartial and
  multDominanceFrontierDeepen.
  Structural DF table dual-pin remains. Deepen runs Cytron-style DF over Mult
  SSA edges + production idom table and dual-pins the result to the table.
  Mult-band fixed diamond only -- not a general multi-unit DF pipeline.
  DominanceClaimed stays false. Not production opt. Not full backend.
  Greppable: MULT-DOMINANCE-FRONTIER-PARTIAL, multDominanceFrontierPartial,
  MULT-DF-TABLE, multDfTable, MULT-DF-MERGE-JOIN, MULT-DF-TABLE-DUAL-PIN,
  MULT-DOMINANCE-FRONTIER-DEEPEN, multDominanceFrontierDeepen,
  MULT-DF-COMPUTED, multDfComputed, MULT-DF-ALGORITHM-OK, multDfAlgorithmOk,
  MULT-DF-CYTRON, multDfCytronFromJoin.
  Module: SystemsLean.LlvmCfgMultDf
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Same namespace SystemsLean.LlvmCfgFixture.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.LlvmCfgMultProduction

namespace SystemsLean.LlvmCfgFixture

/-! ### MULT-DOMINANCE-FRONTIER-PARTIAL (structural DF table dual-pin)

  Beyond Mult production CFG idom/phi dual-pin: fixed structural dominance
  frontier (DF) table for Mult SSA grade_tag diamond dual-pinned to
  slake_mult_ssa.ll. Classical DF honesty: merge is in DF(n) when n dominates
  a predecessor of merge but does not strictly dominate merge (grade arms +
  check nodes). Entry strictly dominates merge so entry is not listed.
  This is structural DF table dual-pin / honesty only -- NOT a general
  iterative DF algorithm over arbitrary graphs.
  llvmCfgFixtureDominanceClaimed stays false (full dominance pipeline unclaimed).
  Not production opt. Not full backend.
  Greppable: MULT-DOMINANCE-FRONTIER-PARTIAL, multDominanceFrontierPartial.
-/

/-- Structural Mult DF table: node:frontierMember (fixed diamond dual-pin).
    Greppable: multDfTable, MULT-DF-TABLE. -/
def multDfTable : List String :=
  [ "bb_mult0:merge"
  , "bb_mult1:merge"
  , "bb_omega:merge"
  , "bb_reject:merge"
  , "check1:merge"
  , "check2:merge"
  ]

/-- Merge is the sole DF join for Mult SSA grade arms and check nodes.
    Entry is excluded (strictly dominates merge via merge:entry idom).
    Greppable: multDfMergeIsJoin, MULT-DF-MERGE-JOIN. -/
def multDfMergeIsJoin : Bool :=
  (multDfTable.length == 6)
    && multDfTable.contains "bb_mult0:merge"
    && multDfTable.contains "bb_mult1:merge"
    && multDfTable.contains "bb_omega:merge"
    && multDfTable.contains "bb_reject:merge"
    && multDfTable.contains "check1:merge"
    && multDfTable.contains "check2:merge"
    && !(multDfTable.contains "entry:merge")
    && mergePhiPredsFour
    && mergeIdomIsEntry

/-- Dual-pin Mult DF table against Mult SSA CFG inventory and Mult SSA peer.
    Greppable: multDfTableDualPin, MULT-DF-TABLE-DUAL-PIN. -/
def multDfTableDualPin : Bool :=
  multDfMergeIsJoin
    && (multSsaCfgBlocks.length == 8)
    && (multSsaCfgEdges.length == 10)
    && (productionIdomTable.length == 7)
    && LlvmMultSsa.llvmMultSsaReady
    && LlvmMultSsa.llvmMultSsaPartialClaimed
    && !LlvmMultSsa.llvmMultSsaFullBackendClaimed
    && !LlvmMultSsa.llvmMultSsaCfgProductionClaimed

/-- just recipe name for Mult dominance frontier partial residual.
    Greppable: justRecipeMultDominanceFrontierPartial,
    mult-dominance-frontier-partial. -/
def justRecipeMultDominanceFrontierPartial : String :=
  "mult-dominance-frontier-partial"

/-- Mult dominance frontier partial: structural DF table dual-pin honesty.
    Greppable: multDominanceFrontierPartial, MULT-DOMINANCE-FRONTIER-PARTIAL.
    Does NOT flip llvmCfgFixtureDominanceClaimed (full DF pipeline stays false).
    Progressive pin independent of fixture tip fullBackend polarity (A-light).
    Production opt stays false. -/
def multDominanceFrontierPartial : Bool :=
  productionCfgDeepen
    && multDfTableDualPin
    && (justRecipeMultDominanceFrontierPartial == "mult-dominance-frontier-partial")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### MULT-DOMINANCE-FRONTIER-DEEPEN (Cytron-style Mult DF algorithm)

  Beyond the fixed structural table: compute DF rows from Mult SSA CFG edges
  and the production idom table using the classical multi-predecessor walk
  (Cytron-style: for each join with >=2 preds, walk runner from each pred up
  the idom chain until the join's idom, emitting node:join). Dual-pin the
  computed multiset against multDfTable (set equality). Still Mult-band fixed
  diamond only -- idom remains structural table; not general multi-unit DF;
  not arbitrary-graph dominance tree construction.
  DominanceClaimed stays false (full pipeline / multi-unit DF unclaimed).
  Greppable: MULT-DOMINANCE-FRONTIER-DEEPEN, multDominanceFrontierDeepen,
  MULT-DF-COMPUTED, multDfComputed, MULT-DF-ALGORITHM-OK, multDfAlgorithmOk,
  MULT-DF-CYTRON, multDfCytronFromJoin.
-/

/-- Parse Mult SSA edge label "src->tgt".
    Greppable: multDfParseEdge, MULT-DF-PARSE-EDGE. -/
def multDfParseEdge (e : String) : Option (Prod String String) :=
  match e.splitOn "->" with
  | [src, tgt] => some (src, tgt)
  | _ => none

/-- Parse idom row "block:idom".
    Greppable: multDfParseIdom, MULT-DF-PARSE-IDOM. -/
def multDfParseIdom (row : String) : Option (Prod String String) :=
  match row.splitOn ":" with
  | [b, i] => some (b, i)
  | _ => none

/-- Immediate dominator of a Mult SSA block from productionIdomTable.
    Entry is its own idom (root). Unknown falls back to entry.
    Greppable: multDfIdomOf, MULT-DF-IDOM-OF. -/
def multDfIdomOf (b : String) : String :=
  if b == "entry" then
    "entry"
  else
    let rec find : List String -> String
      | [] => "entry"
      | row :: rest =>
        match multDfParseIdom row with
        | some (blk, id) => if blk == b then id else find rest
        | none => find rest
    find productionIdomTable

/-- Immediate predecessors of tgt from Mult SSA CFG edges.
    Greppable: multDfPredsOf, MULT-DF-PREDS-OF. -/
def multDfPredsOf (tgt : String) : List String :=
  let rec go : List String -> List String
    | [] => []
    | e :: rest =>
      match multDfParseEdge e with
      | some (src, t) =>
        if t == tgt then src :: go rest else go rest
      | none => go rest
  go multSsaCfgEdges

/-- Walk idom chain from runner until stop, emitting node:join DF rows.
    Fuel-bounded for native_decide. Greppable: multDfWalkRunner. -/
def multDfWalkRunner (join stop runner : String) : List String :=
  let rec go (r : String) (fuel : Nat) : List String :=
    match fuel with
    | 0 => []
    | fuel' + 1 =>
      if r == stop then
        []
      else
        s!"{r}:{join}" :: go (multDfIdomOf r) fuel'
  go runner 16

/-- Cytron-style DF contribution of one multi-pred join (Mult diamond: merge).
    Greppable: multDfCytronFromJoin, MULT-DF-CYTRON. -/
def multDfCytronFromJoin (join : String) : List String :=
  let preds := multDfPredsOf join
  let stop := multDfIdomOf join
  if preds.length < 2 then
    []
  else
    preds.foldl (fun acc p => acc ++ multDfWalkRunner join stop p) []

/-- Dedup list preserving first occurrence (set-shape DF rows).
    Greppable: multDfDedup, MULT-DF-DEDUP. -/
def multDfDedup (xs : List String) : List String :=
  let rec go (seen acc : List String) : List String -> List String
    | [] => acc.reverse
    | x :: rest =>
      if seen.contains x then
        go seen acc rest
      else
        go (x :: seen) (x :: acc) rest
  go [] [] xs

/-- Mult DF computed from edges + idom over Mult SSA blocks (Cytron joins).
    Greppable: multDfComputed, MULT-DF-COMPUTED. -/
def multDfComputed : List String :=
  multDfDedup
    (multSsaCfgBlocks.foldl (fun acc b => acc ++ multDfCytronFromJoin b) [])

/-- Set equality for DF row lists (order-independent dual-pin).
    Greppable: multDfSetEq, MULT-DF-SET-EQ. -/
def multDfSetEq (a b : List String) : Bool :=
  a.length == b.length
    && a.all (fun x => b.contains x)
    && b.all (fun x => a.contains x)

/-- Computed Mult DF matches structural multDfTable (algorithm dual-pin).
    Entry is not a DF row (strict dominate of merge). Six merge-join rows.
    Greppable: multDfAlgorithmOk, MULT-DF-ALGORITHM-OK. -/
def multDfAlgorithmOk : Bool :=
  multDfSetEq multDfComputed multDfTable
    && (multDfComputed.length == 6)
    && !(multDfComputed.contains "entry:merge")
    && multDfComputed.contains "bb_mult0:merge"
    && multDfComputed.contains "bb_mult1:merge"
    && multDfComputed.contains "bb_omega:merge"
    && multDfComputed.contains "bb_reject:merge"
    && multDfComputed.contains "check1:merge"
    && multDfComputed.contains "check2:merge"
    && (multDfPredsOf "merge").length == 4
    && multDfIdomOf "merge" == "entry"
    && multDfIdomOf "bb_mult0" == "entry"
    && multDfIdomOf "check1" == "entry"
    && multDfIdomOf "check2" == "check1"

/-- just recipe name for Mult dominance frontier deepen residual.
    Greppable: justRecipeMultDominanceFrontierDeepen,
    mult-dominance-frontier-deepen. -/
def justRecipeMultDominanceFrontierDeepen : String :=
  "mult-dominance-frontier-deepen"

/-- Mult dominance frontier deepen: structural partial + Cytron algorithm dual-pin.
    Greppable: multDominanceFrontierDeepen, MULT-DOMINANCE-FRONTIER-DEEPEN.
    Does NOT flip llvmCfgFixtureDominanceClaimed:
    Mult-band fixed diamond + structural idom only; not multi-unit full DF pipeline.
    Production opt / band FullBackend stay false. -/
def multDominanceFrontierDeepen : Bool :=
  multDominanceFrontierPartial
    && multDfAlgorithmOk
    && (justRecipeMultDominanceFrontierDeepen == "mult-dominance-frontier-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

end SystemsLean.LlvmCfgFixture
