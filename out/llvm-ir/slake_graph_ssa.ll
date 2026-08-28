; SLAKE_LLVM_GRAPH_SSA_V0 / HOST-LLVM-GRAPH-SSA
; Generator-owned Graph edges SSA-shaped IR from KernelProgram + IrGraph SSOT
; Graph focus: IR-GRAPH-EDGES EMPTY-GRAPH-OK EDGE_MAX=16
; Kind/mult: ERASED/MULT-0 LINEAR/MULT-1 VALUE/MULT-OMEGA
; SELF-HOST-KERNEL-PROGRAM ORDERED-IR-PROGRAM SSA-SHAPED
; Kernel Program SSOT: src/systems/SystemsLean/KernelProgram.lean
; Graph SSOT: src/systems/SystemsLean/IrGraph.lean
; Path: out/llvm-ir/slake_graph_ssa.ll (Lean IO.FS.writeFile)
; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmGraphText Graph unit IR; LlvmProgramSsa Program SSA; LlvmTypesSsa Types SSA; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub
; Recipe: just llvm-graph-ssa / lake exe slake-llvm-graph-ssa
; Graph SSA partial: block labels + phi + ordered SSA edge defs for Graph band only
; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; IR graph surface constants (IrGraph.edgeMax / addEdge map)
; SLAKE_IR_EDGE_MAX = 16
; addEdge: 0=ok, -1=full/badEndpoints (emit map)
@slake_graph_ssa_edge_max = private unnamed_addr constant i32 16, align 4 ; SLAKE_IR_EDGE_MAX
@slake_graph_ssa_add_edge_ok = private unnamed_addr constant i32 0, align 4 ; addEdge ok
@slake_graph_ssa_add_edge_fail = private unnamed_addr constant i32 -1, align 4 ; full or badEndpoints

; SSA-SHAPED Graph addEdge-status lower (partial; Graph band only; not full CFG/dominance)
; status_ix: 0=ok, 1=fail; other -> reject (-2)
define i32 @slake_graph_ssa_add_edge_status(i32 %status_ix) {
entry:
  %is0 = icmp eq i32 %status_ix, 0
  br i1 %is0, label %bb_ok, label %check1

check1:
  %is1 = icmp eq i32 %status_ix, 1
  br i1 %is1, label %bb_fail, label %bb_reject

bb_ok: ; addEdge ok
  %t0 = add i32 0, 0
  br label %merge

bb_fail: ; addEdge full or badEndpoints
  %t1 = add i32 0, -1
  br label %merge

bb_reject: ; unknown status fail-closed
  br label %merge

merge:
  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_fail ], [ -2, %bb_reject ]
  ret i32 %code
}

; ORDERED-IR-PROGRAM Graph kernel band (SELF-HOST-KERNEL-PROGRAM lowerProgramGraph)
; Three nodes + two chain edges: 0->1, 1->2 (IR-GRAPH-EDGES)
; SSA-shaped: edge endpoints are distinct SSA values (not full CFG pipeline)
define i1 @slake_graph_ssa_kernel_band_ready() {
entry:
  ; node honesty: three Program kernel nodes under Graph
  %nlen = add i32 0, 3
  ; edge0: from=0 to=1
  %e0_from = add i32 0, 0
  %e0_to = add i32 0, 1
  ; edge1: from=1 to=2
  %e1_from = add i32 0, 1
  %e1_to = add i32 0, 2
  ; length honesty: two Graph kernel edges
  %elen = add i32 0, 2
  %n_ok = icmp eq i32 %nlen, 3
  %e_ok = icmp eq i32 %elen, 2
  %ok = and i1 %n_ok, %e_ok
  ret i1 %ok
}

; EMPTY-GRAPH-OK + EDGE_MAX well-typed sketch (IrGraph.isWellTyped)
; empty (nodeCount=0, edgeCount=0) ok; else nodes non-empty and edges <= EDGE_MAX
define i1 @slake_graph_ssa_is_well_typed(i32 %nodeCount, i32 %edgeCount) {
entry:
  %n0 = icmp eq i32 %nodeCount, 0
  %e0 = icmp eq i32 %edgeCount, 0
  %empty = and i1 %n0, %e0
  %edges_ok = icmp ule i32 %edgeCount, 16
  %prog_nz = icmp ne i32 %nodeCount, 0
  %nonempty_ok = and i1 %prog_nz, %edges_ok
  %ok = or i1 %empty, %nonempty_ok
  ret i1 %ok
}
