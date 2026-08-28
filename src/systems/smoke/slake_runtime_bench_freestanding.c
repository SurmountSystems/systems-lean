/* SPDX-License-Identifier: Unlicense
 *
 * Runtime measurement smoke: freestanding product wire linear mint/consume.
 * Links emit/slake_freestanding.c + header only (no Lean runtime, no GC lib).
 * Measurement/behavioral role only -- NOT product wire under emit/out.
 * Not PROVABLY-as-speed. Not residual claim flip.
 *
 * Workload: N x (mint MULT-1 -> consume once). Fail-closed second consume
 * checked once untimed. Prints N, wall seconds, ns/op, ops/s.
 *
 * Usage:  slake_runtime_bench_freestanding [N]
 * Default N: 200000000 (calibrate so wall ~0.5-2 s under -O2).
 */
#define _POSIX_C_SOURCE 200809L
#include "slake_freestanding.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static double wall_seconds(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return -1.0;
  }
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

/* Untimed contract: mint -> consume -> second consume fails closed (-2). */
static int contract_mint_consume_once(void)
{
  slake_consume_token ct;
  if (slake_consume_token_init(&ct) != 0) {
    return 1;
  }
  if (slake_consume_token_mint(&ct, 1) != 0) {
    return 2;
  }
  if (slake_consume_token_is_live(&ct) != 1) {
    return 3;
  }
  if (slake_consume_token_consume(&ct) != 0) {
    return 4;
  }
  if (slake_consume_token_is_live(&ct) != 0) {
    return 5;
  }
  if (slake_consume_token_consume(&ct) != -2) {
    return 6;
  }
  return 0;
}

/* Tight loop: mint then exact-once consume. Returns nonzero on API failure. */
static int run_ops(unsigned long n, volatile unsigned long *sink)
{
  slake_consume_token ct;
  unsigned long i;
  unsigned long acc = 0;

  if (slake_consume_token_init(&ct) != 0) {
    return 10;
  }
  for (i = 0; i < n; i++) {
    uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);
    if (slake_consume_token_mint(&ct, id) != 0) {
      return 11;
    }
    if (slake_consume_token_consume(&ct) != 0) {
      return 12;
    }
    acc += (unsigned long)id;
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

  printf("arm=R-free\n");
  printf("workload=slake_consume_token mint then consume once\n");
  printf("N=%lu\n", n);
  printf("product_wire=slake_freestanding (linear ownership APIs)\n");

  rc = contract_mint_consume_once();
  if (rc != 0) {
    fprintf(stderr, "contract FAIL code=%d (mint/consume/double-consume)\n", rc);
    return rc;
  }
  printf("contract=ok mint_consume_double_fails_closed\n");

  /* Warmup (untimed). */
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
