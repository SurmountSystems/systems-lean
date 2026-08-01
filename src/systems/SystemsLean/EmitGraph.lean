/-
  SYSTEMS_LEAN_HOST partial -- host-owned IR graph freestanding C product text.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): IrGraph.lean edges; emit slake_ir_graph_*;
    self-host.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_EMIT_GRAPH_V0 / HOST-EMIT-GRAPH / SELF-HOST-EMIT-GRAPH:
    Lean owns freestanding IR graph edges product C text
    (slake_ir_graph + SLAKE_IR_EDGE_MAX + edge + init/push_node/add_edge/
    is_well_typed/check_fail_closed).
  - Scaffolding text + emitGraphReady live in SystemsLean.EmitGraphScaffold
    (same namespace; long-file peel). Greppable: graphHeaderFragment,
    graphBodyFragment, emitGraphReady, SLAKE_SELF_HOST_EMIT_GRAPH_V0.
  - Durable artifact: src/systems/emit/host_emit_graph.ssot.txt
    (GRAPH_C_HEADER / GRAPH_C_BODY blocks match graphHeaderFragment /
    graphBodyFragment).
  - FreestandingEmit embeds IR graph product text from the durable SSOT
    artifact; it must not invent a second IR graph dialect.
  - IR_GRAPH_EDGES_V0 / SLAKE_IR_EDGE_MAX / slake_ir_graph greppable on wire.
  - emitGraphReady: surface + honesty piece equality (scaffold).
  - No new EMIT_GRAPH_V0 residual C stage ladder (host stage ids only).
  - Contiguous IR graph after Program on product wire (depends on program).

  Intentional non-claims / partial parity:
  - PARTIAL: IR graph product C text SSoT only; not full product module emit;
    not compiler self-application; host compose product text is HOST-EMIT-COMPOSE.
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Does not put elaborator CFG / SSA on freestanding C.
  - Product wire stage id IR_GRAPH_EDGES_V0 remains on the wire (map only).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_GRAPH_V0, HOST-EMIT-GRAPH,
  SELF-HOST-EMIT-GRAPH, EMIT-GRAPH-SMOKE, HOST-EMIT-GRAPH-SMOKE,
  IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX, slake_ir_graph, slake_ir_edge,
  slake_ir_graph_init, slake_ir_graph_push_node, slake_ir_graph_add_edge,
  slake_ir_graph_is_well_typed, slake_ir_graph_check_fail_closed,
  graphHeaderFragment, graphBodyFragment, emitGraphReady, NON-SSOT, RUNTIME-FS,
  EMIT-GRAPH-PRODUCT-SMOKE, EmitGraphScaffold, theorem emitGraphReady_true,
  UNIT_SURFACE host surface. Module: SystemsLean.EmitGraph
  Long-file peel: HOST-EMIT-GRAPH scaffolding in SystemsLean.EmitGraphScaffold
  (same namespace). Product-text ownership only.
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.EmitGraphScaffold

namespace SystemsLean.EmitGraph

/-! ### HOST-EMIT-GRAPH scaffolding peeled to EmitGraphScaffold (same namespace)
    Greppable cites (defs live on EmitGraphScaffold): HOST-EMIT-GRAPH,
    SELF-HOST-EMIT-GRAPH, SLAKE_SELF_HOST_EMIT_GRAPH_V0, graphHeaderFragment,
    graphBodyFragment, emitGraphReady, emitGraphOk, ownershipHonestyOk,
    headerHonestyOk, bodyHonestyOk, emitGraphSurfaceOk, EMIT-GRAPH-SMOKE,
    HOST-EMIT-GRAPH-SMOKE, EMIT-GRAPH-PRODUCT-SMOKE, EmitGraphScaffold,
    theorem emitGraphReady_true, NON-SSOT,
    src/systems/emit/host_emit_graph.ssot.txt,
    src/systems/SystemsLean/EmitGraph.lean,
    slake_ir_graph, slake_ir_edge, slake_ir_graph_init, slake_ir_graph_push_node,
    slake_ir_graph_add_edge, slake_ir_graph_is_well_typed,
    slake_ir_graph_check_fail_closed, IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX.
    Import SystemsLean.EmitGraphScaffold above. Product-text ownership only --
    not residual free / not complete. -/

end SystemsLean.EmitGraph
