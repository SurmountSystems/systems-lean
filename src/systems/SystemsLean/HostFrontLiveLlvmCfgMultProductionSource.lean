/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmCfgMultProduction.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmCfgMultProductionSource. Not occupancy name 50.
  Not mill 70. This wrap is LlvmCfgMultProduction.lean.
  It is not LlvmCfgFixture.lean. It is not LlvmHold.lean.
  Not an LLVM backend. FullBackend stays false. FullHost stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmCfgMultProductionSource,
  HOST-FRONT-LIVE-LLVM-CFG-MULT-PRODUCTION, LLVM-CFG-MULT-PRODUCTION,
  liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmCfgMultProductionSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmCfgMultProduction

/-- Dual-pinned live LlvmCfgMultProduction.lean bytes (must match on-disk file).
    Greppable: liveLlvmCfgMultProductionSource, LLVM-CFG-MULT-PRODUCTION. -/
def liveLlvmCfgMultProductionSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult structural CFG + Mult SSA production dual-pin.
  Long-file split role from LlvmCfgFixture: Mult band productionCfgDeepen.
  Not full dominance pipeline. Not production opt. Not full backend.
  Greppable: PRODUCTION-CFG-DEEPEN, productionCfgDeepen, MULT-SSA-CFG-DUAL-PIN,
  MERGE-PHI-PREDS-FOUR, MERGE-IDOM-ENTRY, PRODUCTION-IDOM, CFG-DEEPEN-PARTIAL,
  multSsaCfgBlocks, multSsaCfgEdges, productionIdomTable.
  Module: SystemsLean.LlvmCfgMultProduction
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Same namespace SystemsLean.LlvmCfgFixture.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.LlvmCfgHonesty
import SystemsLean.LlvmMultSsa

namespace SystemsLean.LlvmCfgFixture

/-- Named Mult CFG blocks (fixture inventory only; not production IR write).
    Greppable: cfgBlocks, entry, bb_accept, bb_reject, merge. -/
def cfgBlocks : List String :=
  ["entry", "bb_check1", "bb_check2", "bb_accept", "bb_reject", "merge"]

/-- CFG edge inventory (source -> target pairs as greppable strings). -/
def cfgEdges : List String :=
  [ "entry->bb_check1"
  , "entry->bb_accept"
  , "bb_check1->bb_check2"
  , "bb_check1->bb_accept"
  , "bb_check2->bb_accept"
  , "bb_check2->bb_reject"
  , "bb_accept->merge"
  , "bb_reject->merge"
  ]

/-- Entry dominates every named block (structural Mult fixture honesty).
    Greppable: entryDominatesAll. -/
def entryDominatesAll : Bool :=
  cfgBlocks.length == 6
    && (cfgBlocks.head? == some "entry")
    && (cfgEdges.length == 8)

/-- Immediate predecessors of merge are only accept and reject (structural).
    Named deepen step beyond entryDominatesAll; not production dominance frontier.
    Greppable: mergePredsOnlyAcceptReject, CFG-MERGE-PREDS. -/
def mergePredsOnlyAcceptReject : Bool :=
  (cfgEdges.contains "bb_accept->merge")
    && (cfgEdges.contains "bb_reject->merge")
    && !(cfgEdges.contains "entry->merge")
    && !(cfgEdges.contains "bb_check1->merge")
    && !(cfgEdges.contains "bb_check2->merge")

/-- Accept and reject are both reachable from entry (structural path honesty).
    Greppable: acceptRejectReachableFromEntry. -/
def acceptRejectReachableFromEntry : Bool :=
  (cfgEdges.contains "entry->bb_check1" || cfgEdges.contains "entry->bb_accept")
    && (cfgEdges.contains "bb_accept->merge")
    && (cfgEdges.contains "bb_reject->merge")
    && (cfgEdges.contains "bb_check2->bb_reject" || cfgEdges.contains "bb_check1->bb_accept")

/-- Named deepen pin: merge preds + reachability (still not production DF pipeline).
    Greppable: cfgDeepenPartial, CFG-DEEPEN-PARTIAL. -/
def cfgDeepenPartial : Bool :=
  mergePredsOnlyAcceptReject
    && acceptRejectReachableFromEntry
    && entryDominatesAll
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed

/-! ### PRODUCTION-CFG-DEEPEN (Mult SSA grade_tag dual-pin)

  Beyond structural cfgDeepenPartial: model the Mult SSA grade_tag CFG that
  generator-owned out/llvm-ir/slake_mult_ssa.ll actually emits (entry/check/
  grade arms/merge), structural immediate dominators, and four-pred merge phi
  honesty. Still Mult-band only. Not full dominance construction over
  arbitrary graphs. Not production opt. Not full backend.
