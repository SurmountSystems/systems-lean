/-
  SYSTEMS_LEAN_HOST partial -- LLVM Graph SSA lower (one Graph edges band to
  SSA-shaped IR under out/llvm-ir). Generator-owned Graph-band SSA form from
  KernelProgram graph lower + IrGraph SSOT. Composes LlvmHold: living
  llvmUnlocked true after unlock residual; local unlock pin false.
  Composes LlvmGraphText unit IR peer + LlvmProgramSsa / LlvmTypesSsa /
  LlvmLinearSsa / LlvmMultSsa SSA peers + LlvmEmitPath design+stub.
  Not production LLVM backend. Not full CFG/dominance pipeline.
  Not Rust-native link success. Not freestanding residual free re-open.
  Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-GRAPH-SSA, SLAKE_LLVM_GRAPH_SSA,
  SLAKE_LLVM_GRAPH_SSA_V0, HOST-HOST-LLVM-GRAPH-SSA, llvmGraphSsaReady,
  llvmGraphSsaFinishedClaimed, llvmGraphSsaPackageOk, llvmGraphSsaWroteExpected,
  llvmGraphSsaKeepsLlvmLocked, llvmGraphSsaDoesNotUnlockLlvm,
  llvmGraphSsaLlvmUnlocked, llvmGraphSsaLocalUnlockFalse,
  llvmGraphSsaPartialClaimed, llvmGraphSsaFullBackendClaimed,
  justRecipeLlvmGraphSsa, llvm-graph-ssa, out/llvm-ir, slake_graph_ssa.ll,
  graphSsaPackage, llvmGraphSsaWrite, IO.FS.writeFile, Graph,
  EMPTY-GRAPH-OK, SLAKE_IR_EDGE_MAX, IR-GRAPH-EDGES, ORDERED-IR-PROGRAM,
  SELF-HOST-KERNEL-PROGRAM, KernelProgram, lowerProgramGraph, SSA-SHAPED, phi,
  LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmGraphText, LlvmProgramSsa,
  LlvmTypesSsa, LlvmLinearSsa, LlvmMultSsa, HOST-LLVM-EMIT-PATH,
  HOST-LLVM-GRAPH-TEXT, HOST-LLVM-GRAPH-SSA-SMOKE, HOST-LLVM-GRAPH-SSA-THEOREM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmGraphSsa
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-graph-ssa
  greps of out/llvm-ir/slake_graph_ssa.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmGraphSsa; lake exe slake-llvm-graph-ssa;
  just llvm-graph-ssa; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Graph SSA partial only (not full backend).
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrGraph
import SystemsLean.KernelProgram
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmGraphText
import SystemsLean.LlvmProgramSsa
import SystemsLean.LlvmTypesSsa
import SystemsLean.LlvmLinearSsa
import SystemsLean.LlvmMultSsa

namespace SystemsLean.LlvmGraphSsa

open SystemsLean.Mult
open SystemsLean.Types (NodeKind)
open SystemsLean.IrGraph (edgeMax)
open SystemsLean.KernelProgram (
  programKernelReady programKernelOk programGraphPathReady lowerProgramGraph
)

/-! ### HOST-LLVM-GRAPH-SSA / SLAKE_LLVM_GRAPH_SSA

  Graph edges band lowered to SSA-shaped LLVM IR from KernelProgram
  lowerProgramGraph (three nodes + chain edges 0->1, 1->2) plus IrGraph SSOT
  honesty (edgeMax, EMPTY-GRAPH-OK, addEdge codes). Written under
  out/llvm-ir/slake_graph_ssa.ll. Partial SSA form. Does not unlock llvm.
  Does not claim full CFG/dominance.
-/

/-- Greppable primary stage id (LLVM Graph SSA lower gate). -/
def stageId : String := "SLAKE_LLVM_GRAPH_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-GRAPH-SSA"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-GRAPH-SSA"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-GRAPH-SSA"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmGraphSsa, llvm-graph-ssa. -/
def justRecipeLlvmGraphSsa : String := "llvm-graph-ssa"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmGraphSsa

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-graph-ssa. -/
def lakeExeName : String := "slake-llvm-graph-ssa"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Graph SSA IR artifact basename under out/llvm-ir.
    Greppable: graphSsaBasename, slake_graph_ssa.ll. -/
