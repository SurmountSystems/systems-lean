# Implement report: Wave 3 tools T6 T7 T9

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** measurement tooling (just process glue + smoke micro mode + research). Not claim flips.
**Status:** **GREEN**

ASCII only. Plain American English.

---

## Goal

Close residual Names **T6 Runtime regression vs previous**, **T7 Host perf attach recipe**,
and **T9 Compose microbench mode** (Wave 3 tools track). No free/complete/PROVABLY/FullHost forge.
No emit SSOT product edit.

---

## Done when (met)

| # | Name | Outcome | Evidence |
|---|------|---------|----------|
| T6 | Runtime regression vs previous | `just bench-runtime-regress` compares living metrics median ns/op to tip baseline; defaults PCT=10, MODE=fail; soft-skip no baseline; default suite does not hard-fail CI; suite opt-in `BENCH_RUNTIME_REGRESS=1` | just + research + exit codes |
| T7 | Host perf attach recipe | `just bench-runtime-perf-mint` / `bench-runtime-perf-compose`; soft-skip `skip_no_perf`; optional record | just recipes |
| T9 | Compose microbench mode | `BENCH_RUNTIME_COMPOSE_MICRO=1` / `just bench-runtime-freestanding-compose-micro`; cold default remains; docs honest | smoke driver + just |

---

## Implementation

### T6 Runtime regression vs previous

- Recipe `just bench-runtime-regress` in `just/bench-runtime.just`.
- Living `doc/BENCH-RUNTIME-metrics.tsv` vs tip `doc/BENCH-RUNTIME-baseline.tsv`
  (override `BENCH_RUNTIME_REGRESS_BASELINE`).
- Defaults: `BENCH_RUNTIME_REGRESS_PCT=10` (fail if current median > baseline by more than 10%);
  `BENCH_RUNTIME_REGRESS_MODE=fail` or `warn`.
- Soft-skip: missing metrics, missing baseline, no overlapping ok arms (exit 0).
- **Default `just bench-runtime` never runs regress** and never hard-fails CI on regression.
- Opt-in: `BENCH_RUNTIME_REGRESS=1 just bench-runtime` invokes regress after metrics write.
- Not in default `just check`.

### T7 Host perf attach

- `just bench-runtime-perf-mint` / `just bench-runtime-perf-compose`.
- Link freestanding binary, run `perf stat -d`. Soft-skip if no `perf` / no `cc`.
- Optional `BENCH_RUNTIME_PERF_RECORD=1` for `perf record -g` under `/tmp`.
- `BENCH_RUNTIME_PERF_N` overrides op count. Compose respects micro env.
- No always-on product wire instrumentation.

### T9 Compose microbench mode

- Smoke `slake_runtime_bench_freestanding_compose.c`: cold path unchanged (full init each op).
- Micro path: setup graph + mark once; hot remint / check / extract / consume loop
  (remint after spent is allowed by host token API).
- Env `BENCH_RUNTIME_COMPOSE_MICRO=1` or recipe `just bench-runtime-freestanding-compose-micro`.
- Prints `compose_mode=cold|micro` and honesty line for micro.
- Cold remains primary product-shape arm in default suite. Do not merge cold/micro ns/op.

### Research / docs

- `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md` (policy + how-to).
- Living report Methods/How-to paths updated in suite writer.
- `doc/bench-history/README.md`, `just/README.md`, residual, WATCHER, SESSION-HANDOFF.

---

## Commands and exit codes

| Command | Exit | Notes |
|---------|-----:|-------|
| `BENCH_RUNTIME_COMPOSE_N=20000 BENCH_RUNTIME_RUNS=1 BENCH_RUNTIME_STAGE_TIMERS=0 just bench-runtime-freestanding-compose` | 0 | `compose_mode=cold` |
| Same + `just bench-runtime-freestanding-compose-micro` | 0 | `compose_mode=micro`; faster ns/op at short N |
| `just bench-runtime-regress` | 0 | 6 arms ok vs tip baseline |
| Synthetic 2x R-free median then `just bench-runtime-regress` | 1 | `status=regress` (metrics restored after) |
| `BENCH_RUNTIME_PERF_N=500000 just bench-runtime-perf-mint` | 0 | `status=skip_no_perf` (no perf on PATH this host) |
| `BENCH_RUNTIME_PERF_N=50000 just bench-runtime-perf-compose` | 0 | same soft-skip |
| `just hygiene` | 0 | source-hygiene + professional-tone OK |

Line counts (sub-1-KLOC): `bench-runtime.just` ~925; `bench-runtime-report.just` ~839;
compose smoke ~595.

---

## Paths touched

| Path | Change |
|------|--------|
| `src/systems/smoke/slake_runtime_bench_freestanding_compose.c` | T9 cold + micro loops |
| `just/bench-runtime.just` | T6 regress; T7 perf mint/compose; T9 micro recipe |
| `just/bench-runtime-report.just` | Methods/How-to; optional REGRESS=1 hook |
| `just/README.md` | module role rows |
| `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md` | T6/T7/T9 research |
| `doc/bench-history/README.md` | map recipes |
| `RESIDUAL-systems.md` | T6 T7 T9 **done**; Done archive; living tip |
| `RESIDUAL.md` | join Open Names + tip |
| `WATCHER.md` | next Wave 3 Lean L5 |
| `doc/SESSION-HANDOFF.md` | Active open Wave 3 tools done |
| `.agents/reports/impl-wave3-tools-t6t7t9-5aac7784-2026-08-12.md` | this report |

---

## Pins (unchanged)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / harness | 206 / 99 |

Measurement only. Speed is empirical; not PROVABLY.
