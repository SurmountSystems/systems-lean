/-
  SYSTEMS_LEAN_HOST partial -- LLVM IR Graph text (IR graph unit IR fragment
  from Lean Graph SSOT under out/llvm-ir). Generator-owned Graph-related LLVM
  IR text. Composes LlvmHold hold honesty: living llvmUnlocked true after unlock residual; local unlock pin false. Composes
  LlvmEmitPath design+stub path, LlvmMultText Mult IR peer, LlvmLinearText
  Linear IR peer, LlvmTypesText Types IR peer, and LlvmProgramText Program IR
  peer. Not production LLVM backend. Not llvm-as pipeline. Not Rust-native
  link success. Not freestanding residual free re-open. Not product C growth.
  Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-GRAPH-TEXT, SLAKE_LLVM_GRAPH_TEXT,
  SLAKE_LLVM_GRAPH_TEXT_V0, HOST-HOST-LLVM-GRAPH-TEXT, llvmGraphTextReady,
  llvmGraphTextFinishedClaimed, llvmGraphTextPackageOk,
  llvmGraphTextWroteExpected, llvmGraphTextKeepsLlvmLocked,
  llvmGraphTextDoesNotUnlockLlvm, llvmGraphTextLlvmUnlocked,
  llvmGraphTextLocalUnlockFalse, justRecipeLlvmGraphText, llvm-graph-text,
  out/llvm-ir, slake_graph.ll, graphIrPackage, llvmGraphTextWrite,
  IO.FS.writeFile, IrGraph, EMPTY-GRAPH-OK, SLAKE_IR_EDGE_MAX, edgeMax,
  addEdge, pushNode, isWellTyped, checkFailClosed, edgesSound,
  LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmMultText, LlvmLinearText,
  LlvmTypesText, LlvmProgramText, HOST-LLVM-EMIT-PATH, HOST-LLVM-MULT-TEXT,
  HOST-LLVM-LINEAR-TEXT, HOST-LLVM-TYPES-TEXT, HOST-LLVM-PROGRAM-TEXT,
  HOST-LLVM-GRAPH-TEXT-SMOKE, HOST-LLVM-GRAPH-TEXT-THEOREM, UNIT_SURFACE
  host surface, MULT-0.
  Module: SystemsLean.LlvmGraphText
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-graph-text
  greps of out/llvm-ir/slake_graph.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmGraphText; lake exe slake-llvm-graph-text;
  just llvm-graph-text; just systems-host when presence dual-pin staged.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock.
  Host elaborator residual remains. Graph IR text only (not full backend).
  Not full CFG. Not dominance. Not SSA. Not a second IR dialect.
-/

import SystemsLean.IrGraph
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmMultText
import SystemsLean.LlvmLinearText
import SystemsLean.LlvmTypesText
import SystemsLean.LlvmProgramText

namespace SystemsLean.LlvmGraphText

open SystemsLean.IrGraph

/-! ### HOST-LLVM-GRAPH-TEXT / SLAKE_LLVM_GRAPH_TEXT

  IR graph unit LLVM IR text fragment owned by Lean Graph SSOT
  (edgeMax, EMPTY-GRAPH-OK, addEdge, pushNode, isWellTyped / checkFailClosed).
  Written under out/llvm-ir/slake_graph.ll. Does not unlock llvm.
  Not full CFG / dominance / SSA.
-/

/-- Greppable primary stage id (LLVM IR Graph text gate). -/
def stageId : String := "SLAKE_LLVM_GRAPH_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-GRAPH-TEXT"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-GRAPH-TEXT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-GRAPH-TEXT"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmGraphText, llvm-graph-text. -/
def justRecipeLlvmGraphText : String := "llvm-graph-text"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmGraphText

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-graph-text. -/
def lakeExeName : String := "slake-llvm-graph-text"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Graph IR artifact basename under out/llvm-ir.
    Greppable: graphIrBasename, slake_graph.ll. -/
def graphIrBasename : String := "slake_graph.ll"

/-- Graph host SSOT module path cite.
    Greppable: graphModuleCite, IrGraph.lean. -/
def graphModuleCite : String := "src/systems/SystemsLean/IrGraph.lean"

