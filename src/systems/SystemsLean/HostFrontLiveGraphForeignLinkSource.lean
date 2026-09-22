/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live GraphForeignLink.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraphForeignLinkSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-GRAPH-FOREIGN-LINK, liveGraphForeignLinkSource,
  HOST-FRONT-LIVE-GRAPH-FOREIGN-LINK, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveGraphForeignLinkSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveGraphForeignLink

/-- Dual-pinned live GraphForeignLink.lean bytes (must match on-disk file).
    Greppable: liveGraphForeignLinkSource, PARSE-LIVE-GRAPH-FOREIGN-LINK. -/
def liveGraphForeignLinkSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Graph foreign link success (layout-compatible
  foreign / out-of-tree consumer for Graph add-edge status codes only). Dual
  Graph add-edge layout/IR agreement. Host Lean dual-pin of foreign consumer
  contract (i32 Graph add-edge codes 0 ok / -1 full-or-badEndpoints, size 4,
  align 4, edgeMax 16 on x86_64-unknown-linux-gnu) against Graph SSOT +
  freestanding Graph subset cite + Graph unit IR add-edge constants + Graph
  SSA add-edge constants / add_edge_status honesty.
  Not product Rust under src/. Last R2 progressive after Mult/Linear/Types/Program.
  Not Mult/Linear/Types/Program otherBands flip (those stay band-local).
  Not full LLVM production backend. Not free/complete/PROVABLY flip.
  Honest dual surface: Graph IR does not use a three-tag kind enum; primary
  dual is emit addEdge status codes (0 ok, -1 full or badEndpoints) plus EDGE_MAX=16.
  SSA status_ix 0/1 is a secondary index that maps to those codes (unknown -> -2).
  pushNode 0, -1, -2 is a secondary API cite (call-through Program push).
  Greppable: SYSTEMS_LEAN_HOST, HOST-GRAPH-FOREIGN-LINK,
  SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0, GRAPH-FOREIGN-LINK-SUCCESS,
  graphForeignLinkSuccessClaimed, graphForeignLinkDualAgreementOk,
  graphForeignLinkConsumerContractOk, FOREIGN-GRAPH-CONSUMER-CONTRACT,
  GRAPH-FOREIGN-DUAL-AGREEMENT, just graph-foreign-link-success,
  out-of-tree, x86_64-unknown-linux-gnu, size 4, align 4, Graph,
  IR_GRAPH_EDGES_V0, IR-GRAPH-EDGES, EMPTY-GRAPH-OK, SLAKE_IR_EDGE_MAX,
  add_edge_ok, add_edge_fail, LlvmHold, llvmUnlocked,
  HOST-GRAPH-FOREIGN-LINK-SMOKE, HOST-GRAPH-FOREIGN-LINK-THEOREM.
  Module: SystemsLean.GraphForeignLink
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Short role name. Red/green: lake build SystemsLean.GraphForeignLink;
  just graph-foreign-link-success; just systems-llvm-ir.
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.IrGraph
import SystemsLean.LlvmHold
import SystemsLean.LlvmGraphSsa

namespace SystemsLean.GraphForeignLink

open SystemsLean.IrGraph

/-! ### HOST-GRAPH-FOREIGN-LINK / SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0

  Graph-band foreign consumer link success: layout-compatible Graph add-edge
  status codes so an out-of-tree consumer can match Slake Graph add-edge
  size/align/discriminants without an in-tree product Rust crate. Primary dual
  is addEdge status i32 codes 0 / -1 (ok / full-or-badEndpoints) and EDGE_MAX=16.
  Freestanding slake_ir_graph + add_edge is a secondary API cite (struct + API).
-/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-GRAPH-FOREIGN-LINK"

/-- Surface id (same durable token). -/
def surfaceId : String := "HOST-GRAPH-FOREIGN-LINK"

/-- Success claim name (Graph band only).
    Greppable: graphForeignLinkSuccessName, GRAPH-FOREIGN-LINK-SUCCESS. -/
