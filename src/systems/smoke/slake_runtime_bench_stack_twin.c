/* SPDX-License-Identifier: Unlicense
 *
 * Runtime measurement smoke: stack live-flag twin of freestanding mint/consume.
 * Same stack fields (id + live + state) and fail-closed codes as the product
 * consume-token protocol. NO malloc. Does NOT call slake_* product APIs.
 * Does NOT include slake_freestanding.h. NOT product wire under emit/out.
 * Measurement/behavioral role only. Not PROVABLY-as-speed. Not a claim flip.
 *
 * Answers: is Slake as cheap as careful C writing the same protocol?
 * Keep heap_churn (malloc/free) as the named allocator baseline.
 *
 * Fail-closed codes (match product mint/consume):
 *   mint:    0 ok; -1 null or id==0; -2 already live
 *   consume: 0 ok; -1 null or empty; -2 already spent
 * Remint after spent is allowed (mint keys off already-live, not empty).
 *
 * Usage:  slake_runtime_bench_stack_twin [N]
 * Default N: 200000000 (match freestanding mint calibration).
 */
#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* Flattened stack automaton: product token.id + token.live + host.state. */
typedef struct stack_twin_token {
  uint32_t id;
  uint8_t live;  /* 1 live; 0 spent/empty */
  uint8_t state; /* 0 empty; 1 live; 2 spent */
} stack_twin_token;

static double wall_seconds(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return -1.0;
  }
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

static int twin_init(stack_twin_token *t)
{
  if (t == 0) {
    return -1;
  }
  t->id = 0;
  t->live = 0;
  t->state = 0;
  return 0;
}

static int twin_is_live(const stack_twin_token *t)
{
  if (t == 0) {
    return 0;
  }
  if (t->state != 1) {
    return 0;
  }
  return (t->live != 0) ? 1 : 0;
}

/* 0 ok; -1 null or id==0; -2 already holds a live token. Remint after spent. */
static int twin_mint(stack_twin_token *t, uint32_t id)
{
  if (t == 0) {
    return -1;
  }
  if (id == 0) {
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

/* 0 ok; -1 null or empty; -2 already spent. Desync heal if state live but !live. */
static int twin_consume(stack_twin_token *t)
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

/* Untimed: mint/consume codes + remint after spent. */
static int contract_mint_consume_once(void)
{
  stack_twin_token t;

  if (twin_init(0) != -1) {
    return 1;
  }
  if (twin_init(&t) != 0) {
    return 2;
  }
  if (twin_mint(&t, 0) != -1) {
    return 3;
  }
  if (twin_consume(&t) != -1) {
    return 4; /* empty */
  }
  if (twin_mint(&t, 1) != 0) {
    return 5;
  }
  if (twin_is_live(&t) != 1) {
    return 6;
  }
  if (twin_mint(&t, 8) != -2) {
    return 7; /* already live */
  }
  if (twin_consume(&t) != 0) {
    return 8;
  }
  if (twin_is_live(&t) != 0) {
    return 9;
  }
  if (twin_consume(&t) != -2) {
    return 10; /* spent */
  }
  /* Remint after spent allowed (no forced empty reset). */
  if (twin_mint(&t, 9) != 0) {
    return 11;
  }
  if (twin_is_live(&t) != 1) {
    return 12;
  }
  if (twin_consume(&t) != 0) {
    return 13;
  }
  return 0;
}

static int run_ops(unsigned long n, volatile unsigned long *sink)
{
  stack_twin_token t;
  unsigned long i;
  unsigned long acc = 0;

  if (twin_init(&t) != 0) {
    return 20;
  }
  for (i = 0; i < n; i++) {
    uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);
    if (twin_mint(&t, id) != 0) {
      return 21;
    }
    if (twin_consume(&t) != 0) {
      return 22;
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

  printf("arm=R-stack-twin\n");
  printf("workload=stack live-flag mint then consume once (protocol twin)\n");
  printf("job_class=mint_consume\n");
  printf("N=%lu\n", n);
  printf("honesty=not_product_wire\n");
  printf("baseline=stack_live_flag_twin\n");
  printf("not_product_wire=1\n");

  rc = contract_mint_consume_once();
  if (rc != 0) {
    fprintf(stderr, "contract FAIL code=%d (stack twin mint/consume)\n", rc);
    return rc;
  }
  printf("contract=ok mint_consume_double_fails_closed remint_after_spent\n");

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