/-- Program IR peer module cite (prior residual).
    Greppable: llvmProgramTextModuleCite, LlvmProgramText. -/
def llvmProgramTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmProgramText.lean"

/-- Types IR peer module cite (prior residual).
    Greppable: llvmTypesTextModuleCite, LlvmTypesText. -/
def llvmTypesTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmTypesText.lean"

/-- Linear IR peer module cite (prior residual).
    Greppable: llvmLinearTextModuleCite, LlvmLinearText. -/
def llvmLinearTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearText.lean"

/-- Mult IR peer module cite (prior residual).
    Greppable: llvmMultTextModuleCite, LlvmMultText. -/
def llvmMultTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmMultText.lean"

/-- Emit path module cite (design+stub residual).
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Graph IR text).
    Greppable: llvmGraphTextFinishedClaimed. -/
def llvmGraphTextFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmGraphTextLlvmUnlocked, llvmGraphTextLocalUnlockFalse. -/
def llvmGraphTextLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmGraphTextLocalUnlockFalse. -/
def llvmGraphTextLocalUnlockFalse : Bool := !llvmGraphTextLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmGraphTextKeepsLlvmLocked. -/
def llvmGraphTextKeepsLlvmLocked : Bool :=
  !llvmGraphTextLlvmUnlocked

/-- Graph IR text does not unlock llvm (fail-closed).
    Greppable: llvmGraphTextDoesNotUnlockLlvm. -/
def llvmGraphTextDoesNotUnlockLlvm : Bool :=
  llvmGraphTextKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmMultText.llvmMultTextKeepsLlvmLocked
    && LlvmLinearText.llvmLinearTextKeepsLlvmLocked
    && LlvmTypesText.llvmTypesTextKeepsLlvmLocked
    && LlvmProgramText.llvmProgramTextKeepsLlvmLocked

/-- Local honesty: not freestanding residual free re-open. -/
def llvmGraphTextResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmGraphTextProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmGraphTextProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmGraphTextProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmGraphTextProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmGraphTextRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmGraphTextLlvmAsClaimed : Bool := false

/-- Local honesty: not full CFG claim. -/
def llvmGraphTextCfgClaimed : Bool := false

/-- Local honesty: not dominance claim. -/
def llvmGraphTextDominanceClaimed : Bool := false

/-- Local honesty: not SSA claim. -/
def llvmGraphTextSsaClaimed : Bool := false

/-- Fixed edge capacity from IrGraph SSOT (emit SLAKE_IR_EDGE_MAX map).
    Greppable: edgeMaxValue, edgeMax, SLAKE_IR_EDGE_MAX. -/
def edgeMaxValue : Nat := edgeMax

/-- String form of edgeMax for IR package text.
    Greppable: edgeMaxStr. -/
def edgeMaxStr : String := toString edgeMaxValue

/-- Empty graph well-typed honesty id from Graph SSOT.
    Greppable: emptyGraphOkId, EMPTY-GRAPH-OK. -/
def emptyGraphOkId : String := "EMPTY-GRAPH-OK"

/-- Emit edge capacity map id (Graph SSOT honesty).
    Greppable: edgeMaxHonestyId, SLAKE_IR_EDGE_MAX. -/
def edgeMaxHonestyId : String := "SLAKE_IR_EDGE_MAX"

/-- IR graph edges surface honesty id.
    Greppable: irGraphEdgesId, IR-GRAPH-EDGES. -/
def irGraphEdgesId : String := "IR-GRAPH-EDGES"

/-- Graph IR header comments (stage + Graph SSOT + non-claims).
    Greppable: graphIrBanner. -/
def graphIrBanner : String :=
  "; SLAKE_LLVM_GRAPH_TEXT_V0 / HOST-LLVM-GRAPH-TEXT\n"
    ++ "; Generator-owned IR graph unit LLVM IR fragment from Systems Lean Graph SSOT\n"
    ++ "; " ++ irGraphEdgesId ++ " " ++ edgeMaxHonestyId ++ "="
    ++ edgeMaxStr ++ " " ++ emptyGraphOkId ++ "\n"
    ++ "; Surface: edgeMax addEdge pushNode isWellTyped checkFailClosed (not full CFG not SSA)\n"
    ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
    ++ "; Path: out/llvm-ir/slake_graph.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmProgramText Program IR; LlvmTypesText Types IR; LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub\n"
    ++ "; Recipe: just llvm-graph-text / lake exe slake-llvm-graph-text\n"
    ++ "; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "; Not full CFG. Not dominance. Not SSA. Not a second IR dialect.\n"
    ++ "\n"

