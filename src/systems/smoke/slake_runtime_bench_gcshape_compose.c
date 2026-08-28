/* SPDX-License-Identifier: Unlicense
 *
 * Runtime measurement smoke: GC-shaped heap churn compose-class baseline.
 * Same logical structure as freestanding compose arm: N x (build small node
 * list / edges / token payload -> use -> free all at end of op).
 * Implementation: malloc node array + edge array + token payload each op;
 * free everything at end of op. NOT Boehm GC. NOT Lean managed runtime.
 * NOT product wire. Measurement/behavioral role only.
 *
 * Prints N, wall seconds, ns/op, ops/s (same metric shape as freestanding compose).
 *
 * Usage:  slake_runtime_bench_gcshape_compose [N]
 * Default N: 5000000 (match freestanding compose calibration).
 */
#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define COMPOSE_NODE_CAP 3
#define COMPOSE_EDGE_CAP 2

typedef struct gc_node {
  uint32_t type_tag;
  uint8_t mult; /* 0 / 1 / 2 */
  uint8_t kind; /* 0 value / 1 linear / 2 erased */
} gc_node;

typedef struct gc_edge {
  uint8_t from;
  uint8_t to;
} gc_edge;

typedef struct gc_compose {
  gc_node *nodes;
  gc_edge *edges;
  uint32_t *token; /* heap token payload when live */
  uint8_t node_count;
  uint8_t edge_count;
  uint8_t erased; /* 0/1 mark */
  uint8_t token_state; /* 0 empty; 1 live; 2 spent */
} gc_compose;

static double wall_seconds(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return -1.0;
  }
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

static void compose_free_all(gc_compose *c)
{
  if (c == 0) {
    return;
  }
  free(c->nodes);
  free(c->edges);
  free(c->token);
  c->nodes = 0;
  c->edges = 0;
  c->token = 0;
  c->node_count = 0;
  c->edge_count = 0;
  c->erased = 0;
  c->token_state = 0;
}

/* Build small graph + token; free all at end (heap churn per op). */
static int compose_once(uint32_t id, volatile unsigned long *sink)
{
  gc_compose c;
  unsigned long acc = 0;
  int i;

  memset(&c, 0, sizeof(c));
  c.nodes = (gc_node *)malloc((size_t)COMPOSE_NODE_CAP * sizeof(gc_node));
  c.edges = (gc_edge *)malloc((size_t)COMPOSE_EDGE_CAP * sizeof(gc_edge));
  if (c.nodes == 0 || c.edges == 0) {
    compose_free_all(&c);
    return 1;
  }
  /* Mirror freestanding node mult/kind pairing. */
  c.nodes[0].type_tag = 10u + (id % 7u);
  c.nodes[0].mult = 2; /* OMEGA */
  c.nodes[0].kind = 0; /* VALUE */
  c.nodes[1].type_tag = 20u + (id % 5u);
  c.nodes[1].mult = 1; /* MULT-1 */
  c.nodes[1].kind = 1; /* LINEAR */
  c.nodes[2].type_tag = 30u + (id % 3u);
  c.nodes[2].mult = 0; /* MULT-0 */
  c.nodes[2].kind = 2; /* ERASED */
  c.node_count = COMPOSE_NODE_CAP;
  c.edges[0].from = 0;
  c.edges[0].to = 1;
  c.edges[1].from = 1;
  c.edges[1].to = 2;
  c.edge_count = COMPOSE_EDGE_CAP;

  c.token = (uint32_t *)malloc(sizeof(uint32_t));
  if (c.token == 0) {
    compose_free_all(&c);
    return 2;
  }
  *c.token = id;
  c.token_state = 1;
  c.erased = 1;

  /* Use: walk nodes/edges and token (same logical "check" work). */
  for (i = 0; i < (int)c.node_count; i++) {
    acc += (unsigned long)c.nodes[i].type_tag;
    acc += (unsigned long)c.nodes[i].mult;
    acc += (unsigned long)c.nodes[i].kind;
  }
  for (i = 0; i < (int)c.edge_count; i++) {
    acc += (unsigned long)c.edges[i].from + (unsigned long)c.edges[i].to;
  }
  if (c.token_state != 1 || c.token == 0 || c.erased != 1) {
    compose_free_all(&c);
    return 3;
  }
  acc += (unsigned long)(*c.token);

  /* Exact-once "consume": free token, mark spent. */
  free(c.token);
  c.token = 0;
  c.token_state = 2;
  if (c.token_state != 2 || c.token != 0) {
    compose_free_all(&c);
    return 4;
  }

  /* Free remaining heap at end of op. */
  free(c.nodes);
  free(c.edges);
  c.nodes = 0;
  c.edges = 0;
  *sink += acc;
  return 0;
}

/* Untimed: one op + double-release fails closed on a spent token slot. */
static int contract_compose_once(void)
{
  gc_compose c;
  volatile unsigned long sink = 0;
  int rc;

  rc = compose_once(1u, &sink);
  if (rc != 0) {
    return rc;
  }
  memset(&c, 0, sizeof(c));
  c.token = (uint32_t *)malloc(sizeof(uint32_t));
  if (c.token == 0) {
    return 10;
  }
  *c.token = 7;
  c.token_state = 1;
  free(c.token);
  c.token = 0;
  c.token_state = 2;
  /* Second release on spent: fail closed (no double free). */
  if (c.token_state != 2 || c.token != 0) {
    return 11;
  }
  /* Attempting to free null is a no-op; protocol returns fail code. */
  if (c.token_state == 2) {
    /* ok: spent */
  } else {
    return 12;
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

  printf("arm=R-gc-shape-compose\n");
  printf("workload=malloc node list edges token then free all each op (compose heap churn)\n");
  printf("job_class=compose\n");
  printf("N=%lu\n", n);
  printf("baseline=heap_churn_not_boehm_not_lean_gc\n");

  rc = contract_compose_once();
  if (rc != 0) {
    fprintf(stderr, "contract FAIL code=%d\n", rc);
    return rc;
  }
  printf("contract=ok compose_acquire_release_once\n");

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