-/

/-- Mult SSA grade_tag blocks (match slake_mult_ssa.ll labels).
    Greppable: multSsaCfgBlocks, MULT-SSA-CFG-BLOCKS. -/
def multSsaCfgBlocks : List String :=
  [ "entry"
  , "check1"
  , "check2"
  , "bb_mult0"
  , "bb_mult1"
  , "bb_omega"
  , "bb_reject"
  , "merge"
  ]

/-- Mult SSA grade_tag edges (source->target; match br targets in Mult SSA).
    Greppable: multSsaCfgEdges, MULT-SSA-CFG-EDGES. -/
def multSsaCfgEdges : List String :=
  [ "entry->bb_mult0"
  , "entry->check1"
  , "check1->bb_mult1"
  , "check1->check2"
  , "check2->bb_omega"
  , "check2->bb_reject"
  , "bb_mult0->merge"
  , "bb_mult1->merge"
  , "bb_omega->merge"
  , "bb_reject->merge"
  ]

/-- Structural immediate-dominator table for Mult SSA grade_tag CFG.
    Format block:idom. Merge idom is entry (diamond join). Not a general
    dominance-tree algorithm claim.
    Greppable: productionIdomTable, PRODUCTION-IDOM. -/
def productionIdomTable : List String :=
  [ "check1:entry"
  , "bb_mult0:entry"
  , "check2:check1"
  , "bb_mult1:check1"
  , "bb_omega:check2"
  , "bb_reject:check2"
  , "merge:entry"
  ]

/-- Merge immediate dominator is entry (structural Mult SSA honesty).
    Greppable: mergeIdomIsEntry, MERGE-IDOM-ENTRY. -/
def mergeIdomIsEntry : Bool :=
  productionIdomTable.contains "merge:entry"
    && (multSsaCfgBlocks.head? == some "entry")
    && (multSsaCfgBlocks.length == 8)
    && (productionIdomTable.length == 7)

/-- Merge has exactly four Mult SSA phi predecessors (grade arms + reject).
    Matches Mult SSA phi: bb_mult0 / bb_mult1 / bb_omega / bb_reject.
    Greppable: mergePhiPredsFour, MERGE-PHI-PREDS-FOUR. -/
def mergePhiPredsFour : Bool :=
  (multSsaCfgEdges.contains "bb_mult0->merge")
    && (multSsaCfgEdges.contains "bb_mult1->merge")
    && (multSsaCfgEdges.contains "bb_omega->merge")
    && (multSsaCfgEdges.contains "bb_reject->merge")
    && !(multSsaCfgEdges.contains "entry->merge")
    && !(multSsaCfgEdges.contains "check1->merge")
    && !(multSsaCfgEdges.contains "check2->merge")
    && (multSsaCfgEdges.length == 10)

/-- Dual-pin Mult SSA CFG inventory against Mult SSA peer readiness.
    Greppable: multSsaCfgDualPin, MULT-SSA-CFG-DUAL-PIN. -/
def multSsaCfgDualPin : Bool :=
  (multSsaCfgBlocks.length == 8)
    && (multSsaCfgEdges.length == 10)
    && (productionIdomTable.length == 7)
    && LlvmMultSsa.llvmMultSsaReady
    && LlvmMultSsa.llvmMultSsaPartialClaimed
    && !LlvmMultSsa.llvmMultSsaFullBackendClaimed
    && !LlvmMultSsa.llvmMultSsaCfgProductionClaimed

/-- just recipe name for this residual.
    Greppable: justRecipeProductionCfgDeepen, production-cfg-deepen. -/
def justRecipeProductionCfgDeepen : String := "production-cfg-deepen"

/-- Production-oriented CFG deepen beyond structural fixture partial.
    Greppable: productionCfgDeepen, PRODUCTION-CFG-DEEPEN.
    Progressive dual-pin independent of fixture tip fullBackend polarity
    (Option A-light). Production opt / full dominance pipeline stay false. -/
def productionCfgDeepen : Bool :=
  cfgDeepenPartial
    && mergeIdomIsEntry
    && mergePhiPredsFour
    && multSsaCfgDualPin
    && (justRecipeProductionCfgDeepen == "production-cfg-deepen")
    && !llvmCfgFixtureDominanceClaimed
    && !llvmCfgFixtureProductionOptClaimed


end SystemsLean.LlvmCfgFixture
"#

end SystemsLean.HostFrontLiveLlvmCfgMultProduction
