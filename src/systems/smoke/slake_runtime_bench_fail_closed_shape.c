/* SPDX-License-Identifier: Unlicense
 *
 * Runtime measurement smoke: fail-closed-shape compose twin.
 * Same fail-closed work as freestanding host_compose on the stack:
 *   fixed caps 8 nodes + 16 edges; 3+2 bench graph; well-typed pairing;
 *   mult pre-scan; extract-shaped write of a runtime-fs tag; consume;
 *   post fail-closed expected after spend.
 * NO malloc in the timed op. Does NOT call slake_* product APIs.
 * Does NOT include slake_freestanding.h. NOT product wire under emit/out.
 * Label: fail_closed_shape (not heap_churn). Keep malloc compose as heap_churn.
 * Measurement/behavioral role only. Not PROVABLY-as-speed. Not a claim flip.
 *
 * Graph (same as product cold compose arm):
 *   OMEGA+VALUE, MULT-1+LINEAR, MULT-0+ERASED; edges 0->1, 1->2.
 *
 * Usage:  slake_runtime_bench_fail_closed_shape [N]
 * Default N: 5000000 (match freestanding compose calibration).
 */
#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define SHAPE_NODE_CAP 8
#define SHAPE_EDGE_CAP 16

#define SHAPE_MULT_0 0
#define SHAPE_MULT_1 1
#define SHAPE_MULT_OMEGA 2

#define SHAPE_KIND_VALUE 0
#define SHAPE_KIND_LINEAR 1
#define SHAPE_KIND_ERASED 2

#define SHAPE_EXTRACT_OK 0
#define SHAPE_EXTRACT_FAIL_CLOSED 1
#define SHAPE_RUNTIME_FS 1

typedef struct shape_node {
  uint32_t type_tag;
  uint8_t mult;
  uint8_t kind;
  uint8_t valid;
} shape_node;

typedef struct shape_edge {
  uint8_t from;
  uint8_t to;
  uint8_t valid;
} shape_edge;

typedef struct shape_token {
  uint32_t id;
  uint8_t live;
  uint8_t state; /* 0 empty; 1 live; 2 spent */
} shape_token;

typedef struct shape_compose {
  shape_node nodes[SHAPE_NODE_CAP];
  shape_edge edges[SHAPE_EDGE_CAP];
  shape_token host;
  uint8_t node_count;
  uint8_t edge_count;
  uint8_t erased; /* 1 marked */
  uint8_t valid;
} shape_compose;

static double wall_seconds(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return -1.0;
  }
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

static int kind_matches_mult(uint8_t kind, uint8_t mult)
{
  if (kind == SHAPE_KIND_VALUE && mult == SHAPE_MULT_OMEGA) {
    return 1;
  }
  if (kind == SHAPE_KIND_LINEAR && mult == SHAPE_MULT_1) {
    return 1;
  }
  if (kind == SHAPE_KIND_ERASED && mult == SHAPE_MULT_0) {
    return 1;
  }
  return 0;
}

static int node_well_typed(const shape_node *n)
{
  if (n == 0 || n->valid == 0) {
    return 0;
  }
  if (n->mult > SHAPE_MULT_OMEGA) {
    return 0;
  }
  return kind_matches_mult(n->kind, n->mult);
}

static int program_well_typed(const shape_compose *c)
{
  uint8_t i;
  if (c == 0 || c->valid == 0) {
    return 0;
  }
  if (c->node_count == 0 || c->node_count > (uint8_t)SHAPE_NODE_CAP) {
    return 0;
  }
  for (i = 0; i < c->node_count; i++) {
    if (node_well_typed(&c->nodes[i]) != 1) {
      return 0;
    }
  }
  return 1;
}

static int graph_well_typed(const shape_compose *c)
{
  uint8_t i;
  if (c == 0 || c->valid == 0) {
    return 0;
  }
  if (c->edge_count > (uint8_t)SHAPE_EDGE_CAP) {
    return 0;
  }
  if (c->node_count == 0) {
    return (c->edge_count == 0) ? 1 : 0;
  }
  if (program_well_typed(c) != 1) {
    return 0;
  }
  for (i = 0; i < c->edge_count; i++) {
    if (c->edges[i].valid != 1) {
      return 0;
    }
    if (c->edges[i].from >= c->node_count || c->edges[i].to >= c->node_count) {
      return 0;
    }
  }
  return 1;
}

static int host_is_live(const shape_token *t)
{
  if (t == 0 || t->state != 1) {
    return 0;
  }
  return (t->live != 0) ? 1 : 0;
}

static int node_fail_closed(const shape_node *n, int host_live, int erased_marked)
{
  if (node_well_typed(n) != 1) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  if (n->mult == SHAPE_MULT_1) {
    if (host_live != 1) {
      return SHAPE_EXTRACT_FAIL_CLOSED;
    }
  } else if (n->mult == SHAPE_MULT_0) {
    if (erased_marked != 1) {
      return SHAPE_EXTRACT_FAIL_CLOSED;
    }
  }
  return SHAPE_EXTRACT_OK;
}

