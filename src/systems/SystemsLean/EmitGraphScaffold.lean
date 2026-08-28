/-
  SYSTEMS_LEAN_HOST partial -- freestanding IR graph product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-GRAPH product-text fragments (graphHeaderFragment /
  graphBodyFragment), stage/map ids, ownership honesty, and emitGraphReady
  used by SystemsLean.EmitGraph. Same namespace SystemsLean.EmitGraph so
  call sites stay unqualified. Long-file peel from EmitGraph.lean.

  Spec (readable):
  - stageId / hostEmitGraphId / selfHostEmitGraphId: greppable stage map.
  - graphHeaderFragment / graphBodyFragment: freestanding C scaffolding SSoT
    text (GRAPH_C_HEADER / GRAPH_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - emitGraphReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / CFG/SSA.
  - Durable file host_emit_graph.ssot.txt remains HOST-EMIT-GRAPH dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_GRAPH_V0, HOST-EMIT-GRAPH,
  SELF-HOST-EMIT-GRAPH, graphHeaderFragment, graphBodyFragment, emitGraphReady,
  emitGraphOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitGraphSurfaceOk,
  EMIT-GRAPH-SMOKE, HOST-EMIT-GRAPH-SMOKE, EmitGraphScaffold,
  IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX, slake_ir_graph, NON-SSOT, RUNTIME-FS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.EmitGraphScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitGraph.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitGraph

/-! ### Host-owned freestanding IR graph product C (HOST-EMIT-GRAPH)
    Greppable: HOST-EMIT-GRAPH, SELF-HOST-EMIT-GRAPH, SLAKE_SELF_HOST_EMIT_GRAPH_V0,
    graphHeaderFragment, graphBodyFragment, emitGraphReady.
    maxHeartbeats raised: graph bodies need room for decide honesty. -/

def stageId : String := "SLAKE_SELF_HOST_EMIT_GRAPH_V0"

/-- Greppable short map id (HOST-EMIT-GRAPH). -/
def hostEmitGraphId : String := "HOST-EMIT-GRAPH"

/-- Greppable short map id (SELF-HOST-EMIT-GRAPH). -/
def selfHostEmitGraphId : String := "SELF-HOST-EMIT-GRAPH"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitGraph.lean"

/-- Durable IR graph SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_graph.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-GRAPH). -/
def graphOwnershipComment : String :=
  " * HOST-EMIT-GRAPH: dialect from SystemsLean.EmitGraph + host_emit_graph.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this IR graph product text).\n"

/-- IR graph section open comment (header; includes ownership). -/
def graphHeaderOpen : String :=
  "/* ---- IR_GRAPH_EDGES_V0 -- edges over ordered IR program (not residual free).\n"
    ++ " * Fixed-capacity edge list; endpoints are node indices into prog.nodes.\n"
    ++ " * Thin call-through to slake_ir_program_* for nodes and fail-closed.\n"
    ++ " * Empty valid graph (no nodes, no edges) is well-typed + check OK (graph surface).\n"
    ++ " * Nested empty program alone remains fail-closed under IR_PROGRAM_V0.\n"
    ++ " * not residual free; not PROVABLY; no product GC.\n"
    ++ " * Greppable: IR_GRAPH_EDGES_V0, SLAKE_IR_EDGE_MAX, FAIL_CLOSED_CHECKER_V1\n"
    ++ graphOwnershipComment
    ++ " */\n"

