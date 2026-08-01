/* COMPOSE-SUBSET-EMIT / SLAKE_COMPOSE_SUBSET_EMIT_V0
 * Host-built Compose subset freestanding C (ideal ladder M1).
 * Input: SLAKE_COMPOSE_SUBSET_COMPOSE (COMPILE-PATH-COMPOSE / COMPOSE-FIXTURE).
 * Dialect: HOST-EMIT-COMPOSE (EmitCompose; no second Compose dialect).
 * Not full freestanding API dialect rewrite; Compose unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; HOST_COMPOSE_V0; IR_GRAPH_EDGES_V0; no product GC on this Compose subset package.
 * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.
 * Not full CFG/SSA.
 */

/* ---- HOST_COMPOSE_V0 -- freestanding host + IR graph composition (not residual free).
 * Owns IR graph + ConsumeToken host + erasure mark.
 * Mutators (mint/push/add_edge/consume/mark_erased) are thin call-throughs;
 * check_fail_closed is intentional mult pre-scan then graph check (not pure
 * call-through). not residual free; not PROVABLY; no product GC; not full CFG/SSA.
 * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.
 * Greppable: HOST_COMPOSE_V0, CONSUME_TOKEN_HOST_V0, IR_GRAPH_EDGES_V0,
 * FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS
 * HOST-EMIT-COMPOSE: dialect from SystemsLean.EmitCompose + host_emit_compose.ssot.txt
 * (Lean FreestandingEmit embeds this host compose product text).
 */
typedef struct slake_host_compose {
  slake_ir_graph graph;
  slake_consume_token host;
  slake_erased erased;
  uint8_t valid; /* 1 after successful init */
} slake_host_compose;

/* Greppable host compose stage id: exact "HOST_COMPOSE_V0" */
const char *slake_host_compose_id(void);

/* 0 ok; -1 null.
 * Inits graph via slake_ir_graph_init; host via slake_consume_token_init;
 * erased.marked=0; valid=1.
 */
int slake_host_compose_init(slake_host_compose *hc);

/* Thin call-through to slake_ir_graph_push_node after valid guard.
 * 0 ok; -1 null/invalid compose or graph push fail (null/bad mult/kind);
 * -2 full (from slake_ir_program_push via graph). Header matches body.
 */
int slake_host_compose_push_node(slake_host_compose *hc, uint32_t type_tag,
    enum slake_mult mult, enum slake_ir_kind kind);

/* Thin call-through to slake_ir_graph_add_edge after valid guard.
 * 0 ok; -1 null/invalid compose, full edges, or endpoints out of range.
 * (graph add_edge does not use -2). Header matches body.
 */
int slake_host_compose_add_edge(slake_host_compose *hc, uint8_t from, uint8_t to);

/* Thin call-through to slake_consume_token_mint after valid guard.
 * 0 ok; -1 null/invalid compose/id==0; -2 already live.
 * Header matches body (compose guard adds invalid; mint adds id==0/-2).
 */
int slake_host_compose_mint(slake_host_compose *hc, uint32_t id);

/* Thin call-through to slake_consume_token_consume after valid guard.
 * 0 success; -1 null/invalid/empty; -2 already spent / LINEAR-EXACT-ONCE.
 * Header matches body.
 */
int slake_host_compose_consume(slake_host_compose *hc);

/* Thin call-through to slake_erased_mark on &hc->erased after valid guard.
 * 0 ok; -1 null/invalid compose (or null erased path from mark).
 * Header matches body -- explicit compose codes, not "same as erased_mark" alone.
 */
int slake_host_compose_mark_erased(slake_host_compose *hc);

/* 1 if non-null, valid, graph well-typed (slake_ir_graph_is_well_typed); else 0.
 * Host may be unminted (composition allows empty graph).
 */
int slake_host_compose_is_well_typed(const slake_host_compose *hc);

/* Fail-closed composition (0 OK / 1 FAIL_CLOSED). Header must match body.
 *
 * Orchestration (honest non-thin mult pre-scan, then graph check):
 * 1) null/invalid/ill-typed graph -> FAIL_CLOSED
 * 2) Mult pre-scan of owned graph nodes (intentional; not pure call-through):
 *    - any MULT-1 node requires slake_consume_token_is_live(&hc->host)==1
 *    - any MULT-0 node requires erased marked (slake_erasure_is_runtime_absent)
 *    Rationale: compose owns host+erasure handles and fails closed at the
 *    compose boundary before pointer selection. Graph/node checks also enforce
 *    MULT-1/0 when linear/erased are null; pre-scan is redundant-safe today
 *    and documents host ownership at this layer. Behavioral smoke locks both.
 * 3) Select linear = &hc->host.token when live else null; erased = &hc->erased
 *    when marked else null; call slake_ir_graph_check_fail_closed.
 * Greppable: HOST_COMPOSE_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS
 */
int slake_host_compose_check_fail_closed(const slake_host_compose *hc);

/* Extract path: run check_fail_closed; on OK write *out_rt = SLAKE_RUNTIME_FS and return OK;
 * on fail leave *out_rt untouched; null out_rt on success path is FAIL_CLOSED.
 * Greppable: HOST_COMPOSE_V0, EMIT-BOUNDARY, RUNTIME-FS
 */
int slake_host_compose_extract(const slake_host_compose *hc,
    enum slake_runtime_class *out_rt);
