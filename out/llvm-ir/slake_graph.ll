; SLAKE_LLVM_GRAPH_TEXT_V0 / HOST-LLVM-GRAPH-TEXT
; Generator-owned IR graph unit LLVM IR fragment from Systems Lean Graph SSOT
; IR-GRAPH-EDGES SLAKE_IR_EDGE_MAX=16 EMPTY-GRAPH-OK
; Surface: edgeMax addEdge pushNode isWellTyped checkFailClosed (not full CFG not SSA)
; Graph SSOT: src/systems/SystemsLean/IrGraph.lean
; Path: out/llvm-ir/slake_graph.ll (Lean IO.FS.writeFile)
; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmProgramText Program IR; LlvmTypesText Types IR; LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub
; Recipe: just llvm-graph-text / lake exe slake-llvm-graph-text
; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.
; Not full CFG. Not dominance. Not SSA. Not a second IR dialect.

; IR graph surface constants (IrGraph.edgeMax / addEdge / pushNode map)
; SLAKE_IR_EDGE_MAX = 16
; addEdge: 0=ok, -1=full/out-of-range (emit map)
; pushNode: 0=ok, -1=badNode, -2=full (via program push)
@slake_graph_edge_max = private unnamed_addr constant i32 16, align 4 ; SLAKE_IR_EDGE_MAX
@slake_graph_add_edge_ok = private unnamed_addr constant i32 0, align 4 ; addEdge ok
@slake_graph_add_edge_fail = private unnamed_addr constant i32 -1, align 4 ; full or badEndpoints
@slake_graph_push_node_ok = private unnamed_addr constant i32 0, align 4 ; pushNode ok
@slake_graph_push_node_bad = private unnamed_addr constant i32 -1, align 4 ; badNode
@slake_graph_push_node_full = private unnamed_addr constant i32 -2, align 4 ; full

; EMPTY-GRAPH-OK (IrGraph.isWellTyped empty is true)
; empty graph (no nodes, no edges) is well-typed at graph surface
; Nested empty program alone stays EMPTY-PROGRAM-FAIL-CLOSED under IrProgram
define i1 @slake_graph_is_well_typed_empty() {
entry:
  ret i1 true
}

; isWellTyped sketch (empty OK; else non-empty program + edges under EDGE_MAX)
; Oversize edge count (edgeCount > EDGE_MAX) fails closed
define i1 @slake_graph_is_well_typed(i32 %nodeCount, i32 %edgeCount) {
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

; checkFailClosed sketch (same bar as isWellTyped on host V0)
define i1 @slake_graph_check_fail_closed(i32 %nodeCount, i32 %edgeCount) {
entry:
  %ok = call i1 @slake_graph_is_well_typed(i32 %nodeCount, i32 %edgeCount)
  ret i1 %ok
}

; addEdge capacity sketch: full when edgeCount >= EDGE_MAX (returns -1)
; 0=ok path when edgeCount < EDGE_MAX and endpoints in range (endpoint check omitted here)
define i32 @slake_graph_add_edge_capacity(i32 %edgeCount) {
entry:
  %full = icmp uge i32 %edgeCount, 16
  %r = select i1 %full, i32 -1, i32 0
  ret i32 %r
}

; edgesSound sketch: edgeCount <= EDGE_MAX (endpoint range omitted in text fragment)
define i1 @slake_graph_edges_sound(i32 %edgeCount) {
entry:
  %ok = icmp ule i32 %edgeCount, 16
  ret i1 %ok
}