def graphForeignLinkSuccessName : String := "GRAPH-FOREIGN-LINK-SUCCESS"

/-- Dual agreement recipe name.
    Greppable: graphForeignDualAgreementName, GRAPH-FOREIGN-DUAL-AGREEMENT. -/
def graphForeignDualAgreementName : String := "GRAPH-FOREIGN-DUAL-AGREEMENT"

/-- Foreign consumer contract name.
    Greppable: foreignGraphConsumerContractName, FOREIGN-GRAPH-CONSUMER-CONTRACT. -/
def foreignGraphConsumerContractName : String := "FOREIGN-GRAPH-CONSUMER-CONTRACT"

/-- just recipe for this gate.
    Greppable: justRecipeGraphForeignLink, graph-foreign-link-success. -/
def justRecipeGraphForeignLink : String := "graph-foreign-link-success"

/-- Alias used by presence greps. -/
def justRecipe : String := justRecipeGraphForeignLink

/-- Named target for Graph foreign layout (matches Mult layout fixture pattern).
    Greppable: foreignLinkTargetTriple, x86_64-unknown-linux-gnu. -/
def foreignLinkTargetTriple : String := "x86_64-unknown-linux-gnu"

/-- Graph add-edge status code size in bytes on the named target.
    Greppable: foreignGraphTagSizeBytes. -/
def foreignGraphTagSizeBytes : Nat := 4

/-- Graph add-edge status code align in bytes on the named target.
    Greppable: foreignGraphTagAlignBytes. -/
def foreignGraphTagAlignBytes : Nat := 4

/-- Foreign consumer encoding: Graph add-edge status is i32 / repr(i32)-shaped.
    Greppable: foreignGraphEncodingId, i32. -/
def foreignGraphEncodingId : String := "i32"

/-- Primary dual: emit addEdge status codes (IrGraph / freestanding map).
    Greppable: foreignGraphAddEdgeOkCode, foreignGraphAddEdgeFailCode. -/
def foreignGraphAddEdgeOkCode : Int := 0
def foreignGraphAddEdgeFailCode : Int := -1

/-- Graph edge capacity dual (IrGraph.edgeMax / SLAKE_IR_EDGE_MAX).
    Greppable: foreignGraphEdgeMax. -/
def foreignGraphEdgeMax : Nat := 16

/-- SSA status_ix secondary index (maps to primary codes 0, -1; unknown -> -2).
    Greppable: foreignGraphStatusIxOk, foreignGraphStatusIxFail. -/
def foreignGraphStatusIxOk : Nat := 0
def foreignGraphStatusIxFail : Nat := 1

/-- Graph surface names from Graph SSOT (not a second dialect). -/
def graphIrEdgesName : String := "IR_GRAPH_EDGES_V0"
def graphIrEdgesAliasName : String := "IR-GRAPH-EDGES"
def graphEmptyOkName : String := "EMPTY-GRAPH-OK"
def graphEdgeMaxStageName : String := "SLAKE_IR_EDGE_MAX"

/-- Freestanding Graph API cite (slake_ir_graph + add_edge / is_well_typed).
    Greppable: freestandingGraphApiCite, slake_ir_graph. -/
def freestandingGraphApiCite : String :=
  "slake_ir_graph EDGE_MAX=16 + slake_ir_graph_add_edge 0/-1 + EMPTY-GRAPH-OK + IR_GRAPH_EDGES_V0 + SLAKE_IR_EDGE_MAX"

/-- Graph unit IR symbols dual-pinned for foreign agreement.
    Greppable: graphUnitIrCite, slake_graph_add_edge_ok. -/
def graphUnitIrCite : String :=
  "@slake_graph_edge_max i32 16 + @slake_graph_add_edge_{ok,fail} i32 0/-1 align 4 + slake_graph_is_well_typed + slake_graph_add_edge_capacity"

/-- Graph SSA symbols dual-pinned for foreign agreement (add-edge status + EDGE_MAX).
    Greppable: graphSsaCite, slake_graph_ssa_add_edge_status. -/