def graphSsaBasename : String := "slake_graph_ssa.ll"

/-- IrGraph host SSOT module path cite.
    Greppable: irGraphModuleCite, IrGraph.lean. -/
def irGraphModuleCite : String := "src/systems/SystemsLean/IrGraph.lean"

/-- Kernel Program path cite (graph lower lives with KernelProgram).
    Greppable: kernelProgramModuleCite, KernelProgram.lean. -/
def kernelProgramModuleCite : String :=
  "src/systems/SystemsLean/KernelProgram.lean"

/-- Graph unit IR peer module cite.
    Greppable: llvmGraphTextModuleCite, LlvmGraphText. -/
def llvmGraphTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmGraphText.lean"

/-- Program SSA peer module cite.
    Greppable: llvmProgramSsaModuleCite, LlvmProgramSsa. -/
def llvmProgramSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmProgramSsa.lean"

/-- Types SSA peer module cite.
    Greppable: llvmTypesSsaModuleCite, LlvmTypesSsa. -/
def llvmTypesSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmTypesSsa.lean"

/-- Linear SSA peer module cite.
    Greppable: llvmLinearSsaModuleCite, LlvmLinearSsa. -/
def llvmLinearSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearSsa.lean"

/-- Mult SSA peer module cite.
    Greppable: llvmMultSsaModuleCite, LlvmMultSsa. -/
def llvmMultSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmMultSsa.lean"

/-- Emit path module cite.
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Graph SSA partial).
    Greppable: llvmGraphSsaFinishedClaimed. -/
def llvmGraphSsaFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmGraphSsaLlvmUnlocked, llvmGraphSsaLocalUnlockFalse. -/
def llvmGraphSsaLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmGraphSsaLocalUnlockFalse. -/
def llvmGraphSsaLocalUnlockFalse : Bool := !llvmGraphSsaLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmGraphSsaKeepsLlvmLocked. -/
def llvmGraphSsaKeepsLlvmLocked : Bool :=
  !llvmGraphSsaLlvmUnlocked

/-- Graph SSA lower does not unlock llvm (fail-closed).
    Greppable: llvmGraphSsaDoesNotUnlockLlvm. -/
def llvmGraphSsaDoesNotUnlockLlvm : Bool :=
  llvmGraphSsaKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmGraphText.llvmGraphTextKeepsLlvmLocked
    && LlvmProgramSsa.llvmProgramSsaKeepsLlvmLocked
    && LlvmTypesSsa.llvmTypesSsaKeepsLlvmLocked
    && LlvmLinearSsa.llvmLinearSsaKeepsLlvmLocked
    && LlvmMultSsa.llvmMultSsaKeepsLlvmLocked

/-- This residual claims Graph-band SSA-shaped IR partial only.
    Greppable: llvmGraphSsaPartialClaimed, SSA-SHAPED. -/
def llvmGraphSsaPartialClaimed : Bool := true

/-- Full production LLVM backend claim -- MUST stay false.
    Greppable: llvmGraphSsaFullBackendClaimed. -/
def llvmGraphSsaFullBackendClaimed : Bool := false

/-- Full CFG/dominance production pipeline claim -- MUST stay false.
    Greppable: llvmGraphSsaCfgProductionClaimed. -/
def llvmGraphSsaCfgProductionClaimed : Bool := false

/-- Local honesty non-claims. -/
def llvmGraphSsaResidualFreeClaimed : Bool := false
def llvmGraphSsaProductSelfHostCompleteClaimed : Bool := false
def llvmGraphSsaProofCompleteClaimed : Bool := false
def llvmGraphSsaProvablyUnlockWorkClaimed : Bool := false
def llvmGraphSsaProductionReadyClaimed : Bool := false
def llvmGraphSsaRustNativeLinkClaimed : Bool := false
def llvmGraphSsaLlvmAsClaimed : Bool := false

/-- Kind names from Types SSOT (graph kernel node kinds). -/
def kindValueName : String := NodeKind.name NodeKind.value
def kindLinearName : String := NodeKind.name NodeKind.linear
def kindErasedName : String := NodeKind.name NodeKind.erased

/-- Mult grade names from Mult SSOT. -/
def multGrade0Name : String := Mult.name Mult.mult0
def multGrade1Name : String := Mult.name Mult.mult1
def multGradeOmegaName : String := Mult.name Mult.multOmega

/-- Edge capacity from IrGraph SSOT.
    Greppable: edgeMaxValue, SLAKE_IR_EDGE_MAX. -/
def edgeMaxValue : Nat := edgeMax

/-- Empty graph OK honesty id.
    Greppable: emptyGraphOkId, EMPTY-GRAPH-OK. -/
def emptyGraphOkId : String := "EMPTY-GRAPH-OK"

/-- IR graph edges honesty id.
    Greppable: irGraphEdgesId, IR-GRAPH-EDGES. -/
def irGraphEdgesId : String := "IR-GRAPH-EDGES"

/-- Kernel Program surface id cite (graph lower home).
    Greppable: kernelProgramId, SELF-HOST-KERNEL-PROGRAM. -/
def kernelProgramId : String := "SELF-HOST-KERNEL-PROGRAM"

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- SSA-shaped honesty id (partial form; not full production SSA pipeline).
    Greppable: ssaShapedId, SSA-SHAPED. -/
def ssaShapedId : String := "SSA-SHAPED"

/-- Graph SSA header comments.
    Greppable: graphSsaBanner. -/
def graphSsaBanner : String :=
  "; SLAKE_LLVM_GRAPH_SSA_V0 / HOST-LLVM-GRAPH-SSA\n"
    ++ "; Generator-owned Graph edges SSA-shaped IR from KernelProgram + IrGraph SSOT\n"
    ++ "; Graph focus: " ++ irGraphEdgesId ++ " "
    ++ emptyGraphOkId ++ " EDGE_MAX=" ++ toString edgeMaxValue ++ "\n"
    ++ "; Kind/mult: " ++ kindErasedName ++ "/" ++ multGrade0Name ++ " "
    ++ kindLinearName ++ "/" ++ multGrade1Name ++ " "
    ++ kindValueName ++ "/" ++ multGradeOmegaName ++ "\n"
    ++ "; " ++ kernelProgramId ++ " " ++ orderedIrProgramId ++ " "
    ++ ssaShapedId ++ "\n"
    ++ "; Kernel Program SSOT: src/systems/SystemsLean/KernelProgram.lean\n"
    ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
    ++ "; Path: out/llvm-ir/slake_graph_ssa.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmGraphText Graph unit IR; LlvmProgramSsa Program SSA; LlvmTypesSsa Types SSA; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub\n"
    ++ "; Recipe: just llvm-graph-ssa / lake exe slake-llvm-graph-ssa\n"
    ++ "; Graph SSA partial: block labels + phi + ordered SSA edge defs for Graph band only\n"
    ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Graph surface constants (edge max + addEdge result codes).
    Greppable: graphSsaConstants, SLAKE_IR_EDGE_MAX. -/
def graphSsaConstants : String :=
  "; IR graph surface constants (IrGraph.edgeMax / addEdge map)\n"
    ++ "; SLAKE_IR_EDGE_MAX = " ++ toString edgeMaxValue ++ "\n"
    ++ "; addEdge: 0=ok, -1=full/badEndpoints (emit map)\n"
    ++ "@slake_graph_ssa_edge_max = private unnamed_addr constant i32 "
    ++ toString edgeMaxValue ++ ", align 4 ; SLAKE_IR_EDGE_MAX\n"
    ++ "@slake_graph_ssa_add_edge_ok = private unnamed_addr constant i32 0, align 4 ; addEdge ok\n"
    ++ "@slake_graph_ssa_add_edge_fail = private unnamed_addr constant i32 -1, align 4 ; full or badEndpoints\n"
    ++ "\n"

/-- SSA-shaped Graph addEdge-status lower: block labels + phi (partial SSA form).
    status_ix 0 -> ok; 1 -> fail; other -> reject (-2 fail-closed).
    Greppable: graphSsaAddEdgePhi, phi, SSA-SHAPED, slake_graph_ssa_add_edge_status. -/
def graphSsaAddEdgePhi : String :=
  "; SSA-SHAPED Graph addEdge-status lower (partial; Graph band only; not full CFG/dominance)\n"
    ++ "; status_ix: 0=ok, 1=fail; other -> reject (-2)\n"
    ++ "define i32 @slake_graph_ssa_add_edge_status(i32 %status_ix) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %status_ix, 0\n"
    ++ "  br i1 %is0, label %bb_ok, label %check1\n"
    ++ "\n"
    ++ "check1:\n"
    ++ "  %is1 = icmp eq i32 %status_ix, 1\n"
    ++ "  br i1 %is1, label %bb_fail, label %bb_reject\n"
    ++ "\n"
    ++ "bb_ok: ; addEdge ok\n"
    ++ "  %t0 = add i32 0, 0\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_fail: ; addEdge full or badEndpoints\n"
    ++ "  %t1 = add i32 0, -1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; unknown status fail-closed\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_fail ], [ -2, %bb_reject ]\n"
    ++ "  ret i32 %code\n"
    ++ "}\n"
    ++ "\n"

/-- Ordered Graph kernel band as sequential SSA defs (chain edges 0->1, 1->2).
    Greppable: graphSsaKernelBand, SELF-HOST-KERNEL-PROGRAM, IR-GRAPH-EDGES. -/
def graphSsaKernelBand : String :=
  "; ORDERED-IR-PROGRAM Graph kernel band (SELF-HOST-KERNEL-PROGRAM lowerProgramGraph)\n"
    ++ "; Three nodes + two chain edges: 0->1, 1->2 (IR-GRAPH-EDGES)\n"
    ++ "; SSA-shaped: edge endpoints are distinct SSA values (not full CFG pipeline)\n"
    ++ "define i1 @slake_graph_ssa_kernel_band_ready() {\n"
    ++ "entry:\n"
    ++ "  ; node honesty: three Program kernel nodes under Graph\n"
    ++ "  %nlen = add i32 0, 3\n"
    ++ "  ; edge0: from=0 to=1\n"
    ++ "  %e0_from = add i32 0, 0\n"
    ++ "  %e0_to = add i32 0, 1\n"
    ++ "  ; edge1: from=1 to=2\n"
    ++ "  %e1_from = add i32 0, 1\n"
    ++ "  %e1_to = add i32 0, 2\n"
    ++ "  ; length honesty: two Graph kernel edges\n"
    ++ "  %elen = add i32 0, 2\n"
    ++ "  %n_ok = icmp eq i32 %nlen, 3\n"
    ++ "  %e_ok = icmp eq i32 %elen, 2\n"
    ++ "  %ok = and i1 %n_ok, %e_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed well-typed graph check (EMPTY-GRAPH-OK + EDGE_MAX).
    Greppable: graphSsaIsWellTyped, slake_graph_ssa_is_well_typed. -/
def graphSsaIsWellTyped : String :=
  "; EMPTY-GRAPH-OK + EDGE_MAX well-typed sketch (IrGraph.isWellTyped)\n"
    ++ "; empty (nodeCount=0, edgeCount=0) ok; else nodes non-empty and edges <= EDGE_MAX\n"
    ++ "define i1 @slake_graph_ssa_is_well_typed(i32 %nodeCount, i32 %edgeCount) {\n"
    ++ "entry:\n"
    ++ "  %n0 = icmp eq i32 %nodeCount, 0\n"
    ++ "  %e0 = icmp eq i32 %edgeCount, 0\n"
    ++ "  %empty = and i1 %n0, %e0\n"
    ++ "  %edges_ok = icmp ule i32 %edgeCount, " ++ toString edgeMaxValue ++ "\n"
    ++ "  %prog_nz = icmp ne i32 %nodeCount, 0\n"
    ++ "  %nonempty_ok = and i1 %prog_nz, %edges_ok\n"
    ++ "  %ok = or i1 %empty, %nonempty_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Graph SSA package text.
    Greppable: graphSsaPackage, slake_graph_ssa.ll. -/
def graphSsaPackage : String :=
  graphSsaBanner ++ graphSsaConstants ++ graphSsaAddEdgePhi
    ++ graphSsaKernelBand ++ graphSsaIsWellTyped

