/* GRAPH-SUBSET-EMIT / SLAKE_GRAPH_SUBSET_EMIT_V0
 * Host-built Graph subset freestanding C (ideal ladder M1).
 * Input: SLAKE_GRAPH_SUBSET_GRAPH (COMPILE-PATH-GRAPH / GRAPH-FIXTURE).
 * Dialect: HOST-EMIT-GRAPH (EmitGraph; no second Graph dialect).
 * Not full freestanding API dialect rewrite; Graph unit package only.
 * Lake host remains (StillUsesLake / DependsOnLake).
 * RUNTIME-FS; IR_GRAPH_EDGES_V0; SLAKE_IR_EDGE_MAX; no product GC on this Graph subset package.
 * Not full CFG/SSA.
 */

/* ---- IR_GRAPH_EDGES_V0 -- edges over ordered IR program (not residual free).
 * Fixed-capacity edge list; endpoints are node indices into prog.nodes.
 * Thin call-through to slake_ir_program_* for nodes and fail-closed.
 * Empty valid graph (no nodes, no edges) is well-typed + check OK (graph surface).
 * Nested empty program alone remains fail-closed under IR_PROGRAM_V0.
 * not residual free; not PROVABLY; no product GC.
 * Greppable: IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX, FAIL_CLOSED_CHECKER_V1
 * HOST-EMIT-GRAPH: dialect from SystemsLean.EmitGraph + host_emit_graph.ssot.txt
 * (Lean FreestandingEmit embeds this IR graph product text).
 */
#define SLAKE_IR_EDGE_MAX 16

typedef struct slake_ir_edge {
  uint8_t from;  /* node index into program.nodes */
  uint8_t to;
  uint8_t valid; /* 1 after successful add */
} slake_ir_edge;

typedef struct slake_ir_graph {
  slake_ir_program prog;
  slake_ir_edge edges[SLAKE_IR_EDGE_MAX];
  uint8_t edge_count;
  uint8_t valid;
} slake_ir_graph;

/* Greppable IR graph edges stage id: IR_GRAPH_EDGES_V0 */
const char *slake_ir_graph_id(void);

/* 0 ok; -1 null. Inits nested program via slake_ir_program_init;
 * edge_count=0; valid=1. Dead edges: valid=0.
 */
int slake_ir_graph_init(slake_ir_graph *g);

/* Thin call-through: push node onto g->prog.
 * Same return codes as slake_ir_program_push (0 ok; -1 null/bad; -2 full).
 */
int slake_ir_graph_push_node(slake_ir_graph *g, uint32_t type_tag,
                             enum slake_mult mult, enum slake_ir_kind kind);

/* 0 ok; -1 null/invalid graph, full edges, or endpoints out of range
 * (from/to must be < prog.count). On failure leave edge_count unchanged.
 * On success write edge at edges[edge_count] and increment edge_count.
 * Header return codes must match body.
 */
int slake_ir_graph_add_edge(slake_ir_graph *g, uint8_t from, uint8_t to);

/* 1 if graph non-null, valid, edges sound, and either empty graph
 * (prog.count==0 and edge_count==0) or nested program well-typed with
 * every live edge valid and from/to < prog.count; empty edges OK; else 0.
 */
int slake_ir_graph_is_well_typed(const slake_ir_graph *g);

/* Requires well-typed graph. Empty graph -> SLAKE_EXTRACT_OK.
 * Non-empty: call-through slake_ir_program_check_fail_closed(&g->prog, ...).
 * Ill-typed / null -> SLAKE_EXTRACT_FAIL_CLOSED.
 * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.
 * Greppable: IR_GRAPH_EDGES_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS
 */
int slake_ir_graph_check_fail_closed(const slake_ir_graph *g,
    const slake_linear_token *linear,
    const slake_erased *erased);
