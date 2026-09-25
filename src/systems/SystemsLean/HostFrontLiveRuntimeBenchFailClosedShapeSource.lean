/-
  SYSTEMS_LEAN_HOST partial. Dual-check of RuntimeBenchFailClosedShape.lean bytes.
  liveRuntimeBenchFailClosedShapeSource is the exact bytes of
  src/systems/SystemsLean/RuntimeBenchFailClosedShape.lean.
  Module: SystemsLean.HostFrontLiveRuntimeBenchFailClosedShapeSource
  Not FullHost. Not a runtime benchmark claim. Not a new measurement C file.
  Not Lake-gone. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveRuntimeBenchFailClosedShapeSource.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape

def liveRuntimeBenchFailClosedShapeSource : String := r##"/-
  SYSTEMS_LEAN_HOST measurement -- Lean-owned fail-closed-shape compose twin.
  Generates the timed C driver (CLOCK_MONOTONIC stopwatch in C).
  Not a Lean IO timer (that is RuntimeBenchLean / R-lean).
  Not freestanding product wire. Not PROVABLY-as-speed.
  Not residual free / complete / FullHost forge.

  Protocol: stack 8+16 fail-closed compose; well-typed pairing; mult
  pre-scan; extract-shaped write; consume; post fail-closed after spend.
  Extract is not skipped. No malloc; no slake_* APIs.
  Hand smoke file stays until this generated twin is the live arm.

  Greppable: RuntimeBenchFailClosedShape, R-fail-closed-shape,
  fail_closed_shape, failClosedShapeProtocolOk, generatedSource,
  not_product_wire, RUNTIME-BENCH-FAIL-CLOSED-SHAPE.
  Module: SystemsLean.RuntimeBenchFailClosedShape
  SKELETON host measurement (not freestanding unit).
  Module must stay ASCII. Sub-1-KLOC. Measurement role only.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

namespace SystemsLean.RuntimeBenchFailClosedShape

/-- True when hay contains needle as a contiguous substring. -/
def containsStr (hay needle : String) : Bool :=
  if needle.isEmpty then false
  else (hay.splitOn needle).length > 1

/-- Greppable measurement stage (not a product residual claim). -/
def stageId : String := "RUNTIME-BENCH-FAIL-CLOSED-SHAPE"

/-- Generated driver path cite under out/ (not product emit wire). -/
def generatedRelPath : String := "out/runtime-bench/fail_closed_shape.c"

/-- Lake exe name. -/
def lakeExeName : String := "slake-runtime-bench-fail-closed-shape"

/-- just recipe that writes then compiles the generated driver. -/
def justRecipe : String := "bench-runtime-fail-closed-shape-generated"

/-! ### Generated timed C driver (SSOT)

  Same fail-closed compose walk as the hand twin. Extract is not skipped.
  Wall clock stays in C (clock_gettime). Not RuntimeBenchLean IO.monoNanosNow.
-/

def sourcePreamble : String :=
  "/* SPDX-License-Identifier: Unlicense\n"
    ++ " *\n"
    ++ " * Generated fail-closed-shape compose twin.\n"
    ++ " * Lean SSOT: SystemsLean.RuntimeBenchFailClosedShape.\n"
    ++ " * Same fail-closed work as freestanding host_compose on the stack:\n"
    ++ " *   fixed caps 8 nodes + 16 edges; 3+2 bench graph; well-typed pairing;\n"
    ++ " *   mult pre-scan; extract-shaped write of a runtime-fs tag; consume;\n"
    ++ " *   post fail-closed expected after spend.\n"
    ++ " * No heap allocation. Does not call product APIs.\n"
    ++ " * Does not include the product header. Not product wire.\n"
    ++ " * Measurement role only. Not PROVABLY-as-speed.\n"
    ++ " * Extract is not skipped. Full re-init is the cold op.\n"
    ++ " *\n"
    ++ " * Graph (same as product cold compose arm):\n"
    ++ " *   OMEGA+VALUE, MULT-1+LINEAR, MULT-0+ERASED; edges 0->1, 1->2.\n"
    ++ " *\n"
    ++ " * Usage:  fail_closed_shape [N]\n"
    ++ " * Default N: 5000000 (match freestanding compose calibration).\n"
    ++ " */\n"
    ++ "#define _POSIX_C_SOURCE 200809L\n"
    ++ "#include <stdint.h>\n"
    ++ "#include <stdio.h>\n"
    ++ "#include <stdlib.h>\n"
    ++ "#include <string.h>\n"
    ++ "#include <time.h>\n"
    ++ "\n"
    ++ "#define SHAPE_NODE_CAP 8\n"
    ++ "#define SHAPE_EDGE_CAP 16\n"
    ++ "\n"
    ++ "#define SHAPE_MULT_0 0\n"
    ++ "#define SHAPE_MULT_1 1\n"
    ++ "#define SHAPE_MULT_OMEGA 2\n"
    ++ "\n"
    ++ "#define SHAPE_KIND_VALUE 0\n"
    ++ "#define SHAPE_KIND_LINEAR 1\n"
    ++ "#define SHAPE_KIND_ERASED 2\n"
    ++ "\n"
    ++ "#define SHAPE_EXTRACT_OK 0\n"
    ++ "#define SHAPE_EXTRACT_FAIL_CLOSED 1\n"
    ++ "#define SHAPE_RUNTIME_FS 1\n"
    ++ "\n"
    ++ "typedef struct shape_node {\n"
    ++ "  uint32_t type_tag;\n"
    ++ "  uint8_t mult;\n"
    ++ "  uint8_t kind;\n"
    ++ "  uint8_t valid;\n"
    ++ "} shape_node;\n"
    ++ "\n"
    ++ "typedef struct shape_edge {\n"
    ++ "  uint8_t from;\n"
    ++ "  uint8_t to;\n"
    ++ "  uint8_t valid;\n"
    ++ "} shape_edge;\n"
    ++ "\n"
    ++ "typedef struct shape_token {\n"
    ++ "  uint32_t id;\n"
    ++ "  uint8_t live;\n"
    ++ "  uint8_t state; /* 0 empty; 1 live; 2 spent */\n"
    ++ "} shape_token;\n"
    ++ "\n"
    ++ "typedef struct shape_compose {\n"
    ++ "  shape_node nodes[SHAPE_NODE_CAP];\n"
    ++ "  shape_edge edges[SHAPE_EDGE_CAP];\n"
    ++ "  shape_token host;\n"
    ++ "  uint8_t node_count;\n"
    ++ "  uint8_t edge_count;\n"
    ++ "  uint8_t erased; /* 1 marked */\n"
    ++ "  uint8_t valid;\n"
    ++ "} shape_compose;\n"
    ++ "\n"
    ++ "static double wall_seconds(void)\n"
    ++ "{\n"
    ++ "  struct timespec ts;\n"
    ++ "  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {\n"
    ++ "    return -1.0;\n"
    ++ "  }\n"
    ++ "  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;\n"
    ++ "}\n"
    ++ "\n"

def sourceTypeChecks : String :=
  "static int kind_matches_mult(uint8_t kind, uint8_t mult)\n"
    ++ "{\n"
    ++ "  if (kind == SHAPE_KIND_VALUE && mult == SHAPE_MULT_OMEGA) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (kind == SHAPE_KIND_LINEAR && mult == SHAPE_MULT_1) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (kind == SHAPE_KIND_ERASED && mult == SHAPE_MULT_0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int node_well_typed(const shape_node *n)\n"
    ++ "{\n"
    ++ "  if (n == 0 || n->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (n->mult > SHAPE_MULT_OMEGA) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return kind_matches_mult(n->kind, n->mult);\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int program_well_typed(const shape_compose *c)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  if (c == 0 || c->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (c->node_count == 0 || c->node_count > (uint8_t)SHAPE_NODE_CAP) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < c->node_count; i++) {\n"
    ++ "    if (node_well_typed(&c->nodes[i]) != 1) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int graph_well_typed(const shape_compose *c)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  if (c == 0 || c->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (c->edge_count > (uint8_t)SHAPE_EDGE_CAP) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (c->node_count == 0) {\n"
    ++ "    return (c->edge_count == 0) ? 1 : 0;\n"
    ++ "  }\n"
    ++ "  if (program_well_typed(c) != 1) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < c->edge_count; i++) {\n"
    ++ "    if (c->edges[i].valid != 1) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "    if (c->edges[i].from >= c->node_count || c->edges[i].to >= c->node_count) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int host_is_live(const shape_token *t)\n"
    ++ "{\n"
    ++ "  if (t == 0 || t->state != 1) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return (t->live != 0) ? 1 : 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int node_fail_closed(const shape_node *n, int host_live, int erased_marked)\n"
    ++ "{\n"
    ++ "  if (node_well_typed(n) != 1) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (n->mult == SHAPE_MULT_1) {\n"
    ++ "    if (host_live != 1) {\n"
    ++ "      return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  } else if (n->mult == SHAPE_MULT_0) {\n"
    ++ "    if (erased_marked != 1) {\n"
    ++ "      return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return SHAPE_EXTRACT_OK;\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* Compose check: well-typed + mult pre-scan + nested well-typed + per-node. */\n"
    ++ "static int check_fail_closed(const shape_compose *c)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  int needs_mult1 = 0;\n"
    ++ "  int needs_mult0 = 0;\n"
    ++ "  int host_live;\n"
    ++ "  int erased_marked;\n"
    ++ "\n"
    ++ "  if (c == 0 || c->valid == 0) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (graph_well_typed(c) != 1) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < c->node_count; i++) {\n"
    ++ "    if (c->nodes[i].mult == SHAPE_MULT_1) {\n"
    ++ "      needs_mult1 = 1;\n"
    ++ "    }\n"
    ++ "    if (c->nodes[i].mult == SHAPE_MULT_0) {\n"
    ++ "      needs_mult0 = 1;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  host_live = host_is_live(&c->host);\n"
    ++ "  erased_marked = (c->erased != 0) ? 1 : 0;\n"
    ++ "  if (needs_mult1 != 0 && host_live == 0) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (needs_mult0 != 0 && erased_marked == 0) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  /* Nested graph/program well-typed (product re-walks these layers). */\n"
    ++ "  if (graph_well_typed(c) != 1) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (c->node_count == 0) {\n"
    ++ "    return SHAPE_EXTRACT_OK;\n"
    ++ "  }\n"
    ++ "  if (program_well_typed(c) != 1) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < c->node_count; i++) {\n"
    ++ "    if (node_fail_closed(&c->nodes[i], host_live, erased_marked)\n"
    ++ "        != SHAPE_EXTRACT_OK) {\n"
    ++ "      return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return SHAPE_EXTRACT_OK;\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* Extract-shaped: one fail-closed walk then write runtime-fs tag. */\n"
    ++ "static int extract_shape(const shape_compose *c, int *out_rt)\n"
    ++ "{\n"
    ++ "  if (check_fail_closed(c) != SHAPE_EXTRACT_OK) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (out_rt == 0) {\n"
    ++ "    return SHAPE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  *out_rt = SHAPE_RUNTIME_FS;\n"
    ++ "  return SHAPE_EXTRACT_OK;\n"
    ++ "}\n"
    ++ "\n"

def sourceTokenAndInit : String :=
  "static int token_mint(shape_token *t, uint32_t id)\n"
    ++ "{\n"
    ++ "  if (t == 0 || id == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (t->state == 1 && t->live != 0) {\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  t->id = id;\n"
    ++ "  t->live = 1;\n"
    ++ "  t->state = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int token_consume(shape_token *t)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (t->state == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (t->state == 2) {\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  if (t->live == 0) {\n"
    ++ "    t->state = 2;\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  t->live = 0;\n"
    ++ "  t->id = 0;\n"
    ++ "  t->state = 2;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* Cold init: zero cap-8 nodes (OMEGA+VALUE dead) + cap-16 edges. */\n"
    ++ "static int compose_init(shape_compose *c)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  if (c == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  c->node_count = 0;\n"
    ++ "  c->edge_count = 0;\n"
    ++ "  c->erased = 0;\n"
    ++ "  c->host.id = 0;\n"
    ++ "  c->host.live = 0;\n"
    ++ "  c->host.state = 0;\n"
    ++ "  c->valid = 1;\n"
    ++ "  for (i = 0; i < (uint8_t)SHAPE_NODE_CAP; i++) {\n"
    ++ "    c->nodes[i].valid = 0;\n"
    ++ "    c->nodes[i].mult = SHAPE_MULT_OMEGA;\n"
    ++ "    c->nodes[i].kind = SHAPE_KIND_VALUE;\n"
    ++ "    c->nodes[i].type_tag = 0;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < (uint8_t)SHAPE_EDGE_CAP; i++) {\n"
    ++ "    c->edges[i].from = 0;\n"
    ++ "    c->edges[i].to = 0;\n"
    ++ "    c->edges[i].valid = 0;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int push_node(shape_compose *c, uint32_t tag, uint8_t mult, uint8_t kind)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  if (c == 0 || c->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (c->node_count >= (uint8_t)SHAPE_NODE_CAP) {\n"
    ++ "    return -2;\n"
    ++ "  }\n"
    ++ "  if (kind_matches_mult(kind, mult) != 1) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  i = c->node_count;\n"
    ++ "  c->nodes[i].type_tag = tag;\n"
    ++ "  c->nodes[i].mult = mult;\n"
    ++ "  c->nodes[i].kind = kind;\n"
    ++ "  c->nodes[i].valid = 1;\n"
    ++ "  c->node_count = (uint8_t)(i + 1);\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int add_edge(shape_compose *c, uint8_t from, uint8_t to)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  if (c == 0 || c->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (c->edge_count >= (uint8_t)SHAPE_EDGE_CAP) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (from >= c->node_count || to >= c->node_count) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  i = c->edge_count;\n"
    ++ "  c->edges[i].from = from;\n"
    ++ "  c->edges[i].to = to;\n"
    ++ "  c->edges[i].valid = 1;\n"
    ++ "  c->edge_count = (uint8_t)(i + 1);\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"

def sourceContractAndLoop : String :=
  "/* One cold op: full re-init (primary product-shape). Extract is not skipped. */\n"
    ++ "static int compose_once(uint32_t id, volatile unsigned long *sink)\n"
    ++ "{\n"
    ++ "  shape_compose c;\n"
    ++ "  int out_rt = 0;\n"
    ++ "  unsigned long acc = 0;\n"
    ++ "\n"
    ++ "  if (compose_init(&c) != 0) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (push_node(&c, 10u + (id % 7u), SHAPE_MULT_OMEGA, SHAPE_KIND_VALUE) != 0) {\n"
    ++ "    return 2;\n"
    ++ "  }\n"
    ++ "  if (push_node(&c, 20u + (id % 5u), SHAPE_MULT_1, SHAPE_KIND_LINEAR) != 0) {\n"
    ++ "    return 3;\n"
    ++ "  }\n"
    ++ "  if (push_node(&c, 30u + (id % 3u), SHAPE_MULT_0, SHAPE_KIND_ERASED) != 0) {\n"
    ++ "    return 4;\n"
    ++ "  }\n"
    ++ "  if (add_edge(&c, 0, 1) != 0) {\n"
    ++ "    return 5;\n"
    ++ "  }\n"
    ++ "  if (add_edge(&c, 1, 2) != 0) {\n"
    ++ "    return 6;\n"
    ++ "  }\n"
    ++ "  if (token_mint(&c.host, id) != 0) {\n"
    ++ "    return 7;\n"
    ++ "  }\n"
    ++ "  c.erased = 1;\n"
    ++ "  if (graph_well_typed(&c) != 1) {\n"
    ++ "    return 9;\n"
    ++ "  }\n"
    ++ "  out_rt = 0; /* poison; extract must overwrite */\n"
    ++ "  if (extract_shape(&c, &out_rt) != SHAPE_EXTRACT_OK) {\n"
    ++ "    return 11;\n"
    ++ "  }\n"
    ++ "  if (out_rt != SHAPE_RUNTIME_FS) {\n"
    ++ "    return 12;\n"
    ++ "  }\n"
    ++ "  if (token_consume(&c.host) != 0) {\n"
    ++ "    return 13;\n"
    ++ "  }\n"
    ++ "  if (check_fail_closed(&c) != SHAPE_EXTRACT_FAIL_CLOSED) {\n"
    ++ "    return 14;\n"
    ++ "  }\n"
    ++ "  acc += (unsigned long)id;\n"
    ++ "  acc += (unsigned long)c.node_count;\n"
    ++ "  acc += (unsigned long)c.edge_count;\n"
    ++ "  *sink += acc;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int contract_compose_once(void)\n"
    ++ "{\n"
    ++ "  shape_compose c;\n"
    ++ "  volatile unsigned long sink = 0;\n"
    ++ "  int rc;\n"
    ++ "\n"
    ++ "  rc = compose_once(1u, &sink);\n"
    ++ "  if (rc != 0) {\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  /* Pairing reject: LINEAR + OMEGA is ill-typed. */\n"
    ++ "  if (compose_init(&c) != 0) {\n"
    ++ "    return 20;\n"
    ++ "  }\n"
    ++ "  if (push_node(&c, 1, SHAPE_MULT_OMEGA, SHAPE_KIND_LINEAR) != -1) {\n"
    ++ "    return 21;\n"
    ++ "  }\n"
    ++ "  /* Spent consume fails closed. */\n"
    ++ "  if (compose_init(&c) != 0) {\n"
    ++ "    return 22;\n"
    ++ "  }\n"
    ++ "  if (push_node(&c, 1, SHAPE_MULT_1, SHAPE_KIND_LINEAR) != 0) {\n"
    ++ "    return 23;\n"
    ++ "  }\n"
    ++ "  if (token_mint(&c.host, 7) != 0) {\n"
    ++ "    return 24;\n"
    ++ "  }\n"
    ++ "  if (token_consume(&c.host) != 0) {\n"
    ++ "    return 25;\n"
    ++ "  }\n"
    ++ "  if (token_consume(&c.host) != -2) {\n"
    ++ "    return 26;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int run_ops(unsigned long n, volatile unsigned long *sink)\n"
    ++ "{\n"
    ++ "  unsigned long i;\n"
    ++ "  *sink = 0;\n"
    ++ "  for (i = 0; i < n; i++) {\n"
    ++ "    uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);\n"
    ++ "    int rc = compose_once(id, sink);\n"
    ++ "    if (rc != 0) {\n"
    ++ "      return 100 + rc;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"

def sourceMain : String :=
  "int main(int argc, char **argv)\n"
    ++ "{\n"
    ++ "  unsigned long n = 5000000ul;\n"
    ++ "  volatile unsigned long sink = 0;\n"
    ++ "  double t0, t1, elapsed;\n"
    ++ "  int rc;\n"
    ++ "  double ns_per_op;\n"
    ++ "  double ops_per_s;\n"
    ++ "\n"
    ++ "  if (argc >= 2) {\n"
    ++ "    char *end = 0;\n"
    ++ "    unsigned long parsed = strtoul(argv[1], &end, 10);\n"
    ++ "    if (end == argv[1] || parsed == 0) {\n"
    ++ "      fprintf(stderr, \"usage: %s [N>0]\\n\", argv[0]);\n"
    ++ "      return 64;\n"
    ++ "    }\n"
    ++ "    n = parsed;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  printf(\"arm=R-fail-closed-shape\\n\");\n"
    ++ "  printf(\"workload=stack 8+16 fail-closed compose (well-typed, pre-scan, extract, post)\\n\");\n"
    ++ "  printf(\"job_class=compose\\n\");\n"
    ++ "  printf(\"honesty=fail_closed_shape\\n\");\n"
    ++ "  printf(\"baseline=fail_closed_shape\\n\");\n"
    ++ "  printf(\"not_product_wire=1\\n\");\n"
    ++ "  printf(\"generated=lean_runtime_bench_fail_closed_shape\\n\");\n"
    ++ "  printf(\"N=%lu\\n\", n);\n"
    ++ "\n"
    ++ "  rc = contract_compose_once();\n"
    ++ "  if (rc != 0) {\n"
    ++ "    fprintf(stderr, \"contract FAIL code=%d\\n\", rc);\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  printf(\"contract=ok fail_closed_shape pairing_and_spent\\n\");\n"
    ++ "\n"
    ++ "  rc = run_ops(n, &sink);\n"
    ++ "  if (rc != 0) {\n"
    ++ "    fprintf(stderr, \"warmup FAIL code=%d sink=%lu\\n\", rc, (unsigned long)sink);\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  printf(\"warmup=ok\\n\");\n"
    ++ "\n"
    ++ "  t0 = wall_seconds();\n"
    ++ "  if (t0 < 0.0) {\n"
    ++ "    fprintf(stderr, \"clock_gettime failed\\n\");\n"
    ++ "    return 70;\n"
    ++ "  }\n"
    ++ "  rc = run_ops(n, &sink);\n"
    ++ "  t1 = wall_seconds();\n"
    ++ "  if (rc != 0) {\n"
    ++ "    fprintf(stderr, \"timed FAIL code=%d\\n\", rc);\n"
    ++ "    return rc;\n"
    ++ "  }\n"
    ++ "  if (t1 < 0.0) {\n"
    ++ "    fprintf(stderr, \"clock_gettime failed after timed run\\n\");\n"
    ++ "    return 71;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  elapsed = t1 - t0;\n"
    ++ "  if (elapsed <= 0.0) {\n"
    ++ "    elapsed = 1e-12;\n"
    ++ "  }\n"
    ++ "  ns_per_op = (elapsed * 1e9) / (double)n;\n"
    ++ "  ops_per_s = (double)n / elapsed;\n"
    ++ "\n"
    ++ "  printf(\"wall_seconds=%.9f\\n\", elapsed);\n"
    ++ "  printf(\"ns_per_op=%.4f\\n\", ns_per_op);\n"
    ++ "  printf(\"ops_per_s=%.2f\\n\", ops_per_s);\n"
    ++ "  printf(\"sink=%lu\\n\", (unsigned long)sink);\n"
    ++ "  printf(\"status=ok\\n\");\n"
    ++ "  return 0;\n"
    ++ "}\n"

/-- Lean-owned timed C driver text (SSOT). -/
def generatedSource : String :=
  sourcePreamble ++ sourceTypeChecks ++ sourceTokenAndInit ++ sourceContractAndLoop ++ sourceMain

