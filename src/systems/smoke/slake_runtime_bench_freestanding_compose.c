/* SPDX-License-Identifier: Unlicense
 *
 * Runtime measurement smoke: freestanding product wire compose-class workload.
 * Links emit/slake_freestanding.c + header only (no Lean runtime, no GC lib).
 * Measurement/behavioral role only -- NOT product wire under emit/out.
 * Not PROVABLY-as-speed. Not residual claim flip.
 *
 * Workload cold (one op, primary product-shape): host compose init -> push a
 * few IR nodes + edges -> mint MULT-1 host token -> mark erased for MULT-0 ->
 * well-typed + check_fail_closed + extract -> exact-once consume.
 * Fail-closed second consume checked once untimed.
 *
 * Workload micro (T9, measurement only): init/push/edges/mark once, then hot
 * loop remint -> check -> extract -> consume on the same compose shell.
 * Env BENCH_RUNTIME_COMPOSE_MICRO=1 enables micro. Cold remains default.
 * Micro is hot-path; cold is primary product-shape. Do not merge ns/op.
 *
 * Prints N, wall seconds, ns/op, ops/s (same metric shape as mint/consume v1).
 *
 * Stage timers (T1): optional smoke-side attribution only. Separate pass after
 * the primary timed loop so ns_per_op stays whole-op. Default ON; set
 * BENCH_RUNTIME_STAGE_TIMERS=0 to skip. Product wire has no always-on timers.
 *
 * Leftover isolate: a second batch pass times well_typed, extract, init, and
 * reset as whole loops (one clock around N calls). Per-call stage sandwiches
 * are timer-dominated at this ns/op. well_typed is bench-only, not product Out.
 * Extract still runs on the primary cold arm. Default cold stays full init.
 *
 * Usage:  slake_runtime_bench_freestanding_compose [N]
 * Default N: 5000000 (heavier than mint/consume; calibrate ~0.5-2 s wall).
 */
#define _POSIX_C_SOURCE 200809L
#include "slake_freestanding.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* Stage index for attribution (smoke only). */
enum compose_stage {
  ST_INIT = 0,
  ST_PUSH,
  ST_EDGES,
  ST_MINT,
  ST_MARK,
  ST_WELL_TYPED,
  ST_CHECK_FAIL_CLOSED,
  ST_EXTRACT,
  ST_CONSUME,
  ST_POST_CHECK,
  ST_COUNT
};

static const char *stage_names[ST_COUNT] = {
    "init",
    "push_nodes",
    "edges",
    "mint",
    "mark",
    "well_typed",
    "check_fail_closed",
    "extract",
    "consume",
    "post_check",
};

static double wall_seconds(void)
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) {
    return -1.0;
  }
  return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

/* Nanoseconds between two wall_seconds samples; floor at 0. */
static double delta_ns(double t0, double t1)
{
  double d = (t1 - t0) * 1e9;
  return d < 0.0 ? 0.0 : d;
}

/* Opt-in hotter compose loop (T9). Default off = cold full re-init each op. */
static int compose_micro_enabled(void)
{
  const char *e = getenv("BENCH_RUNTIME_COMPOSE_MICRO");
  if (e == NULL || e[0] == '\0') {
    return 0;
  }
  if (strcmp(e, "0") == 0 || strcmp(e, "off") == 0 || strcmp(e, "false") == 0
      || strcmp(e, "cold") == 0) {
    return 0;
  }
  /* 1 / on / true / micro / yes */
  return 1;
}

/* Build graph + erased once for micro reuse. Host token left empty. */
static int compose_shell_setup(slake_host_compose *hc, uint32_t id, double *sums)
{
  double t0 = 0.0, t1 = 0.0;

  if (sums) {
    t0 = wall_seconds();
  }
  if (slake_host_compose_init(hc) != 0) {
    return 1;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_INIT] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_push_node(hc, 10u + (id % 7u), SLAKE_MULT_OMEGA,
                                   SLAKE_IR_KIND_VALUE)
      != 0) {
    return 2;
  }
  if (slake_host_compose_push_node(hc, 20u + (id % 5u), SLAKE_MULT_1,
                                   SLAKE_IR_KIND_LINEAR)
      != 0) {
    return 3;
  }
  if (slake_host_compose_push_node(hc, 30u + (id % 3u), SLAKE_MULT_0,
                                   SLAKE_IR_KIND_ERASED)
      != 0) {
    return 4;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_PUSH] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_add_edge(hc, 0, 1) != 0) {
    return 5;
  }
  if (slake_host_compose_add_edge(hc, 1, 2) != 0) {
    return 6;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_EDGES] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_mark_erased(hc) != 0) {
    return 8;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_MARK] += delta_ns(t0, t1);
  }
  return 0;
}

/* Hot path on an already-setup shell: remint after spent/empty is allowed. */
static int compose_hot_once(slake_host_compose *hc, uint32_t id,
                            volatile unsigned long *sink, double *sums)
{
  enum slake_runtime_class out_rt;
  unsigned long acc = 0;
  double t0 = 0.0, t1 = 0.0;

  if (sums) {
    t0 = wall_seconds();
  }
  if (slake_host_compose_mint(hc, id) != 0) {
    return 7;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_MINT] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_is_well_typed(hc) != 1) {
    return 9;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_WELL_TYPED] += delta_ns(t0, t1);
    t0 = t1;
  }

  /* E2 fuse: extract alone is single-walk check+write. Do not call
   * check_fail_closed before extract (double mult pre-scan). Stage key
   * check_fail_closed stays 0 on this path; cost is under extract. */
  out_rt = SLAKE_RUNTIME_CLASSIC; /* poison; extract must overwrite */
  if (slake_host_compose_extract(hc, &out_rt) != (int)SLAKE_EXTRACT_OK) {
    return 11;
  }
  if (out_rt != SLAKE_RUNTIME_FS) {
    return 12;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_EXTRACT] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_consume(hc) != 0) {
    return 13;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_CONSUME] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_check_fail_closed(hc) != (int)SLAKE_EXTRACT_FAIL_CLOSED) {
    return 14;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_POST_CHECK] += delta_ns(t0, t1);
  }

  acc += (unsigned long)id;
  acc += (unsigned long)hc->graph.prog.count;
  acc += (unsigned long)hc->graph.edge_count;
  *sink += acc;
  return 0;
}

/* Opt-in multi-op reset path (E3). Default off = cold full init every op.
 * Cached once: never call getenv per timed op (that inflated compose ns/op). */
static int compose_reset_enabled(void)
{
  static int cached = -1;
  const char *e;

  if (cached >= 0) {
    return cached;
  }
  e = getenv("BENCH_RUNTIME_COMPOSE_RESET");
  if (e == NULL || e[0] == '\0') {
    cached = 0;
    return 0;
  }
  if (strcmp(e, "0") == 0 || strcmp(e, "off") == 0 || strcmp(e, "false") == 0
      || strcmp(e, "cold") == 0) {
    cached = 0;
    return 0;
  }
  cached = 1;
  return 1;
}

/* One compose-class op on product wire. Returns nonzero on API failure.
 * If sums is non-NULL, accumulate stage ns for this op (smoke attribution).
 * Cold path (default): full init every op (primary product-shape).
 * E3 opt-in: BENCH_RUNTIME_COMPOSE_RESET=1 reuses shell via reset after first init. */
static int compose_once(uint32_t id, volatile unsigned long *sink, double *sums)
{
  static slake_host_compose hc_reset;
  static int hc_reset_ready = 0;
  slake_host_compose hc_cold;
  slake_host_compose *hc;
  enum slake_runtime_class out_rt;
  unsigned long acc = 0;
  double t0, t1;
  int use_reset = compose_reset_enabled();

  if (use_reset) {
    hc = &hc_reset;
  } else {
    hc = &hc_cold;
  }

  if (sums) {
    t0 = wall_seconds();
  }
  if (use_reset) {
    if (!hc_reset_ready) {
      if (slake_host_compose_init(hc) != 0) {
        return 1;
      }
      hc_reset_ready = 1;
    } else if (slake_host_compose_reset(hc) != 0) {
      return 1;
    }
  } else if (slake_host_compose_init(hc) != 0) {
    return 1;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_INIT] += delta_ns(t0, t1);
    t0 = t1;
  }

  /* Small IR graph: OMEGA value, MULT-1 linear, MULT-0 erased. */
  if (slake_host_compose_push_node(hc, 10u + (id % 7u), SLAKE_MULT_OMEGA,
                                   SLAKE_IR_KIND_VALUE)
      != 0) {
    return 2;
  }
  if (slake_host_compose_push_node(hc, 20u + (id % 5u), SLAKE_MULT_1,
                                   SLAKE_IR_KIND_LINEAR)
      != 0) {
    return 3;
  }
  if (slake_host_compose_push_node(hc, 30u + (id % 3u), SLAKE_MULT_0,
                                   SLAKE_IR_KIND_ERASED)
      != 0) {
    return 4;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_PUSH] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_add_edge(hc, 0, 1) != 0) {
    return 5;
  }
  if (slake_host_compose_add_edge(hc, 1, 2) != 0) {
    return 6;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_EDGES] += delta_ns(t0, t1);
    t0 = t1;
  }

  /* Exact-once host token for MULT-1 nodes. */
  if (slake_host_compose_mint(hc, id) != 0) {
    return 7;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_MINT] += delta_ns(t0, t1);
    t0 = t1;
  }

  /* MULT-0 pre-scan needs erased mark. */
  if (slake_host_compose_mark_erased(hc) != 0) {
    return 8;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_MARK] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_is_well_typed(hc) != 1) {
    return 9;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_WELL_TYPED] += delta_ns(t0, t1);
    t0 = t1;
  }

  /* E2 fuse: extract alone (single-walk). post_check still uses check. */
  out_rt = SLAKE_RUNTIME_CLASSIC; /* poison; extract must overwrite */
  if (slake_host_compose_extract(hc, &out_rt) != (int)SLAKE_EXTRACT_OK) {
    return 11;
  }
  if (out_rt != SLAKE_RUNTIME_FS) {
    return 12;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_EXTRACT] += delta_ns(t0, t1);
    t0 = t1;
  }

  if (slake_host_compose_consume(hc) != 0) {
    return 13;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_CONSUME] += delta_ns(t0, t1);
    t0 = t1;
  }

  /* After consume, MULT-1 path fails closed (exact-once). */
  if (slake_host_compose_check_fail_closed(hc) != (int)SLAKE_EXTRACT_FAIL_CLOSED) {
    return 14;
  }
  if (sums) {
    t1 = wall_seconds();
    sums[ST_POST_CHECK] += delta_ns(t0, t1);
  }

  acc += (unsigned long)id;
  acc += (unsigned long)hc->graph.prog.count;
  acc += (unsigned long)hc->graph.edge_count;
  *sink += acc;
  return 0;
}

/* Untimed contract: one full cold op + second consume on a spent compose fails. */
static int contract_compose_once(void)
{
  slake_host_compose hc;
  enum slake_runtime_class out_rt;
  volatile unsigned long sink = 0;
  int rc;

  rc = compose_once(1u, &sink, NULL);
  if (rc != 0) {
    return rc;
  }
  /* Fresh compose, mint, consume, second consume fails closed. */
  if (slake_host_compose_init(&hc) != 0) {
    return 20;
  }
  if (slake_host_compose_push_node(&hc, 1, SLAKE_MULT_1, SLAKE_IR_KIND_LINEAR)
      != 0) {
    return 21;
  }
  if (slake_host_compose_mint(&hc, 7) != 0) {
    return 22;
  }
  if (slake_host_compose_consume(&hc) != 0) {
    return 23;
  }
  if (slake_host_compose_consume(&hc) != -2) {
    return 24;
  }
  (void)out_rt;
  return 0;
}

/* Cold: full re-init each op. Micro: one shell, remint/consume hot loop. */
static int run_ops(unsigned long n, volatile unsigned long *sink, double *sums,
                   int micro)
{
  unsigned long i;
  *sink = 0;
  if (!micro) {
    for (i = 0; i < n; i++) {
      uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);
      int rc = compose_once(id, sink, sums);
      if (rc != 0) {
        return 100 + rc;
      }
    }
    return 0;
  }

  {
    slake_host_compose hc;
    int rc = compose_shell_setup(&hc, 1u, sums);
    if (rc != 0) {
      return 100 + rc;
    }
    for (i = 0; i < n; i++) {
      uint32_t id = (uint32_t)((i % 0xfffffffeu) + 1u);
      rc = compose_hot_once(&hc, id, sink, sums);
      if (rc != 0) {
        return 100 + rc;
      }
    }
  }
  return 0;
}

/* Default ON; BENCH_RUNTIME_STAGE_TIMERS=0 disables (smoke only). */
static int stage_timers_enabled(void)
{
  const char *e = getenv("BENCH_RUNTIME_STAGE_TIMERS");
  if (e == NULL || e[0] == '\0') {
    return 1;
  }
  if (strcmp(e, "0") == 0 || strcmp(e, "off") == 0 || strcmp(e, "false") == 0) {
    return 0;
  }
  return 1;
}

/* Cap stage attribution N so suite stays practical when primary N is huge. */
static unsigned long stage_pass_n(unsigned long n)
{
  const char *e = getenv("BENCH_RUNTIME_STAGE_N");
  if (e != NULL && e[0] != '\0') {
    char *end = 0;
    unsigned long parsed = strtoul(e, &end, 10);
    if (end != e && parsed > 0) {
      return parsed;
    }
  }
  /* Default: min(n, 200000) -- enough for stable stage ratios. */
  if (n > 200000ul) {
    return 200000ul;
  }
  return n;
}

#if defined(__GNUC__)
#define COMPOSE_ISOLATE_NOINLINE __attribute__((noinline))
#else
#define COMPOSE_ISOLATE_NOINLINE
#endif

/* Hide isolate callees from LTO so the batch loop still runs the real work. */
static COMPOSE_ISOLATE_NOINLINE int isolate_call_well_typed(
    const slake_host_compose *hc)
{
  return slake_host_compose_is_well_typed(hc);
}

static COMPOSE_ISOLATE_NOINLINE int isolate_call_extract(
    const slake_host_compose *hc, enum slake_runtime_class *out_rt)
{
  return slake_host_compose_extract(hc, out_rt);
}

static COMPOSE_ISOLATE_NOINLINE int isolate_call_init(slake_host_compose *hc)
{
  return slake_host_compose_init(hc);
}

static COMPOSE_ISOLATE_NOINLINE int isolate_call_reset(slake_host_compose *hc)
{
  return slake_host_compose_reset(hc);
}

/* Default ON; BENCH_RUNTIME_ISOLATE_PASS=0 disables (smoke only). */
static int isolate_pass_enabled(void)
{
  const char *e = getenv("BENCH_RUNTIME_ISOLATE_PASS");
  if (e == NULL || e[0] == '\0') {
    return 1;
  }
  if (strcmp(e, "0") == 0 || strcmp(e, "off") == 0 || strcmp(e, "false") == 0) {
    return 0;
  }
  return 1;
}

static unsigned long isolate_pass_n(unsigned long n)
{
  const char *e = getenv("BENCH_RUNTIME_ISOLATE_N");
  if (e != NULL && e[0] != '\0') {
    char *end = 0;
    unsigned long parsed = strtoul(e, &end, 10);
    if (end != e && parsed > 0) {
      return parsed;
    }
  }
  return stage_pass_n(n);
}

/* Batch leftover isolate: well_typed (bench-only) vs extract vs cold init.
 * Reset is the E3 opt-in compare, not the default. Extract is not skipped. */