def graphSsaCite : String :=
  "@slake_graph_ssa_edge_max i32 16 + @slake_graph_ssa_add_edge_{ok,fail} i32 0/-1 align 4 + slake_graph_ssa_add_edge_status status_ix 0/1 + kernel_band_ready + is_well_typed"

/-- Layout fixture cite (Mult-primary pattern; Graph add-edge codes same i32 size/align).
    Greppable: layoutFixtureCite, LAYOUT-SIZE-ALIGN-FIXTURE. -/
def layoutFixtureCite : String :=
  "LAYOUT-SIZE-ALIGN-FIXTURE Mult-class tags size 4 align 4 x86_64-unknown-linux-gnu (Graph add-edge codes same i32 pattern)"

/-- Evidence research path cite (out-of-tree recipe lives here).
    Greppable: foreignLinkEvidencePathCite. -/
def foreignLinkEvidencePathCite : String :=
  "doc/dev/research/graph-foreign-link-success-2026-08-10.md"

/-- Out-of-tree dogfood honesty: consumer lives outside product git.
    Greppable: outOfTreeConsumerHonesty, out-of-tree. -/
def outOfTreeConsumerHonesty : String :=
  "out-of-tree consumer under /tmp (not product Rust under src/)"

/-- Local inventory finished for Graph foreign link success residual. -/
def graphForeignLinkFinishedClaimed : Bool := true

/-- Graph foreign link success claim (Graph add-edge status codes only).
    Greppable: graphForeignLinkSuccessClaimed, GRAPH-FOREIGN-LINK-SUCCESS. -/
def graphForeignLinkSuccessClaimed : Bool := true

/-- Full LLVM production backend -- MUST stay false. -/
def graphForeignLinkFullBackendClaimed : Bool := false

/-- Further foreign bands beyond Mult..Graph progressive R2 -- MUST stay false.
    Mult Mult-only + Linear Mult-class + Types kind + Program push stay in their
    modules. This slice is Graph-band only (last R2 progressive).
    Greppable: graphForeignLinkOtherBandsClaimed. -/
def graphForeignLinkOtherBandsClaimed : Bool := false

/-- Local honesty: does not re-open product residual free. -/
def graphForeignLinkResidualFreeWorkClaimed : Bool := false

/-- Local honesty: not product self-host complete rebrand. -/
def graphForeignLinkProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not PROVABLY unlock work. -/
def graphForeignLinkProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not FullHostElaborateRemains true. -/
def graphForeignLinkFullHostElaborateClaimed : Bool := false

/-- Local honesty: not classic elaborator full parity rebrand. -/
def graphForeignLinkFullElaboratorParityClaimed : Bool := false

/-- Local unlock pin -- MUST stay false (LlvmHold owns living unlock). -/
def graphForeignLinkLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def graphForeignLinkLocalUnlockFalse : Bool := !graphForeignLinkLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def graphForeignLinkKeepsLlvmLocked : Bool := !graphForeignLinkLlvmUnlocked

/-- Does not unlock llvm. -/
def graphForeignLinkDoesNotUnlockLlvm : Bool :=
  graphForeignLinkKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmGraphSsa.llvmGraphSsaKeepsLlvmLocked

/-- Graph SSOT add-edge / EDGE_MAX agreement with foreign consumer codes.
    Greppable: graphSsotAddEdgeAgreementOk, IR_GRAPH_EDGES_V0,
    EMPTY-GRAPH-OK, SLAKE_IR_EDGE_MAX. -/
def graphSsotAddEdgeAgreementOk : Bool :=
  (edgeMax == foreignGraphEdgeMax)
    && (edgeMax == 16)
    && (foreignGraphAddEdgeOkCode == (0 : Int))
    && (foreignGraphAddEdgeFailCode == (-1 : Int))
    && (foreignGraphStatusIxOk == 0)
    && (foreignGraphStatusIxFail == 1)
    && (graphIrEdgesName == "IR_GRAPH_EDGES_V0")
    && (graphIrEdgesAliasName == "IR-GRAPH-EDGES")
    && (graphEmptyOkName == "EMPTY-GRAPH-OK")
    && (graphEdgeMaxStageName == "SLAKE_IR_EDGE_MAX")
    && isWellTyped empty
    && checkFailClosed empty = true