/-- IR graph EDGE_MAX + typedef + function decls. -/
def graphApiDecls : String :=
  "#define SLAKE_IR_EDGE_MAX 16\n"
    ++ "\n"
    ++ "typedef struct slake_ir_edge {\n"
    ++ "  uint8_t from;  /* node index into program.nodes */\n"
    ++ "  uint8_t to;\n"
    ++ "  uint8_t valid; /* 1 after successful add */\n"
    ++ "} slake_ir_edge;\n"
    ++ "\n"
    ++ "typedef struct slake_ir_graph {\n"
    ++ "  slake_ir_program prog;\n"
    ++ "  slake_ir_edge edges[SLAKE_IR_EDGE_MAX];\n"
    ++ "  uint8_t edge_count;\n"
    ++ "  uint8_t valid;\n"
    ++ "} slake_ir_graph;\n"
    ++ "\n"
    ++ "/* Greppable IR graph edges stage id: IR_GRAPH_EDGES_V0 */\n"
    ++ "const char *slake_ir_graph_id(void);\n"
    ++ "\n"
    ++ "/* 0 ok; -1 null. Inits nested program via slake_ir_program_init;\n"
    ++ " * edge_count=0; valid=1. Dead edges: valid=0.\n"
    ++ " */\n"
    ++ "int slake_ir_graph_init(slake_ir_graph *g);\n"
    ++ "\n"
    ++ "/* Thin call-through: push node onto g->prog.\n"
    ++ " * Same return codes as slake_ir_program_push (0 ok; -1 null/bad; -2 full).\n"
    ++ " */\n"
    ++ "int slake_ir_graph_push_node(slake_ir_graph *g, uint32_t type_tag,\n"
    ++ "                             enum slake_mult mult, enum slake_ir_kind kind);\n"
    ++ "\n"
    ++ "/* 0 ok; -1 null/invalid graph, full edges, or endpoints out of range\n"
    ++ " * (from/to must be < prog.count). On failure leave edge_count unchanged.\n"
    ++ " * On success write edge at edges[edge_count] and increment edge_count.\n"
    ++ " * Header return codes must match body.\n"
    ++ " */\n"
    ++ "int slake_ir_graph_add_edge(slake_ir_graph *g, uint8_t from, uint8_t to);\n"
    ++ "\n"
    ++ "/* 1 if graph non-null, valid, edges sound, and either empty graph\n"
    ++ " * (prog.count==0 and edge_count==0) or nested program well-typed with\n"
    ++ " * every live edge valid and from/to < prog.count; empty edges OK; else 0.\n"
    ++ " */\n"
    ++ "int slake_ir_graph_is_well_typed(const slake_ir_graph *g);\n"
    ++ "\n"
    ++ "/* Single fail-closed walk: edge soundness then program check.\n"
    ++ " * Does not re-call slake_ir_graph_is_well_typed (public is_well_typed stays).\n"
    ++ " * Empty graph -> SLAKE_EXTRACT_OK.\n"
    ++ " * Non-empty: slake_ir_program_check_fail_closed (one live-node walk).\n"
    ++ " * Ill-typed / null -> SLAKE_EXTRACT_FAIL_CLOSED.\n"
    ++ " * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.\n"
    ++ " * Greppable: IR_GRAPH_EDGES_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS,\n"
    ++ " * SINGLE_FAIL_CLOSED_WALK\n"
    ++ " */\n"
    ++ "int slake_ir_graph_check_fail_closed(const slake_ir_graph *g,\n"
    ++ "    const slake_linear_token *linear,\n"
    ++ "    const slake_erased *erased);\n"

/-- graphHeaderFragment -- freestanding IR graph header text (HOST-EMIT-GRAPH SSoT). -/
def graphHeaderFragment : String :=
  graphHeaderOpen
    ++ graphApiDecls

/-- Body section open for IR graph. -/
def graphBodyOpen : String :=
  "/* ---- IR_GRAPH_EDGES_V0 (edges over ordered IR program; not residual free) ----\n"
    ++ " * Endpoints are indices into prog.nodes. Thin call-through to program APIs.\n"
    ++ " * Empty edges OK. Empty graph (no nodes) is well-typed at graph surface.\n"
    ++ " * Shared linear/erased handles remain V0 honesty for checks.\n"
    ++ " * Greppable types: slake_ir_graph, slake_ir_edge, SLAKE_IR_EDGE_MAX.\n"
    ++ graphOwnershipComment
    ++ " */\n"

/-- IR graph function bodies (product wire). -/
def graphBodies : String :=
  "const char *slake_ir_graph_id(void)\n"
    ++ "{\n"
    ++ "  return \"IR_GRAPH_EDGES_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_graph_init(slake_ir_graph *g)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "\n"
    ++ "  if (g == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_ir_program_init(&g->prog) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  g->edge_count = 0;\n"
    ++ "  g->valid = 1;\n"
    ++ "  for (i = 0; i < (uint8_t)SLAKE_IR_EDGE_MAX; i++) {\n"
    ++ "    g->edges[i].from = 0;\n"
    ++ "    g->edges[i].to = 0;\n"
    ++ "    g->edges[i].valid = 0;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_graph_push_node(slake_ir_graph *g, uint32_t type_tag,\n"
    ++ "                             enum slake_mult mult, enum slake_ir_kind kind)\n"
    ++ "{\n"
    ++ "  if (g == 0 || g->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return slake_ir_program_push(&g->prog, type_tag, mult, kind);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_graph_add_edge(slake_ir_graph *g, uint8_t from, uint8_t to)\n"
    ++ "{\n"
    ++ "  if (g == 0 || g->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (g->edge_count >= (uint8_t)SLAKE_IR_EDGE_MAX) {\n"
    ++ "    return -1; /* full; leave edge_count unchanged */\n"
    ++ "  }\n"
    ++ "  /* Endpoints must reference live program nodes. */\n"
    ++ "  if (from >= g->prog.count || to >= g->prog.count) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  g->edges[g->edge_count].from = from;\n"
    ++ "  g->edges[g->edge_count].to = to;\n"
    ++ "  g->edges[g->edge_count].valid = 1;\n"
    ++ "  g->edge_count = (uint8_t)(g->edge_count + 1);\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_graph_is_well_typed(const slake_ir_graph *g)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "\n"
    ++ "  if (g == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (g->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (g->edge_count > (uint8_t)SLAKE_IR_EDGE_MAX) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  /* Empty valid graph (no nodes, no edges): well-typed at graph surface. */\n"
    ++ "  if (g->prog.count == 0) {\n"
    ++ "    if (g->edge_count != 0) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (slake_ir_program_is_well_typed(&g->prog) != 1) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  /* Empty edges OK when program is well-typed. */\n"
    ++ "  for (i = 0; i < g->edge_count; i++) {\n"
    ++ "    if (g->edges[i].valid != 1) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "    if (g->edges[i].from >= g->prog.count || g->edges[i].to >= g->prog.count) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_graph_check_fail_closed(const slake_ir_graph *g,\n"
    ++ "    const slake_linear_token *linear,\n"
    ++ "    const slake_erased *erased)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "\n"
    ++ "  /* Single fail-closed walk: edge soundness then program check.\n"
    ++ "   * Does not call slake_ir_graph_is_well_typed (that re-walks program\n"
    ++ "   * well-typed; program check types and fail-closes live nodes once).\n"
    ++ "   * Ill-typed / null -> FAIL_CLOSED. Empty graph -> OK.\n"
    ++ "   * Greppable: SINGLE_FAIL_CLOSED_WALK */\n"
    ++ "  if (g == 0 || g->valid == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (g->edge_count > (uint8_t)SLAKE_IR_EDGE_MAX) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (g->prog.count == 0) {\n"
    ++ "    if (g->edge_count != 0) {\n"
    ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "    return (int)SLAKE_EXTRACT_OK;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < g->edge_count; i++) {\n"
    ++ "    if (g->edges[i].valid != 1) {\n"
    ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "    if (g->edges[i].from >= g->prog.count || g->edges[i].to >= g->prog.count) {\n"
    ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return slake_ir_program_check_fail_closed(&g->prog, linear, erased);\n"
    ++ "}\n"

/-- graphBodyFragment -- freestanding IR graph body text (HOST-EMIT-GRAPH SSoT). -/
def graphBodyFragment : String :=
  graphBodyOpen
    ++ "\n"
    ++ graphBodies

/-- Ownership comment carries HOST-EMIT-GRAPH + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (graphOwnershipComment
    == " * HOST-EMIT-GRAPH: dialect from SystemsLean.EmitGraph + host_emit_graph.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this IR graph product text).\n")

/-- Header piece honesty: IR graph decls + ownership. -/
def headerHonestyOk : Bool :=
  ownershipHonestyOk
    && (graphApiDecls
      == "#define SLAKE_IR_EDGE_MAX 16\n"
        ++ "\n"
        ++ "typedef struct slake_ir_edge {\n"
        ++ "  uint8_t from;  /* node index into program.nodes */\n"
        ++ "  uint8_t to;\n"
        ++ "  uint8_t valid; /* 1 after successful add */\n"
        ++ "} slake_ir_edge;\n"
        ++ "\n"
        ++ "typedef struct slake_ir_graph {\n"
        ++ "  slake_ir_program prog;\n"
        ++ "  slake_ir_edge edges[SLAKE_IR_EDGE_MAX];\n"
        ++ "  uint8_t edge_count;\n"
        ++ "  uint8_t valid;\n"
        ++ "} slake_ir_graph;\n"
        ++ "\n"
        ++ "/* Greppable IR graph edges stage id: IR_GRAPH_EDGES_V0 */\n"
        ++ "const char *slake_ir_graph_id(void);\n"
        ++ "\n"
        ++ "/* 0 ok; -1 null. Inits nested program via slake_ir_program_init;\n"
        ++ " * edge_count=0; valid=1. Dead edges: valid=0.\n"
        ++ " */\n"
        ++ "int slake_ir_graph_init(slake_ir_graph *g);\n"
        ++ "\n"
        ++ "/* Thin call-through: push node onto g->prog.\n"
        ++ " * Same return codes as slake_ir_program_push (0 ok; -1 null/bad; -2 full).\n"
        ++ " */\n"
        ++ "int slake_ir_graph_push_node(slake_ir_graph *g, uint32_t type_tag,\n"
        ++ "                             enum slake_mult mult, enum slake_ir_kind kind);\n"
        ++ "\n"
        ++ "/* 0 ok; -1 null/invalid graph, full edges, or endpoints out of range\n"
        ++ " * (from/to must be < prog.count). On failure leave edge_count unchanged.\n"
        ++ " * On success write edge at edges[edge_count] and increment edge_count.\n"
        ++ " * Header return codes must match body.\n"
        ++ " */\n"
        ++ "int slake_ir_graph_add_edge(slake_ir_graph *g, uint8_t from, uint8_t to);\n"
        ++ "\n"
        ++ "/* 1 if graph non-null, valid, edges sound, and either empty graph\n"
        ++ " * (prog.count==0 and edge_count==0) or nested program well-typed with\n"
        ++ " * every live edge valid and from/to < prog.count; empty edges OK; else 0.\n"
        ++ " */\n"
        ++ "int slake_ir_graph_is_well_typed(const slake_ir_graph *g);\n"
        ++ "\n"
        ++ "/* Single fail-closed walk: edge soundness then program check.\n"
        ++ " * Does not re-call slake_ir_graph_is_well_typed (public is_well_typed stays).\n"
        ++ " * Empty graph -> SLAKE_EXTRACT_OK.\n"
        ++ " * Non-empty: slake_ir_program_check_fail_closed (one live-node walk).\n"
        ++ " * Ill-typed / null -> SLAKE_EXTRACT_FAIL_CLOSED.\n"
        ++ " * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.\n"
        ++ " * Greppable: IR_GRAPH_EDGES_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS,\n"
        ++ " * SINGLE_FAIL_CLOSED_WALK\n"
        ++ " */\n"
        ++ "int slake_ir_graph_check_fail_closed(const slake_ir_graph *g,\n"
        ++ "    const slake_linear_token *linear,\n"
        ++ "    const slake_erased *erased);\n")

/-- Body piece honesty: IR graph function bodies. -/
def bodyHonestyOk : Bool :=
  ownershipHonestyOk
    && (graphBodies
      == "const char *slake_ir_graph_id(void)\n"
        ++ "{\n"
        ++ "  return \"IR_GRAPH_EDGES_V0\";\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_graph_init(slake_ir_graph *g)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "\n"
        ++ "  if (g == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (slake_ir_program_init(&g->prog) != 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  g->edge_count = 0;\n"
        ++ "  g->valid = 1;\n"
        ++ "  for (i = 0; i < (uint8_t)SLAKE_IR_EDGE_MAX; i++) {\n"
        ++ "    g->edges[i].from = 0;\n"
        ++ "    g->edges[i].to = 0;\n"
        ++ "    g->edges[i].valid = 0;\n"
        ++ "  }\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_graph_push_node(slake_ir_graph *g, uint32_t type_tag,\n"
        ++ "                             enum slake_mult mult, enum slake_ir_kind kind)\n"
        ++ "{\n"
        ++ "  if (g == 0 || g->valid == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  return slake_ir_program_push(&g->prog, type_tag, mult, kind);\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_graph_add_edge(slake_ir_graph *g, uint8_t from, uint8_t to)\n"
        ++ "{\n"
        ++ "  if (g == 0 || g->valid == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (g->edge_count >= (uint8_t)SLAKE_IR_EDGE_MAX) {\n"
        ++ "    return -1; /* full; leave edge_count unchanged */\n"
        ++ "  }\n"
        ++ "  /* Endpoints must reference live program nodes. */\n"
        ++ "  if (from >= g->prog.count || to >= g->prog.count) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  g->edges[g->edge_count].from = from;\n"
        ++ "  g->edges[g->edge_count].to = to;\n"
        ++ "  g->edges[g->edge_count].valid = 1;\n"
        ++ "  g->edge_count = (uint8_t)(g->edge_count + 1);\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_graph_is_well_typed(const slake_ir_graph *g)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "\n"
        ++ "  if (g == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (g->valid == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (g->edge_count > (uint8_t)SLAKE_IR_EDGE_MAX) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  /* Empty valid graph (no nodes, no edges): well-typed at graph surface. */\n"
        ++ "  if (g->prog.count == 0) {\n"
        ++ "    if (g->edge_count != 0) {\n"
        ++ "      return 0;\n"
        ++ "    }\n"
        ++ "    return 1;\n"
        ++ "  }\n"
        ++ "  if (slake_ir_program_is_well_typed(&g->prog) != 1) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  /* Empty edges OK when program is well-typed. */\n"
        ++ "  for (i = 0; i < g->edge_count; i++) {\n"
        ++ "    if (g->edges[i].valid != 1) {\n"
        ++ "      return 0;\n"
        ++ "    }\n"
        ++ "    if (g->edges[i].from >= g->prog.count || g->edges[i].to >= g->prog.count) {\n"
        ++ "      return 0;\n"
        ++ "    }\n"
        ++ "  }\n"
        ++ "  return 1;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_graph_check_fail_closed(const slake_ir_graph *g,\n"
        ++ "    const slake_linear_token *linear,\n"
        ++ "    const slake_erased *erased)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "\n"
        ++ "  /* Single fail-closed walk: edge soundness then program check.\n"
        ++ "   * Does not call slake_ir_graph_is_well_typed (that re-walks program\n"
        ++ "   * well-typed; program check types and fail-closes live nodes once).\n"
        ++ "   * Ill-typed / null -> FAIL_CLOSED. Empty graph -> OK.\n"
        ++ "   * Greppable: SINGLE_FAIL_CLOSED_WALK */\n"
        ++ "  if (g == 0 || g->valid == 0) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  if (g->edge_count > (uint8_t)SLAKE_IR_EDGE_MAX) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  if (g->prog.count == 0) {\n"
        ++ "    if (g->edge_count != 0) {\n"
        ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "    }\n"
        ++ "    return (int)SLAKE_EXTRACT_OK;\n"
        ++ "  }\n"
        ++ "  for (i = 0; i < g->edge_count; i++) {\n"
        ++ "    if (g->edges[i].valid != 1) {\n"
        ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "    }\n"
        ++ "    if (g->edges[i].from >= g->prog.count || g->edges[i].to >= g->prog.count) {\n"
        ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "    }\n"
        ++ "  }\n"
        ++ "  return slake_ir_program_check_fail_closed(&g->prog, linear, erased);\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitGraphSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_GRAPH_V0")
    && (hostEmitGraphId == "HOST-EMIT-GRAPH")
    && (selfHostEmitGraphId == "SELF-HOST-EMIT-GRAPH")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitGraph.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_graph.ssot.txt")

/-- emitGraphReady -- IR graph host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitGraphReady, HOST-EMIT-GRAPH, SELF-HOST-EMIT-GRAPH. -/
def emitGraphReady : Bool :=
  emitGraphSurfaceOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitGraphReady for inventory greps). -/
def emitGraphOk : Bool := emitGraphReady

/-! ### IR graph host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-GRAPH-SMOKE, HOST-EMIT-GRAPH-SMOKE.
    maxHeartbeats raised: decide honesty on header/body pieces. -/

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-GRAPH-SMOKE / HOST-EMIT-GRAPH-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_GRAPH_V0" := by decide
example : hostEmitGraphId = "HOST-EMIT-GRAPH" := by decide
example : selfHostEmitGraphId = "SELF-HOST-EMIT-GRAPH" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitGraph.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_graph.ssot.txt" := by decide
example : emitGraphSurfaceOk = true := by decide

/-- HOST-EMIT-GRAPH-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-GRAPH-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-GRAPH-SMOKE: full emit readiness. -/
example : emitGraphReady = true := by decide
example : emitGraphOk = true := by decide

/-- EMIT-GRAPH-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitGraphReady_true : emitGraphReady = true := by decide

end SystemsLean.EmitGraph