/-- Graph surface constants (EDGE_MAX + addEdge/pushNode result codes).
    Greppable: graphIrConstants, SLAKE_IR_EDGE_MAX. -/
def graphIrConstants : String :=
  "; IR graph surface constants (IrGraph.edgeMax / addEdge / pushNode map)\n"
    ++ "; " ++ edgeMaxHonestyId ++ " = " ++ edgeMaxStr ++ "\n"
    ++ "; addEdge: 0=ok, -1=full/out-of-range (emit map)\n"
    ++ "; pushNode: 0=ok, -1=badNode, -2=full (via program push)\n"
    ++ "@slake_graph_edge_max = private unnamed_addr constant i32 "
    ++ edgeMaxStr ++ ", align 4 ; " ++ edgeMaxHonestyId ++ "\n"
    ++ "@slake_graph_add_edge_ok = private unnamed_addr constant i32 0, align 4 ; addEdge ok\n"
    ++ "@slake_graph_add_edge_fail = private unnamed_addr constant i32 -1, align 4 ; full or badEndpoints\n"
    ++ "@slake_graph_push_node_ok = private unnamed_addr constant i32 0, align 4 ; pushNode ok\n"
    ++ "@slake_graph_push_node_bad = private unnamed_addr constant i32 -1, align 4 ; badNode\n"
    ++ "@slake_graph_push_node_full = private unnamed_addr constant i32 -2, align 4 ; full\n"
    ++ "\n"

/-- Empty graph well-typed sketch (IrGraph.isWellTyped empty = true; EMPTY-GRAPH-OK).
    Greppable: graphIrIsWellTypedEmpty, EMPTY-GRAPH-OK. -/
def graphIrIsWellTypedEmpty : String :=
  "; " ++ emptyGraphOkId ++ " (IrGraph.isWellTyped empty is true)\n"
    ++ "; empty graph (no nodes, no edges) is well-typed at graph surface\n"
    ++ "; Nested empty program alone stays EMPTY-PROGRAM-FAIL-CLOSED under IrProgram\n"
    ++ "define i1 @slake_graph_is_well_typed_empty() {\n"
    ++ "entry:\n"
    ++ "  ret i1 true\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed isWellTyped / edgesSound / addEdge capacity sketches.
    Greppable: graphIrSketches, slake_graph_is_well_typed. -/
def graphIrSketches : String :=
  "; isWellTyped sketch (empty OK; else non-empty program + edges under EDGE_MAX)\n"
    ++ "; Oversize edge count (edgeCount > EDGE_MAX) fails closed\n"
    ++ "define i1 @slake_graph_is_well_typed(i32 %nodeCount, i32 %edgeCount) {\n"
    ++ "entry:\n"
    ++ "  %n0 = icmp eq i32 %nodeCount, 0\n"
    ++ "  %e0 = icmp eq i32 %edgeCount, 0\n"
    ++ "  %empty = and i1 %n0, %e0\n"
    ++ "  %edges_ok = icmp ule i32 %edgeCount, " ++ edgeMaxStr ++ "\n"
    ++ "  %prog_nz = icmp ne i32 %nodeCount, 0\n"
    ++ "  %nonempty_ok = and i1 %prog_nz, %edges_ok\n"
    ++ "  %ok = or i1 %empty, %nonempty_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; checkFailClosed sketch (same bar as isWellTyped on host V0)\n"
    ++ "define i1 @slake_graph_check_fail_closed(i32 %nodeCount, i32 %edgeCount) {\n"
    ++ "entry:\n"
    ++ "  %ok = call i1 @slake_graph_is_well_typed(i32 %nodeCount, i32 %edgeCount)\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; addEdge capacity sketch: full when edgeCount >= EDGE_MAX (returns -1)\n"
    ++ "; 0=ok path when edgeCount < EDGE_MAX and endpoints in range (endpoint check omitted here)\n"
    ++ "define i32 @slake_graph_add_edge_capacity(i32 %edgeCount) {\n"
    ++ "entry:\n"
    ++ "  %full = icmp uge i32 %edgeCount, " ++ edgeMaxStr ++ "\n"
    ++ "  %r = select i1 %full, i32 -1, i32 0\n"
    ++ "  ret i32 %r\n"
    ++ "}\n"
    ++ "\n"
    ++ "; edgesSound sketch: edgeCount <= EDGE_MAX (endpoint range omitted in text fragment)\n"
    ++ "define i1 @slake_graph_edges_sound(i32 %edgeCount) {\n"
    ++ "entry:\n"
    ++ "  %ok = icmp ule i32 %edgeCount, " ++ edgeMaxStr ++ "\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Graph IR package text (banner + constants + empty OK + sketches).
    Greppable: graphIrPackage, slake_graph.ll. -/