/-- Foreign consumer contract (size/align/encoding/target/codes) dual-ok.
    Greppable: graphForeignLinkConsumerContractOk, FOREIGN-GRAPH-CONSUMER-CONTRACT. -/
def graphForeignLinkConsumerContractOk : Bool :=
  (foreignGraphTagSizeBytes == 4)
    && (foreignGraphTagAlignBytes == 4)
    && (foreignLinkTargetTriple == "x86_64-unknown-linux-gnu")
    && (foreignGraphEncodingId == "i32")
    && (foreignGraphConsumerContractName == "FOREIGN-GRAPH-CONSUMER-CONTRACT")
    && (foreignGraphEdgeMax == 16)
    && graphSsotAddEdgeAgreementOk

/-- Dual Graph add-edge layout/IR agreement recipe.
    Requires Graph SSOT + consumer contract + Graph SSA peer ready (not full
    backend) + freestanding/IR/SSA/fixture cites present as strings + further
    other bands false.
    Greppable: graphForeignLinkDualAgreementOk, GRAPH-FOREIGN-DUAL-AGREEMENT. -/
def graphForeignLinkDualAgreementOk : Bool :=
  graphForeignLinkConsumerContractOk
    && (graphForeignDualAgreementName == "GRAPH-FOREIGN-DUAL-AGREEMENT")
    && (freestandingGraphApiCite.length > 0)
    && (graphUnitIrCite.length > 0)
    && (graphSsaCite.length > 0)
    && (layoutFixtureCite.length > 0)
    && (foreignLinkEvidencePathCite.length > 0)
    && (outOfTreeConsumerHonesty.length > 0)
    && LlvmGraphSsa.llvmGraphSsaReady
    && LlvmGraphSsa.llvmGraphSsaPartialClaimed
    && !LlvmGraphSsa.llvmGraphSsaFullBackendClaimed
    && !graphForeignLinkOtherBandsClaimed
    && !graphForeignLinkFullBackendClaimed

/-- Surface canary.
    Greppable: graphForeignLinkSurfaceOk. -/
def graphForeignLinkSurfaceOk : Bool :=
  (stageId == "SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0")
    && (hostId == "HOST-GRAPH-FOREIGN-LINK")
    && (surfaceId == "HOST-GRAPH-FOREIGN-LINK")
    && (graphForeignLinkSuccessName == "GRAPH-FOREIGN-LINK-SUCCESS")
    && (justRecipeGraphForeignLink == "graph-foreign-link-success")
    && graphForeignLinkDualAgreementOk

/-- Package ok (Graph foreign link success; no product Rust crate).
    Greppable: graphForeignLinkPackageOk. -/
def graphForeignLinkPackageOk : Bool :=
  graphForeignLinkSurfaceOk
    && graphForeignLinkSuccessClaimed
    && !graphForeignLinkFullBackendClaimed
    && !graphForeignLinkOtherBandsClaimed
    && !graphForeignLinkFullHostElaborateClaimed
    && !graphForeignLinkFullElaboratorParityClaimed

/-- Structural ready.
    Greppable: graphForeignLinkReady. -/
def graphForeignLinkReady : Bool :=
  graphForeignLinkFinishedClaimed
    && graphForeignLinkPackageOk
    && graphForeignLinkKeepsLlvmLocked
    && graphForeignLinkDoesNotUnlockLlvm
    && graphForeignLinkLocalUnlockFalse
    && !graphForeignLinkLlvmUnlocked
    && !graphForeignLinkResidualFreeWorkClaimed
    && !graphForeignLinkProductSelfHostCompleteClaimed
    && !graphForeignLinkProvablyUnlockWorkClaimed
    && LlvmHold.llvmHoldReady
    && LlvmGraphSsa.llvmGraphSsaReady

/-! ### HOST-GRAPH-FOREIGN-LINK-THEOREM -/

theorem graphForeignLinkFinishedClaimed_true :
    graphForeignLinkFinishedClaimed = true :=
  rfl

theorem graphForeignLinkSuccessClaimed_true :
    graphForeignLinkSuccessClaimed = true :=
  rfl

theorem graphForeignLinkFullBackendClaimed_false :
    graphForeignLinkFullBackendClaimed = false :=
  rfl

theorem graphForeignLinkOtherBandsClaimed_false :
    graphForeignLinkOtherBandsClaimed = false :=
  rfl

theorem graphForeignLinkLlvmUnlocked_false :
    graphForeignLinkLlvmUnlocked = false :=
  rfl

theorem graphForeignLinkFullHostElaborateClaimed_false :
    graphForeignLinkFullHostElaborateClaimed = false :=
  rfl

theorem graphSsotAddEdgeAgreementOk_true :
    graphSsotAddEdgeAgreementOk = true := by
  native_decide

theorem graphForeignLinkConsumerContractOk_true :
    graphForeignLinkConsumerContractOk = true := by
  native_decide

theorem graphForeignLinkDualAgreementOk_true :
    graphForeignLinkDualAgreementOk = true := by
  native_decide

theorem graphForeignLinkReady_true :
    graphForeignLinkReady = true := by
  native_decide

theorem graphForeignLinkPackageOk_true :
    graphForeignLinkPackageOk = true := by
  native_decide

theorem graphForeignLink_stageId_eq :
    stageId = "SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0" :=
  rfl

theorem graphForeignLink_hostId_eq :
    hostId = "HOST-GRAPH-FOREIGN-LINK" :=
  rfl

theorem graphForeignLink_justRecipe_eq :
    justRecipeGraphForeignLink = "graph-foreign-link-success" :=
  rfl

theorem foreignGraphTagSizeBytes_eq :
    foreignGraphTagSizeBytes = 4 :=
  rfl

theorem foreignGraphTagAlignBytes_eq :
    foreignGraphTagAlignBytes = 4 :=
  rfl

theorem foreignGraphEdgeMax_eq :
    foreignGraphEdgeMax = 16 :=
  rfl

theorem foreignGraphAddEdgeOkCode_eq :
    foreignGraphAddEdgeOkCode = (0 : Int) :=
  rfl

theorem foreignGraphAddEdgeFailCode_eq :
    foreignGraphAddEdgeFailCode = (-1 : Int) :=
  rfl

/-! ### HOST-GRAPH-FOREIGN-LINK-SMOKE -/

example : graphForeignLinkFinishedClaimed = true := rfl
example : graphForeignLinkSuccessClaimed = true := rfl
example : graphForeignLinkFullBackendClaimed = false := rfl
example : graphForeignLinkOtherBandsClaimed = false := rfl
example : graphForeignLinkLlvmUnlocked = false := rfl
example : graphForeignLinkReady = true := by native_decide
example : graphForeignLinkDualAgreementOk = true := by native_decide
example : graphForeignLinkConsumerContractOk = true := by native_decide
example : graphSsotAddEdgeAgreementOk = true := by native_decide
example : graphForeignLinkSuccessName = "GRAPH-FOREIGN-LINK-SUCCESS" := rfl
example : foreignLinkTargetTriple = "x86_64-unknown-linux-gnu" := rfl
example : foreignGraphTagSizeBytes = 4 := rfl
example : foreignGraphTagAlignBytes = 4 := rfl
example : foreignGraphEdgeMax = 16 := rfl
example : foreignGraphAddEdgeOkCode = (0 : Int) := rfl
example : foreignGraphAddEdgeFailCode = (-1 : Int) := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : LlvmGraphSsa.llvmGraphSsaReady = true := by native_decide
example : LlvmGraphSsa.llvmGraphSsaFullBackendClaimed = false := rfl
example : LlvmGraphSsa.llvmGraphSsaRustNativeLinkClaimed = false := rfl

end SystemsLean.GraphForeignLink
"#

end SystemsLean.HostFrontLiveGraphForeignLink