/-- Required fail-closed compose / arm / extract / loop tokens. -/
def requiredTokens : List String := [
  "arm=R-fail-closed-shape",
  "fail_closed_shape",
  "SHAPE_NODE_CAP",
  "SHAPE_EDGE_CAP",
  "check_fail_closed",
  "extract_shape",
  "compose_once",
  "compose_init",
  "token_mint",
  "token_consume",
  "run_ops",
  "for (i = 0; i < n; i++)",
  "CLOCK_MONOTONIC",
  "clock_gettime",
  "not_product_wire",
  "pairing_and_spent"
]

/-- Product API / heap tokens the twin must not emit. -/
def forbiddenTokens : List String := [
  "malloc(",
  "calloc(",
  "realloc(",
  "slake_",
  "slake_freestanding.h"
]

def hasAllRequired (src : String) : Bool :=
  requiredTokens.all (fun t => containsStr src t)

def hasNoForbidden (src : String) : Bool :=
  forbiddenTokens.all (fun t => !(containsStr src t))

/-- Decidable protocol check on the generated driver text. -/
def failClosedShapeProtocolOk : Bool :=
  hasAllRequired generatedSource && hasNoForbidden generatedSource

/-- Generated source satisfies the fail-closed compose twin protocol.
    Greppable: failClosedShapeProtocolOk_true. -/
theorem failClosedShapeProtocolOk_true : failClosedShapeProtocolOk = true := by
  native_decide

/-! ### Assert-only fail theorems (today's functions; no statement change above)

  These lock the reject side of hasAllRequired / hasNoForbidden.
  Not a second red of failClosedShapeProtocolOk_true.
-/

/-- Empty haystack is missing every required token. -/
theorem hasAllRequired_empty_false : hasAllRequired "" = false := by
  native_decide

/-- Same generated text with extract_shape stripped fails required tokens. -/
def sourceMissingExtract : String :=
  generatedSource.replace "extract_shape" "extract_omitted"

theorem hasAllRequired_missing_extract_false :
    hasAllRequired sourceMissingExtract = false := by
  native_decide

/-- malloc( is a forbidden heap token. -/
theorem hasNoForbidden_malloc_call_false :
    hasNoForbidden "malloc(" = false := by
  native_decide

/-- slake_mint is a forbidden product API stem (slake_). -/
theorem hasNoForbidden_slake_mint_false :
    hasNoForbidden "slake_mint" = false := by
  native_decide

/-- Required token list is non-empty (walk cannot vacuously pass). -/
theorem requiredTokens_nonempty : requiredTokens.length > 0 := by
  native_decide

theorem stageId_eq : stageId = "RUNTIME-BENCH-FAIL-CLOSED-SHAPE" :=
  rfl

theorem generatedRelPath_eq :
    generatedRelPath = "out/runtime-bench/fail_closed_shape.c" :=
  rfl

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Write the generated timed C driver under root/out/runtime-bench/fail_closed_shape.c. -/
def writeGenerated (root : System.FilePath) : IO Unit := do
  unless failClosedShapeProtocolOk do
    IO.eprintln s!"error: {stageId}: failClosedShapeProtocolOk false"
    throw (IO.userError "failClosedShapeProtocolOk false")
  let outDir := root / "out" / "runtime-bench"
  let outC := outDir / "fail_closed_shape.c"
  IO.println s!"== {stageId}: write fail-closed-shape twin =="
  IO.FS.createDirAll outDir
  IO.FS.writeFile outC generatedSource
  let written <- IO.FS.readFile outC
  if written != generatedSource then
    IO.eprintln "error: generated fail-closed-shape content mismatch"
    throw (IO.userError "generated mismatch")
  unless hasAllRequired written && hasNoForbidden written do
    IO.eprintln "error: written fail-closed-shape failed protocol tokens"
    throw (IO.userError "written protocol")
  IO.println s!"wrote {outC} ({written.length})"

/-- CLI: write generated driver under repo root (default .). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    writeGenerated root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.RuntimeBenchFailClosedShape
"##

end SystemsLean.HostFrontLiveRuntimeBenchFailClosedShape