def graphIrPackage : String :=
  graphIrBanner ++ graphIrConstants ++ graphIrIsWellTypedEmpty
    ++ graphIrSketches

/-- Surface ids + path cites + Graph SSOT pins ok. -/
def llvmGraphTextSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_GRAPH_TEXT_V0")
    && (hostId == "HOST-LLVM-GRAPH-TEXT")
    && (surfaceId == "HOST-LLVM-GRAPH-TEXT")
    && (surfaceAlias == "HOST-HOST-LLVM-GRAPH-TEXT")
    && (justRecipeLlvmGraphText == "llvm-graph-text")
    && (justRecipe == "llvm-graph-text")
    && (lakeExeName == "slake-llvm-graph-text")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (graphIrBasename == "slake_graph.ll")
    && (graphModuleCite == "src/systems/SystemsLean/IrGraph.lean")
    && (llvmProgramTextModuleCite
      == "src/systems/SystemsLean/LlvmProgramText.lean")
    && (llvmTypesTextModuleCite
      == "src/systems/SystemsLean/LlvmTypesText.lean")
    && (llvmLinearTextModuleCite
      == "src/systems/SystemsLean/LlvmLinearText.lean")
    && (llvmMultTextModuleCite
      == "src/systems/SystemsLean/LlvmMultText.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (emptyGraphOkId == "EMPTY-GRAPH-OK")
    && (edgeMaxHonestyId == "SLAKE_IR_EDGE_MAX")
    && (irGraphEdgesId == "IR-GRAPH-EDGES")
    && (edgeMaxValue == 16)
    && (edgeMaxStr == "16")
    && (edgeMax == 16)
    && isEmpty empty
    && isWellTyped empty
    && checkFailClosed empty
    && (edgeCount empty == 0)
    && (nodeCount empty == 0)

/-- Package text honesty: Graph EDGE_MAX + stage + define present.
    Greppable: llvmGraphTextPackageOk. -/
def llvmGraphTextPackageOk : Bool :=
  llvmGraphTextSurfaceOk
    && (graphIrPackage
      == graphIrBanner ++ graphIrConstants ++ graphIrIsWellTypedEmpty
        ++ graphIrSketches)
    && (graphIrBanner
      == "; SLAKE_LLVM_GRAPH_TEXT_V0 / HOST-LLVM-GRAPH-TEXT\n"
        ++ "; Generator-owned IR graph unit LLVM IR fragment from Systems Lean Graph SSOT\n"
        ++ "; IR-GRAPH-EDGES SLAKE_IR_EDGE_MAX=16 EMPTY-GRAPH-OK\n"
        ++ "; Surface: edgeMax addEdge pushNode isWellTyped checkFailClosed (not full CFG not SSA)\n"
        ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
        ++ "; Path: out/llvm-ir/slake_graph.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmProgramText Program IR; LlvmTypesText Types IR; LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub\n"
        ++ "; Recipe: just llvm-graph-text / lake exe slake-llvm-graph-text\n"
        ++ "; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "; Not full CFG. Not dominance. Not SSA. Not a second IR dialect.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Graph IR equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmGraphTextWrite
    (IO.FS.writeFile) + post-read equality + just llvm-graph-text greps.
    Greppable: llvmGraphTextWroteExpected. -/
def llvmGraphTextWroteExpected : Bool :=
  llvmGraphTextPackageOk
    && (graphIrPackage
      == graphIrBanner ++ graphIrConstants ++ graphIrIsWellTypedEmpty
        ++ graphIrSketches)

/-- Structural ready for LLVM IR Graph text residual.
    Greppable: llvmGraphTextReady, HOST-LLVM-GRAPH-TEXT, SLAKE_LLVM_GRAPH_TEXT. -/
def llvmGraphTextReady : Bool :=
  llvmGraphTextFinishedClaimed
    && llvmGraphTextPackageOk
    && llvmGraphTextWroteExpected
    && llvmGraphTextSurfaceOk
    && llvmGraphTextKeepsLlvmLocked
    && llvmGraphTextDoesNotUnlockLlvm
    && llvmGraphTextLocalUnlockFalse
    && !llvmGraphTextLlvmUnlocked
    && !llvmGraphTextResidualFreeClaimed
    && !llvmGraphTextProductSelfHostCompleteClaimed
    && !llvmGraphTextProofCompleteClaimed
    && !llvmGraphTextProvablyUnlockWorkClaimed
    && !llvmGraphTextProductionReadyClaimed
    && !llvmGraphTextRustNativeLinkClaimed
    && !llvmGraphTextLlvmAsClaimed
    && !llvmGraphTextCfgClaimed
    && !llvmGraphTextDominanceClaimed
    && !llvmGraphTextSsaClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmMultText.llvmMultTextReady
    && !LlvmMultText.llvmMultTextLlvmUnlocked
    && LlvmLinearText.llvmLinearTextReady
    && !LlvmLinearText.llvmLinearTextLlvmUnlocked
    && LlvmTypesText.llvmTypesTextReady
    && !LlvmTypesText.llvmTypesTextLlvmUnlocked
    && LlvmProgramText.llvmProgramTextReady
    && !LlvmProgramText.llvmProgramTextLlvmUnlocked

/-! ### HOST-LLVM-GRAPH-TEXT-THEOREM (readable statements) -/

theorem llvmGraphTextFinishedClaimed_true :
    llvmGraphTextFinishedClaimed = true :=
  rfl

theorem llvmGraphTextLlvmUnlocked_false :
    llvmGraphTextLlvmUnlocked = false :=
  rfl

theorem llvmGraphTextKeepsLlvmLocked_true :
    llvmGraphTextKeepsLlvmLocked = true := by
  native_decide

theorem llvmGraphTextDoesNotUnlockLlvm_true :
    llvmGraphTextDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmGraphTextReady_true :
    llvmGraphTextReady = true := by
  native_decide

theorem justRecipeLlvmGraphText_eq :
    justRecipeLlvmGraphText = "llvm-graph-text" :=
  rfl

theorem llvmGraphText_stageId_eq :
    stageId = "SLAKE_LLVM_GRAPH_TEXT_V0" :=
  rfl

theorem llvmGraphText_hostId_eq :
    hostId = "HOST-LLVM-GRAPH-TEXT" :=
  rfl

theorem llvmGraphText_graph_surface_eq :
    emptyGraphOkId = "EMPTY-GRAPH-OK"
      && edgeMaxHonestyId = "SLAKE_IR_EDGE_MAX"
      && irGraphEdgesId = "IR-GRAPH-EDGES"
      && edgeMaxStr = "16"
      && edgeMaxValue = 16 :=
  rfl

theorem llvmGraphText_claims_false :
    llvmGraphTextLlvmUnlocked = false
      && llvmGraphTextResidualFreeClaimed = false
      && llvmGraphTextProductSelfHostCompleteClaimed = false
      && llvmGraphTextProofCompleteClaimed = false
      && llvmGraphTextProvablyUnlockWorkClaimed = false
      && llvmGraphTextProductionReadyClaimed = false
      && llvmGraphTextRustNativeLinkClaimed = false
      && llvmGraphTextLlvmAsClaimed = false
      && llvmGraphTextCfgClaimed = false
      && llvmGraphTextDominanceClaimed = false
      && llvmGraphTextSsaClaimed = false :=
  rfl

theorem llvmGraphTextPackageOk_true :
    llvmGraphTextPackageOk = true := by
  native_decide

theorem llvmGraphTextWroteExpected_true :
    llvmGraphTextWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-GRAPH-TEXT-SMOKE (quick examples) -/

example : llvmGraphTextFinishedClaimed = true := rfl
example : llvmGraphTextLlvmUnlocked = false := rfl
example : llvmGraphTextKeepsLlvmLocked = true := by native_decide
example : llvmGraphTextDoesNotUnlockLlvm = true := by native_decide
example : llvmGraphTextReady = true := by native_decide
example : justRecipeLlvmGraphText = "llvm-graph-text" := rfl
example : emptyGraphOkId = "EMPTY-GRAPH-OK" := rfl
example : edgeMaxHonestyId = "SLAKE_IR_EDGE_MAX" := rfl
example : irGraphEdgesId = "IR-GRAPH-EDGES" := rfl
example : edgeMaxStr = "16" := rfl
example : edgeMaxValue = 16 := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmGraphTextLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmMultText.llvmMultTextReady = true := by native_decide
example : LlvmLinearText.llvmLinearTextReady = true := by native_decide
example : LlvmTypesText.llvmTypesTextReady = true := by native_decide
example : LlvmProgramText.llvmProgramTextReady = true := by native_decide
example : llvmGraphTextProductionReadyClaimed = false := rfl
example : llvmGraphTextLlvmAsClaimed = false := rfl
example : llvmGraphTextCfgClaimed = false := rfl
example : llvmGraphTextDominanceClaimed = false := rfl
example : llvmGraphTextSsaClaimed = false := rfl
example : graphIrBasename = "slake_graph.ll" := rfl
example : isEmpty empty = true := rfl
example : isWellTyped empty = true := by native_decide

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Graph IR lacks greppable honesty tokens. -/
def validateGraphIrPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_GRAPH_TEXT_V0"
    , "HOST-LLVM-GRAPH-TEXT"
    , "IR-GRAPH-EDGES"
    , "EMPTY-GRAPH-OK"
    , "SLAKE_IR_EDGE_MAX"
    , "edgeMax"
    , "addEdge"
    , "pushNode"
    , "isWellTyped"
    , "checkFailClosed"
    , "slake_graph_edge_max"
    , "slake_graph_is_well_typed_empty"
    , "slake_graph_is_well_typed"
    , "slake_graph_check_fail_closed"
    , "slake_graph_add_edge_capacity"
    , "slake_graph_edges_sound"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_graph.ll"
    , "Not production LLVM backend"
    , "Not full CFG"
    , "Not SSA"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  -- Must not claim unlock or full freestanding dialect stage.
  if containsSub text "llvmUnlocked = true" then
    IO.eprintln s!"error: {label}: unexpected llvmUnlocked true claim"
    throw (IO.userError s!"{label}: unlock forge")
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected freestanding C emit stage"
    throw (IO.userError s!"{label}: freestanding stage")

/-- Write Graph unit LLVM IR text under root/out/llvm-ir/slake_graph.ll.
    Greppable: llvmGraphTextWrite, slake_graph.ll, IO.FS.writeFile. -/
def llvmGraphTextWrite (root : System.FilePath) : IO Unit := do
  unless llvmGraphTextReady do
    IO.eprintln s!"error: {stageId}: llvmGraphTextReady false"
    throw (IO.userError "llvmGraphTextReady false")
  unless llvmGraphTextWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmGraphTextWroteExpected false"
    throw (IO.userError "llvmGraphTextWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / graphIrBasename
  IO.println s!"== {stageId}: LLVM IR Graph text =="
  IO.println s!"  readyPin={llvmGraphTextReady} llvmUnlocked={LlvmHold.llvmUnlocked}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl graphIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Graph IR after write: {outLl}"
    throw (IO.userError "missing Graph IR")
  if written != graphIrPackage then
    IO.eprintln "error: Graph IR written content mismatch"
    throw (IO.userError "Graph IR mismatch")
  validateGraphIrPackage graphIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-GRAPH-TEXT, IR-GRAPH-EDGES, EDGE_MAX=16, EMPTY-GRAPH-OK"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend; not full CFG/SSA"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Graph IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmGraphTextWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmGraphText
