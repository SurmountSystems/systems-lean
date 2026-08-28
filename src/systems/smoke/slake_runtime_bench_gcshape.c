/* SPDX-License-Identifier: Unlicense
 *
 * Runtime measurement smoke: GC-shaped heap churn baseline.
 * Same logical protocol as freestanding arm: N x (acquire -> use -> release once).
 * Implementation: malloc + free every iteration (allocator pressure / runtime lib use).
 * NOT Boehm GC. NOT Lean managed runtime. NOT product wire.
 * Measurement/behavioral role only.
 *
 * Prints N, wall seconds, ns/op, ops/s (same metric shape as freestanding arm).
 *
 * Usage:  slake_runtime_bench_gcshape [N]
 * Default N: 200000000 (match freestanding calibration).
 */
#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* One live "resource" slot: heap block + live flag. Same logical shape as
 * acquire -> use once -> release; second release fails closed. */
typedef struct gcshape_slot {
  uint32_t *payload; /* heap; null when empty/spent */
  uint8_t state;     /* 0 empty; 1 live; 2 spent */
} gcshape_slot;

static double wall_seconds(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return -1.0;
  }
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

static int slot_init(gcshape_slot *s)
{
  if (s == 0) {
    return -1;
  }
  s->payload = 0;
  s->state = 0;
  return 0;
}

/* Acquire: malloc payload, write id. Fail closed if already live. */
static int slot_acquire(gcshape_slot *s, uint32_t id)
{
  uint32_t *p;
  if (s == 0 || id == 0) {
    return -1;
  }
  if (s->state == 1) {
    return -2;
  }
  p = (uint32_t *)malloc(sizeof(uint32_t));
  if (p == 0) {
    return -3;
  }
  *p = id;
  s->payload = p;
  s->state = 1;
  return 0;
}

/* Release once: free payload. Fail closed if not live (-2 spent/empty). */
static int slot_release(gcshape_slot *s)
{
  if (s == 0) {
    return -1;
  }
  if (s->state != 1 || s->payload == 0) {
    if (s->state == 1) {
      s->state = 2;
    }
    return -2;
  }
  free(s->payload);
  s->payload = 0;
  s->state = 2;
  return 0;
}

/* Untimed contract: acquire -> release -> second release fails. */
static int contract_acquire_release_once(void)
{
  gcshape_slot s;
  if (slot_init(&s) != 0) {
    return 1;
  }
  if (slot_acquire(&s, 1) != 0) {
    return 2;
  }
  if (s.state != 1 || s.payload == 0 || *s.payload != 1) {
    return 3;
  }
  if (slot_release(&s) != 0) {
    return 4;
  }
  if (s.state != 2 || s.payload != 0) {
    return 5;
  }
  if (slot_release(&s) != -2) {
    return 6;
  }
  return 0;
}

static int run_ops(unsigned long n, volatile unsigned long *sink)
{
  gcshape_slot s;
  unsigned long i;
  unsigned long acc = 0;

  if (slot_init(&s) != 0) {
    return 10;
  }
  for (i = 0; i < n; i++) {
    uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);
    if (slot_acquire(&s, id) != 0) {
      return 11;
    }
    /* Use once: read payload then release. */
    acc += (unsigned long)(*s.payload);
    if (slot_release(&s) != 0) {
      return 12;
    }
    /* Allow remint next iter: empty after spent for next acquire. */
    s.state = 0;
  }
  *sink = acc;
  return 0;
}

int main(int argc, char **argv)
{
  unsigned long n = 200000000ul;
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

  printf("arm=R-gc-shape\n");
  printf("workload=malloc acquire then free release once (GC-shaped heap churn)\n");
  printf("N=%lu\n", n);
  printf("baseline=heap_churn_not_boehm_not_lean_gc\n");

  rc = contract_acquire_release_once();
  if (rc != 0) {
    fprintf(stderr, "contract FAIL code=%d\n", rc);
    return rc;
  }
  printf("contract=ok acquire_release_double_fails_closed\n");

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