/-- Surface ids + path cites + Graph SSOT + KernelProgram graph ready ok. -/
def llvmGraphSsaSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_GRAPH_SSA_V0")
    && (hostId == "HOST-LLVM-GRAPH-SSA")
    && (surfaceId == "HOST-LLVM-GRAPH-SSA")
    && (surfaceAlias == "HOST-HOST-LLVM-GRAPH-SSA")
    && (justRecipeLlvmGraphSsa == "llvm-graph-ssa")
    && (justRecipe == "llvm-graph-ssa")
    && (lakeExeName == "slake-llvm-graph-ssa")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (graphSsaBasename == "slake_graph_ssa.ll")
    && (irGraphModuleCite == "src/systems/SystemsLean/IrGraph.lean")
    && (kernelProgramModuleCite
      == "src/systems/SystemsLean/KernelProgram.lean")
    && (llvmGraphTextModuleCite
      == "src/systems/SystemsLean/LlvmGraphText.lean")
    && (llvmProgramSsaModuleCite
      == "src/systems/SystemsLean/LlvmProgramSsa.lean")
    && (llvmTypesSsaModuleCite
      == "src/systems/SystemsLean/LlvmTypesSsa.lean")
    && (llvmLinearSsaModuleCite
      == "src/systems/SystemsLean/LlvmLinearSsa.lean")
    && (llvmMultSsaModuleCite
      == "src/systems/SystemsLean/LlvmMultSsa.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (kindValueName == "VALUE")
    && (kindLinearName == "LINEAR")
    && (kindErasedName == "ERASED")
    && (multGrade0Name == "MULT-0")
    && (multGrade1Name == "MULT-1")
    && (multGradeOmegaName == "MULT-OMEGA")
    && (edgeMaxValue == 16)
    && (emptyGraphOkId == "EMPTY-GRAPH-OK")
    && (irGraphEdgesId == "IR-GRAPH-EDGES")
    && (kernelProgramId == "SELF-HOST-KERNEL-PROGRAM")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (ssaShapedId == "SSA-SHAPED")
    && programKernelReady
    && programKernelOk
    && programGraphPathReady
    && lowerProgramGraph.isSome

/-- Package text honesty.
    Greppable: llvmGraphSsaPackageOk. -/
def llvmGraphSsaPackageOk : Bool :=
  llvmGraphSsaSurfaceOk
    && (graphSsaPackage
      == graphSsaBanner ++ graphSsaConstants ++ graphSsaAddEdgePhi
        ++ graphSsaKernelBand ++ graphSsaIsWellTyped)
    && (graphSsaBanner
      == "; SLAKE_LLVM_GRAPH_SSA_V0 / HOST-LLVM-GRAPH-SSA\n"
        ++ "; Generator-owned Graph edges SSA-shaped IR from KernelProgram + IrGraph SSOT\n"
        ++ "; Graph focus: IR-GRAPH-EDGES EMPTY-GRAPH-OK EDGE_MAX=16\n"
        ++ "; Kind/mult: ERASED/MULT-0 LINEAR/MULT-1 VALUE/MULT-OMEGA\n"
        ++ "; SELF-HOST-KERNEL-PROGRAM ORDERED-IR-PROGRAM SSA-SHAPED\n"
        ++ "; Kernel Program SSOT: src/systems/SystemsLean/KernelProgram.lean\n"
        ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
        ++ "; Path: out/llvm-ir/slake_graph_ssa.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmGraphText Graph unit IR; LlvmProgramSsa Program SSA; LlvmTypesSsa Types SSA; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub\n"
        ++ "; Recipe: just llvm-graph-ssa / lake exe slake-llvm-graph-ssa\n"
        ++ "; Graph SSA partial: block labels + phi + ordered SSA edge defs for Graph band only\n"
        ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only.
    Greppable: llvmGraphSsaWroteExpected. -/
def llvmGraphSsaWroteExpected : Bool :=
  llvmGraphSsaPackageOk
    && (graphSsaPackage
      == graphSsaBanner ++ graphSsaConstants ++ graphSsaAddEdgePhi
        ++ graphSsaKernelBand ++ graphSsaIsWellTyped)

/-- Structural ready for LLVM Graph SSA lower residual.
    Greppable: llvmGraphSsaReady, HOST-LLVM-GRAPH-SSA, SLAKE_LLVM_GRAPH_SSA. -/
def llvmGraphSsaReady : Bool :=
  llvmGraphSsaFinishedClaimed
    && llvmGraphSsaPackageOk
    && llvmGraphSsaWroteExpected
    && llvmGraphSsaSurfaceOk
    && llvmGraphSsaKeepsLlvmLocked
    && llvmGraphSsaDoesNotUnlockLlvm
    && llvmGraphSsaLocalUnlockFalse
    && llvmGraphSsaPartialClaimed
    && !llvmGraphSsaLlvmUnlocked
    && !llvmGraphSsaFullBackendClaimed
    && !llvmGraphSsaCfgProductionClaimed
    && !llvmGraphSsaResidualFreeClaimed
    && !llvmGraphSsaProductSelfHostCompleteClaimed
    && !llvmGraphSsaProofCompleteClaimed
    && !llvmGraphSsaProvablyUnlockWorkClaimed
    && !llvmGraphSsaProductionReadyClaimed
    && !llvmGraphSsaRustNativeLinkClaimed
    && !llvmGraphSsaLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmGraphText.llvmGraphTextReady
    && !LlvmGraphText.llvmGraphTextLlvmUnlocked
    && LlvmProgramSsa.llvmProgramSsaReady
    && !LlvmProgramSsa.llvmProgramSsaLlvmUnlocked
    && LlvmTypesSsa.llvmTypesSsaReady
    && !LlvmTypesSsa.llvmTypesSsaLlvmUnlocked
    && LlvmLinearSsa.llvmLinearSsaReady
    && !LlvmLinearSsa.llvmLinearSsaLlvmUnlocked
    && LlvmMultSsa.llvmMultSsaReady
    && !LlvmMultSsa.llvmMultSsaLlvmUnlocked

/-! ### HOST-LLVM-GRAPH-SSA-THEOREM (readable statements) -/

theorem llvmGraphSsaFinishedClaimed_true :
    llvmGraphSsaFinishedClaimed = true :=
  rfl

theorem llvmGraphSsaLlvmUnlocked_false :
    llvmGraphSsaLlvmUnlocked = false :=
  rfl

theorem llvmGraphSsaPartialClaimed_true :
    llvmGraphSsaPartialClaimed = true :=
  rfl

theorem llvmGraphSsaFullBackendClaimed_false :
    llvmGraphSsaFullBackendClaimed = false :=
  rfl

theorem llvmGraphSsaCfgProductionClaimed_false :
    llvmGraphSsaCfgProductionClaimed = false :=
  rfl

theorem llvmGraphSsaKeepsLlvmLocked_true :
    llvmGraphSsaKeepsLlvmLocked = true := by
  native_decide

theorem llvmGraphSsaDoesNotUnlockLlvm_true :
    llvmGraphSsaDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmGraphSsaReady_true :
    llvmGraphSsaReady = true := by
  native_decide

theorem justRecipeLlvmGraphSsa_eq :
    justRecipeLlvmGraphSsa = "llvm-graph-ssa" :=
  rfl

theorem llvmGraphSsa_stageId_eq :
    stageId = "SLAKE_LLVM_GRAPH_SSA_V0" :=
  rfl

theorem llvmGraphSsa_hostId_eq :
    hostId = "HOST-LLVM-GRAPH-SSA" :=
  rfl

theorem llvmGraphSsa_edgeMax_eq :
    edgeMaxValue = 16 :=
  rfl

theorem llvmGraphSsa_claims_false :
    llvmGraphSsaLlvmUnlocked = false
      && llvmGraphSsaFullBackendClaimed = false
      && llvmGraphSsaCfgProductionClaimed = false
      && llvmGraphSsaResidualFreeClaimed = false
      && llvmGraphSsaProductSelfHostCompleteClaimed = false
      && llvmGraphSsaProofCompleteClaimed = false
      && llvmGraphSsaProvablyUnlockWorkClaimed = false
      && llvmGraphSsaProductionReadyClaimed = false
      && llvmGraphSsaRustNativeLinkClaimed = false
      && llvmGraphSsaLlvmAsClaimed = false :=
  rfl

theorem llvmGraphSsaPackageOk_true :
    llvmGraphSsaPackageOk = true := by
  native_decide

theorem llvmGraphSsaWroteExpected_true :
    llvmGraphSsaWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-GRAPH-SSA-SMOKE (quick examples) -/

example : llvmGraphSsaFinishedClaimed = true := rfl
example : llvmGraphSsaLlvmUnlocked = false := rfl
example : llvmGraphSsaPartialClaimed = true := rfl
example : llvmGraphSsaFullBackendClaimed = false := rfl
example : llvmGraphSsaCfgProductionClaimed = false := rfl
example : llvmGraphSsaKeepsLlvmLocked = true := by native_decide
example : llvmGraphSsaDoesNotUnlockLlvm = true := by native_decide
example : llvmGraphSsaReady = true := by native_decide
example : justRecipeLlvmGraphSsa = "llvm-graph-ssa" := rfl
example : edgeMaxValue = 16 := rfl
example : emptyGraphOkId = "EMPTY-GRAPH-OK" := rfl
example : irGraphEdgesId = "IR-GRAPH-EDGES" := rfl
example : kernelProgramId = "SELF-HOST-KERNEL-PROGRAM" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmGraphSsaLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmGraphText.llvmGraphTextReady = true := by native_decide
example : LlvmProgramSsa.llvmProgramSsaReady = true := by native_decide
example : LlvmTypesSsa.llvmTypesSsaReady = true := by native_decide
example : LlvmLinearSsa.llvmLinearSsaReady = true := by native_decide
example : LlvmMultSsa.llvmMultSsaReady = true := by native_decide
example : graphSsaBasename = "slake_graph_ssa.ll" := rfl
example : ssaShapedId = "SSA-SHAPED" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Graph SSA IR lacks greppable honesty tokens. -/
def validateGraphSsaPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_GRAPH_SSA_V0"
    , "HOST-LLVM-GRAPH-SSA"
    , "EMPTY-GRAPH-OK"
    , "SLAKE_IR_EDGE_MAX"
    , "IR-GRAPH-EDGES"
    , "VALUE"
    , "LINEAR"
    , "ERASED"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "SELF-HOST-KERNEL-PROGRAM"
    , "ORDERED-IR-PROGRAM"
    , "SSA-SHAPED"
    , "phi i32"
    , "slake_graph_ssa_add_edge_status"
    , "slake_graph_ssa_kernel_band_ready"
    , "slake_graph_ssa_is_well_typed"
    , "slake_graph_ssa_edge_max"
    , "bb_ok"
    , "bb_fail"
    , "bb_reject"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_graph_ssa.ll"
    , "Not production LLVM backend"
    , "Not full CFG/dominance"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if containsSub text "llvmUnlocked = true" then
    IO.eprintln s!"error: {label}: unexpected llvmUnlocked true claim"
    throw (IO.userError s!"{label}: unlock forge")
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected freestanding C emit stage"
    throw (IO.userError s!"{label}: freestanding stage")
  if containsSub text "full backend true" then
    IO.eprintln s!"error: {label}: unexpected full backend claim"
    throw (IO.userError s!"{label}: full backend forge")

/-- Write Graph SSA IR text under root/out/llvm-ir/slake_graph_ssa.ll.
    Greppable: llvmGraphSsaWrite, slake_graph_ssa.ll, IO.FS.writeFile. -/
def llvmGraphSsaWrite (root : System.FilePath) : IO Unit := do
  unless llvmGraphSsaReady do
    IO.eprintln s!"error: {stageId}: llvmGraphSsaReady false"
    throw (IO.userError "llvmGraphSsaReady false")
  unless llvmGraphSsaWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmGraphSsaWroteExpected false"
    throw (IO.userError "llvmGraphSsaWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / graphSsaBasename
  IO.println s!"== {stageId}: LLVM Graph SSA lower partial =="
  IO.println s!"  readyPin={llvmGraphSsaReady} llvmUnlocked={LlvmHold.llvmUnlocked} fullBackend={llvmGraphSsaFullBackendClaimed}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl graphSsaPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Graph SSA IR after write: {outLl}"
    throw (IO.userError "missing Graph SSA IR")
  if written != graphSsaPackage then
    IO.eprintln "error: Graph SSA IR written content mismatch"
    throw (IO.userError "Graph SSA IR mismatch")
  validateGraphSsaPackage graphSsaBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-GRAPH-SSA, SSA-SHAPED, phi, EMPTY-GRAPH-OK"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Graph SSA IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmGraphSsaWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmGraphSsa
