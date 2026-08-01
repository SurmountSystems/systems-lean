/* GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT_V0 body
 * Host-built Graph subset freestanding C (ideal ladder M1).
 * Input: SLAKE_GRAPH_SUBSET_GRAPH; dialect HOST-EMIT-GRAPH.
 * Not full slake_freestanding.c regenerate; Graph unit only.
 * RUNTIME-FS; IR_GRAPH_EDGES_V0; SLAKE_IR_EDGE_MAX; no product GC.
 * Not full CFG/SSA.
 */

/* ---- IR_GRAPH_EDGES_V0 (edges over ordered IR program; not residual free) ----
 * Endpoints are indices into prog.nodes. Thin call-through to program APIs.
 * Empty edges OK. Empty graph (no nodes) is well-typed at graph surface.
 * Shared linear/erased handles remain V0 honesty for checks.
 * Greppable types: slake_ir_graph, slake_ir_edge, SLAKE_IR_EDGE_MAX.
 * HOST-EMIT-GRAPH: dialect from SystemsLean.EmitGraph + host_emit_graph.ssot.txt
 * (Lean FreestandingEmit embeds this IR graph product text).
 */

const char *slake_ir_graph_id(void)
{
  return "IR_GRAPH_EDGES_V0";
}

int slake_ir_graph_init(slake_ir_graph *g)
{
  uint8_t i;

  if (g == 0) {
    return -1;
  }
  if (slake_ir_program_init(&g->prog) != 0) {
    return -1;
  }
  g->edge_count = 0;
  g->valid = 1;
  for (i = 0; i < (uint8_t)SLAKE_IR_EDGE_MAX; i++) {
    g->edges[i].from = 0;
    g->edges[i].to = 0;
    g->edges[i].valid = 0;
  }
  return 0;
}

int slake_ir_graph_push_node(slake_ir_graph *g, uint32_t type_tag,
                             enum slake_mult mult, enum slake_ir_kind kind)
{
  if (g == 0 || g->valid == 0) {
    return -1;
  }
  return slake_ir_program_push(&g->prog, type_tag, mult, kind);
}

int slake_ir_graph_add_edge(slake_ir_graph *g, uint8_t from, uint8_t to)
{
  if (g == 0 || g->valid == 0) {
    return -1;
  }
  if (g->edge_count >= (uint8_t)SLAKE_IR_EDGE_MAX) {
    return -1; /* full; leave edge_count unchanged */
  }
  /* Endpoints must reference live program nodes. */
  if (from >= g->prog.count || to >= g->prog.count) {
    return -1;
  }
  g->edges[g->edge_count].from = from;
  g->edges[g->edge_count].to = to;
  g->edges[g->edge_count].valid = 1;
  g->edge_count = (uint8_t)(g->edge_count + 1);
  return 0;
}

int slake_ir_graph_is_well_typed(const slake_ir_graph *g)
{
  uint8_t i;

  if (g == 0) {
    return 0;
  }
  if (g->valid == 0) {
    return 0;
  }
  if (g->edge_count > (uint8_t)SLAKE_IR_EDGE_MAX) {
    return 0;
  }
  /* Empty valid graph (no nodes, no edges): well-typed at graph surface. */
  if (g->prog.count == 0) {
    if (g->edge_count != 0) {
      return 0;
    }
    return 1;
  }
  if (slake_ir_program_is_well_typed(&g->prog) != 1) {
    return 0;
  }
  /* Empty edges OK when program is well-typed. */
  for (i = 0; i < g->edge_count; i++) {
    if (g->edges[i].valid != 1) {
      return 0;
    }
    if (g->edges[i].from >= g->prog.count || g->edges[i].to >= g->prog.count) {
      return 0;
    }
  }
  return 1;
}

int slake_ir_graph_check_fail_closed(const slake_ir_graph *g,
    const slake_linear_token *linear,
    const slake_erased *erased)
{
  /* Ill-typed / null graph -> FAIL_CLOSED before program call-through. */
  if (slake_ir_graph_is_well_typed(g) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  /* Empty well-typed graph: no nodes to check. */
  if (g->prog.count == 0) {
    return (int)SLAKE_EXTRACT_OK;
  }
  return slake_ir_program_check_fail_closed(&g->prog, linear, erased);
}
