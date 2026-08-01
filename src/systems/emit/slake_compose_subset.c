/* COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT_V0 body
 * Host-built Compose subset freestanding C (ideal ladder M1).
 * Input: SLAKE_COMPOSE_SUBSET_COMPOSE; dialect HOST-EMIT-COMPOSE.
 * Not full slake_freestanding.c regenerate; Compose unit only.
 * RUNTIME-FS; HOST_COMPOSE_V0; IR_GRAPH_EDGES_V0; no product GC.
 * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.
 * Not full CFG/SSA.
 */

/* ---- HOST_COMPOSE_V0 (host + IR graph composition; not residual free) ----
 * Mutators (mint/consume/push/add_edge/mark_erased) are thin call-throughs.
 * check_fail_closed: intentional mult pre-scan for host ownership, then
 * graph check (see header). MULT-1 needs live host; MULT-0 needs marked erased.
 * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.
 * Greppable: HOST_COMPOSE_V0, CONSUME_TOKEN_HOST_V0, IR_GRAPH_EDGES_V0,
 * EMIT-BOUNDARY, RUNTIME-FS.
 * HOST-EMIT-COMPOSE: dialect from SystemsLean.EmitCompose + host_emit_compose.ssot.txt
 * (Lean FreestandingEmit embeds this host compose product text).
 */

const char *slake_host_compose_id(void)
{
  return "HOST_COMPOSE_V0";
}

int slake_host_compose_init(slake_host_compose *hc)
{
  if (hc == 0) {
    return -1;
  }
  if (slake_ir_graph_init(&hc->graph) != 0) {
    return -1;
  }
  if (slake_consume_token_init(&hc->host) != 0) {
    return -1;
  }
  hc->erased.marked = 0;
  hc->valid = 1;
  return 0;
}

int slake_host_compose_push_node(slake_host_compose *hc, uint32_t type_tag,
    enum slake_mult mult, enum slake_ir_kind kind)
{
  if (hc == 0 || hc->valid == 0) {
    return -1;
  }
  return slake_ir_graph_push_node(&hc->graph, type_tag, mult, kind);
}

int slake_host_compose_add_edge(slake_host_compose *hc, uint8_t from, uint8_t to)
{
  if (hc == 0 || hc->valid == 0) {
    return -1;
  }
  return slake_ir_graph_add_edge(&hc->graph, from, to);
}

int slake_host_compose_mint(slake_host_compose *hc, uint32_t id)
{
  if (hc == 0 || hc->valid == 0) {
    return -1;
  }
  return slake_consume_token_mint(&hc->host, id);
}

int slake_host_compose_consume(slake_host_compose *hc)
{
  if (hc == 0 || hc->valid == 0) {
    return -1;
  }
  return slake_consume_token_consume(&hc->host);
}

int slake_host_compose_mark_erased(slake_host_compose *hc)
{
  if (hc == 0 || hc->valid == 0) {
    return -1;
  }
  return slake_erased_mark(&hc->erased);
}

int slake_host_compose_is_well_typed(const slake_host_compose *hc)
{
  if (hc == 0 || hc->valid == 0) {
    return 0;
  }
  /* Host may be unminted; empty graph OK at graph surface. */
  return slake_ir_graph_is_well_typed(&hc->graph);
}

int slake_host_compose_check_fail_closed(const slake_host_compose *hc)
{
  uint8_t i;
  int needs_mult1;
  int needs_mult0;
  const slake_linear_token *linear;
  const slake_erased *erased;

  if (hc == 0 || hc->valid == 0) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  if (slake_ir_graph_is_well_typed(&hc->graph) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }

  /* Intentional mult pre-scan (compose owns host+erasure; fail closed here
   * before pointer selection). Graph check also enforces MULT-1/0 when
   * linear/erased are null -- redundant-safe; smoke locks both layers. */
  needs_mult1 = 0;
  needs_mult0 = 0;
  for (i = 0; i < hc->graph.prog.count; i++) {
    if (hc->graph.prog.nodes[i].mult == SLAKE_MULT_1) {
      needs_mult1 = 1;
    }
    if (hc->graph.prog.nodes[i].mult == SLAKE_MULT_0) {
      needs_mult0 = 1;
    }
  }
  if (needs_mult1 != 0 && slake_consume_token_is_live(&hc->host) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  if (needs_mult0 != 0
      && slake_erasure_is_runtime_absent(&hc->erased) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }

  /* Public field: host embeds slake_linear_token token. */
  linear = 0;
  if (slake_consume_token_is_live(&hc->host) == 1) {
    linear = &hc->host.token;
  }
  erased = 0;
  if (slake_erasure_is_runtime_absent(&hc->erased) == 1) {
    erased = &hc->erased;
  }
  return slake_ir_graph_check_fail_closed(&hc->graph, linear, erased);
}

int slake_host_compose_extract(const slake_host_compose *hc,
    enum slake_runtime_class *out_rt)
{
  /* Fail closed first; leave *out_rt untouched on fail. */
  if (slake_host_compose_check_fail_closed(hc) != (int)SLAKE_EXTRACT_OK) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  /* null out_rt on success path is FAIL_CLOSED */
  if (out_rt == 0) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  *out_rt = SLAKE_RUNTIME_FS;
  return (int)SLAKE_EXTRACT_OK;
}