/* Compose check: well-typed + mult pre-scan + nested well-typed + per-node. */
static int check_fail_closed(const shape_compose *c)
{
  uint8_t i;
  int needs_mult1 = 0;
  int needs_mult0 = 0;
  int host_live;
  int erased_marked;

  if (c == 0 || c->valid == 0) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  if (graph_well_typed(c) != 1) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  for (i = 0; i < c->node_count; i++) {
    if (c->nodes[i].mult == SHAPE_MULT_1) {
      needs_mult1 = 1;
    }
    if (c->nodes[i].mult == SHAPE_MULT_0) {
      needs_mult0 = 1;
    }
  }
  host_live = host_is_live(&c->host);
  erased_marked = (c->erased != 0) ? 1 : 0;
  if (needs_mult1 != 0 && host_live == 0) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  if (needs_mult0 != 0 && erased_marked == 0) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  /* Nested graph/program well-typed (product re-walks these layers). */
  if (graph_well_typed(c) != 1) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  if (c->node_count == 0) {
    return SHAPE_EXTRACT_OK;
  }
  if (program_well_typed(c) != 1) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  for (i = 0; i < c->node_count; i++) {
    if (node_fail_closed(&c->nodes[i], host_live, erased_marked)
        != SHAPE_EXTRACT_OK) {
      return SHAPE_EXTRACT_FAIL_CLOSED;
    }
  }
  return SHAPE_EXTRACT_OK;
}

/* Extract-shaped: one fail-closed walk then write runtime-fs tag. */
static int extract_shape(const shape_compose *c, int *out_rt)
{
  if (check_fail_closed(c) != SHAPE_EXTRACT_OK) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  if (out_rt == 0) {
    return SHAPE_EXTRACT_FAIL_CLOSED;
  }
  *out_rt = SHAPE_RUNTIME_FS;
  return SHAPE_EXTRACT_OK;
}

static int token_mint(shape_token *t, uint32_t id)
{
  if (t == 0 || id == 0) {
    return -1;
  }
  if (t->state == 1 && t->live != 0) {
    return -2;
  }
  t->id = id;
  t->live = 1;
  t->state = 1;
  return 0;
}

static int token_consume(shape_token *t)
{
  if (t == 0) {
    return -1;
  }
  if (t->state == 0) {
    return -1;
  }
  if (t->state == 2) {
    return -2;
  }
  if (t->live == 0) {
    t->state = 2;
    return -2;
  }
  t->live = 0;
  t->id = 0;
  t->state = 2;
  return 0;
}

/* Cold init: zero cap-8 nodes (OMEGA+VALUE dead) + cap-16 edges. */
static int compose_init(shape_compose *c)
{
  uint8_t i;
  if (c == 0) {
    return -1;
  }
  c->node_count = 0;
  c->edge_count = 0;
  c->erased = 0;
  c->host.id = 0;
  c->host.live = 0;
  c->host.state = 0;
  c->valid = 1;
  for (i = 0; i < (uint8_t)SHAPE_NODE_CAP; i++) {
    c->nodes[i].valid = 0;
    c->nodes[i].mult = SHAPE_MULT_OMEGA;
    c->nodes[i].kind = SHAPE_KIND_VALUE;
    c->nodes[i].type_tag = 0;
  }
  for (i = 0; i < (uint8_t)SHAPE_EDGE_CAP; i++) {
    c->edges[i].from = 0;
    c->edges[i].to = 0;
    c->edges[i].valid = 0;
  }
  return 0;
}

static int push_node(shape_compose *c, uint32_t tag, uint8_t mult, uint8_t kind)
{
  uint8_t i;
  if (c == 0 || c->valid == 0) {
    return -1;
  }
  if (c->node_count >= (uint8_t)SHAPE_NODE_CAP) {
    return -2;
  }
  if (kind_matches_mult(kind, mult) != 1) {
    return -1;
  }
  i = c->node_count;
  c->nodes[i].type_tag = tag;
  c->nodes[i].mult = mult;
  c->nodes[i].kind = kind;
  c->nodes[i].valid = 1;
  c->node_count = (uint8_t)(i + 1);
  return 0;
}

static int add_edge(shape_compose *c, uint8_t from, uint8_t to)
{
  uint8_t i;
  if (c == 0 || c->valid == 0) {
    return -1;
  }
  if (c->edge_count >= (uint8_t)SHAPE_EDGE_CAP) {
    return -1;
  }
  if (from >= c->node_count || to >= c->node_count) {
    return -1;
  }
  i = c->edge_count;
  c->edges[i].from = from;
  c->edges[i].to = to;
  c->edges[i].valid = 1;
  c->edge_count = (uint8_t)(i + 1);
  return 0;
}

/* One cold op: full re-init (primary product-shape). Extract is not skipped. */
static int compose_once(uint32_t id, volatile unsigned long *sink)
{
  shape_compose c;
  int out_rt = 0;
  unsigned long acc = 0;

  if (compose_init(&c) != 0) {
    return 1;
  }
  if (push_node(&c, 10u + (id % 7u), SHAPE_MULT_OMEGA, SHAPE_KIND_VALUE) != 0) {
    return 2;
  }
  if (push_node(&c, 20u + (id % 5u), SHAPE_MULT_1, SHAPE_KIND_LINEAR) != 0) {
    return 3;
  }
  if (push_node(&c, 30u + (id % 3u), SHAPE_MULT_0, SHAPE_KIND_ERASED) != 0) {
    return 4;
  }
  if (add_edge(&c, 0, 1) != 0) {
    return 5;
  }
  if (add_edge(&c, 1, 2) != 0) {
    return 6;
  }
  if (token_mint(&c.host, id) != 0) {
    return 7;
  }
  c.erased = 1;
  if (graph_well_typed(&c) != 1) {
    return 9;
  }
  out_rt = 0; /* poison; extract must overwrite */
  if (extract_shape(&c, &out_rt) != SHAPE_EXTRACT_OK) {
    return 11;
  }
  if (out_rt != SHAPE_RUNTIME_FS) {
    return 12;
  }
  if (token_consume(&c.host) != 0) {
    return 13;
  }
  if (check_fail_closed(&c) != SHAPE_EXTRACT_FAIL_CLOSED) {
    return 14;
  }
  acc += (unsigned long)id;
  acc += (unsigned long)c.node_count;
  acc += (unsigned long)c.edge_count;
  *sink += acc;
  return 0;
}

static int contract_compose_once(void)
{
  shape_compose c;
  volatile unsigned long sink = 0;
  int rc;

  rc = compose_once(1u, &sink);
  if (rc != 0) {
    return rc;
  }
  /* Pairing reject: LINEAR + OMEGA is ill-typed. */
  if (compose_init(&c) != 0) {
    return 20;
  }
  if (push_node(&c, 1, SHAPE_MULT_OMEGA, SHAPE_KIND_LINEAR) != -1) {
    return 21;
  }
  /* Spent consume fails closed. */
  if (compose_init(&c) != 0) {
    return 22;
  }
  if (push_node(&c, 1, SHAPE_MULT_1, SHAPE_KIND_LINEAR) != 0) {
    return 23;
  }
  if (token_mint(&c.host, 7) != 0) {
    return 24;
  }
  if (token_consume(&c.host) != 0) {
    return 25;
  }
  if (token_consume(&c.host) != -2) {
    return 26;
  }
  return 0;
}

static int run_ops(unsigned long n, volatile unsigned long *sink)
{
  unsigned long i;
  *sink = 0;
  for (i = 0; i < n; i++) {
    uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);
    int rc = compose_once(id, sink);
    if (rc != 0) {
      return 100 + rc;
    }
  }
  return 0;
}

int main(int argc, char **argv)
{
  unsigned long n = 5000000ul;
  volatile unsigned long sink = 0;
  double t0, t1, elapsed;
  int rc;
  double ns_per_op;
  double ops_per_s;

  if (argc >= 2) {
    char *end = 0;
    unsigned long parsed = strtoul(argv[1], &end, 10);
    if (end == argv[1] || parsed == 0) {
      fprintf(stderr, "usage: %s [N>0]\n", argv[0]);
      return 64;
    }
    n = parsed;
  }

  printf("arm=R-fail-closed-shape\n");
  printf("workload=stack 8+16 fail-closed compose (well-typed, pre-scan, extract, post)\n");
  printf("job_class=compose\n");
  printf("honesty=fail_closed_shape\n");
  printf("baseline=fail_closed_shape\n");
  printf("not_product_wire=1\n");
  printf("N=%lu\n", n);

  rc = contract_compose_once();
  if (rc != 0) {
    fprintf(stderr, "contract FAIL code=%d\n", rc);
    return rc;
  }
  printf("contract=ok fail_closed_shape pairing_and_spent\n");

  rc = run_ops(n, &sink);
  if (rc != 0) {
    fprintf(stderr, "warmup FAIL code=%d sink=%lu\n", rc, (unsigned long)sink);
    return rc;
  }
  printf("warmup=ok\n");

  t0 = wall_seconds();
  if (t0 < 0.0) {
    fprintf(stderr, "clock_gettime failed\n");
    return 70;
  }
  rc = run_ops(n, &sink);
  t1 = wall_seconds();
  if (rc != 0) {
    fprintf(stderr, "timed FAIL code=%d\n", rc);
    return rc;
  }
  if (t1 < 0.0) {
    fprintf(stderr, "clock_gettime failed after timed run\n");
    return 71;
  }

  elapsed = t1 - t0;
  if (elapsed <= 0.0) {
    elapsed = 1e-12;
  }
  ns_per_op = (elapsed * 1e9) / (double)n;
  ops_per_s = (double)n / elapsed;

  printf("wall_seconds=%.9f\n", elapsed);
  printf("ns_per_op=%.4f\n", ns_per_op);
  printf("ops_per_s=%.2f\n", ops_per_s);
  printf("sink=%lu\n", (unsigned long)sink);
  printf("status=ok\n");
  return 0;
}