static int run_isolate_pass(unsigned long n, double whole_op_ns,
                            volatile unsigned long *sink)
{
  slake_host_compose hc;
  slake_host_compose tmp;
  slake_host_compose rst;
  enum slake_runtime_class out_rt;
  unsigned long i;
  double t0;
  double t1;
  double ns_wt;
  double ns_ext;
  double ns_init;
  double ns_reset;
  volatile unsigned long acc = 0;

  if (n == 0) {
    n = 1;
  }

  if (compose_shell_setup(&hc, 1u, NULL) != 0) {
    return 1;
  }
  if (slake_host_compose_mint(&hc, 1u) != 0) {
    return 2;
  }

  t0 = wall_seconds();
  if (t0 < 0.0) {
    return 70;
  }
  for (i = 0; i < n; i++) {
    acc += (unsigned long)isolate_call_well_typed(&hc);
  }
  t1 = wall_seconds();
  if (t1 < 0.0) {
    return 71;
  }
  ns_wt = ((t1 - t0) * 1e9) / (double)n;

  t0 = wall_seconds();
  for (i = 0; i < n; i++) {
    out_rt = SLAKE_RUNTIME_CLASSIC;
    if (isolate_call_extract(&hc, &out_rt) != (int)SLAKE_EXTRACT_OK) {
      return 3;
    }
    acc += (unsigned long)out_rt;
  }
  t1 = wall_seconds();
  ns_ext = ((t1 - t0) * 1e9) / (double)n;

  t0 = wall_seconds();
  for (i = 0; i < n; i++) {
    if (isolate_call_init(&tmp) != 0) {
      return 4;
    }
    acc += (unsigned long)tmp.valid;
  }
  t1 = wall_seconds();
  ns_init = ((t1 - t0) * 1e9) / (double)n;

  if (isolate_call_init(&rst) != 0) {
    return 5;
  }
  t0 = wall_seconds();
  for (i = 0; i < n; i++) {
    if (isolate_call_reset(&rst) != 0) {
      return 6;
    }
    acc += (unsigned long)rst.valid;
  }
  t1 = wall_seconds();
  ns_reset = ((t1 - t0) * 1e9) / (double)n;

  *sink += acc;

  printf("isolate_pass=on\n");
  printf("isolate_N=%lu\n", n);
  printf("isolate_ns_per_op_well_typed=%.4f\n", ns_wt);
  printf("isolate_ns_per_op_extract=%.4f\n", ns_ext);
  printf("isolate_ns_per_op_init=%.4f\n", ns_init);
  printf("isolate_ns_per_op_reset=%.4f\n", ns_reset);
  printf("isolate_honesty=well_typed_is_bench_only_not_product_Out\n");
  printf("isolate_extract_skipped=0\n");
  printf("isolate_default_cold=full_init\n");
  if (whole_op_ns > 0.0) {
    printf("isolate_share_pct_well_typed=%.2f\n", 100.0 * ns_wt / whole_op_ns);
    printf("isolate_share_pct_extract=%.2f\n", 100.0 * ns_ext / whole_op_ns);
    printf("isolate_share_pct_init=%.2f\n", 100.0 * ns_init / whole_op_ns);
    printf("isolate_share_pct_reset=%.2f\n", 100.0 * ns_reset / whole_op_ns);
  }
  return 0;
}

static void print_stage_totals(const double *sums, unsigned long sn, int micro)
{
  int i;
  double total = 0.0;
  printf("stage_timers=on\n");
  printf("stage_N=%lu\n", sn);
  printf("stage_compose_mode=%s\n", micro ? "micro" : "cold");
  for (i = 0; i < ST_COUNT; i++) {
    total += sums[i];
  }
  printf("stage_ns_sum_total=%.0f\n", total);
  if (sn == 0) {
    sn = 1;
  }
  for (i = 0; i < ST_COUNT; i++) {
    double per = sums[i] / (double)sn;
    double pct = (total > 0.0) ? (100.0 * sums[i] / total) : 0.0;
    printf("stage_ns_sum_%s=%.0f\n", stage_names[i], sums[i]);
    printf("stage_ns_per_op_%s=%.4f\n", stage_names[i], per);
    printf("stage_pct_%s=%.2f\n", stage_names[i], pct);
  }
  /* Grouped rollups for quick attribution. */
  {
    double setup = sums[ST_INIT] + sums[ST_PUSH] + sums[ST_EDGES];
    double check = sums[ST_WELL_TYPED] + sums[ST_CHECK_FAIL_CLOSED] + sums[ST_POST_CHECK];
    double mint_mark = sums[ST_MINT] + sums[ST_MARK];
    double extract_consume = sums[ST_EXTRACT] + sums[ST_CONSUME];
    printf("stage_group_ns_per_op_setup=%.4f\n", setup / (double)sn);
    printf("stage_group_ns_per_op_mint_mark=%.4f\n", mint_mark / (double)sn);
    printf("stage_group_ns_per_op_check=%.4f\n", check / (double)sn);
    printf("stage_group_ns_per_op_extract_consume=%.4f\n", extract_consume / (double)sn);
  }
}

int main(int argc, char **argv)
{
  unsigned long n = 5000000ul;
  volatile unsigned long sink = 0;
  double t0, t1, elapsed;
  int rc;
  double ns_per_op;
  double ops_per_s;
  int do_stages;
  int micro;

  if (argc >= 2) {
    char *end = 0;
    unsigned long parsed = strtoul(argv[1], &end, 10);
    if (end == argv[1] || parsed == 0) {
      fprintf(stderr, "usage: %s [N>0]\n", argv[0]);
      return 64;
    }
    n = parsed;
  }

  micro = compose_micro_enabled();

  printf("arm=R-free-compose\n");
  if (micro) {
    printf("workload=host_compose micro: setup once then remint check extract consume\n");
    printf("compose_mode=micro\n");
  } else {
    printf("workload=host_compose init push nodes edges mint mark check extract consume\n");
    printf("compose_mode=cold\n");
  }
  printf("job_class=compose\n");
  printf("N=%lu\n", n);
  printf("compose_reset=%s\n", compose_reset_enabled() ? "1" : "0");
  printf("product_wire=slake_freestanding (HOST_COMPOSE_V0 + linear ownership)\n");
  if (micro) {
    printf("honesty=micro_is_hot_path_cold_is_primary_product_shape\n");
  }

  rc = contract_compose_once();
  if (rc != 0) {
    fprintf(stderr, "contract FAIL code=%d (compose mint/consume)\n", rc);
    return rc;
  }
  printf("contract=ok compose_mint_consume_double_fails_closed\n");

  /* Primary warmup + timed loop: no stage timers (clean whole-op ns/op). */
  rc = run_ops(n, &sink, NULL, micro);
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
  rc = run_ops(n, &sink, NULL, micro);
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

  /* Separate stage-attribution pass (smoke only; does not change product wire). */
  do_stages = stage_timers_enabled();
  if (do_stages) {
    double sums[ST_COUNT];
    unsigned long sn = stage_pass_n(n);
    int i;
    for (i = 0; i < ST_COUNT; i++) {
      sums[i] = 0.0;
    }
    rc = run_ops(sn, &sink, sums, micro);
    if (rc != 0) {
      fprintf(stderr, "stage pass FAIL code=%d\n", rc);
      return rc;
    }
    print_stage_totals(sums, sn, micro);
  } else {
    printf("stage_timers=off\n");
  }

  if (isolate_pass_enabled()) {
    unsigned long in = isolate_pass_n(n);
    rc = run_isolate_pass(in, ns_per_op, &sink);
    if (rc != 0) {
      fprintf(stderr, "isolate pass FAIL code=%d\n", rc);
      return rc;
    }
  } else {
    printf("isolate_pass=off\n");
    printf("isolate_extract_skipped=0\n");
  }

  return 0;
}
