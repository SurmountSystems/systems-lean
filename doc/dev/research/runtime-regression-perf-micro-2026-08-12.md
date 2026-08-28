# Runtime regression, host perf attach, compose micro (2026-08-12)

Kind: analysis only. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / fullBackend claim flips. ASCII only.

**Related:** living suite `doc/BENCH-RUNTIME-latest.md` (`just bench-runtime`);
baseline tip `doc/BENCH-RUNTIME-baseline.tsv` (T5 snapshot);
methods `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md`.
**Track:** residual Names **T6**, **T7**, **T9** (Wave 3 tools).

---

## T6 Runtime regression vs previous

**Goal:** optional fail-or-warn when freestanding (or any) arm median ns/op
regresses vs the tip baseline from T5.

### Policy (defaults)

| Item | Default | Notes |
|------|---------|-------|
| Recipe | `just bench-runtime-regress` | Standalone after a suite write |
| Living metrics | `doc/BENCH-RUNTIME-metrics.tsv` | Current medians |
| Baseline | `doc/BENCH-RUNTIME-baseline.tsv` | Override: `BENCH_RUNTIME_REGRESS_BASELINE` |
| Threshold | `BENCH_RUNTIME_REGRESS_PCT=10` | Fail if current > baseline * (1 + pct/100) |
| Mode | `BENCH_RUNTIME_REGRESS_MODE=fail` | Or `warn` (print regress, exit 0) |
| Suite opt-in | `BENCH_RUNTIME_REGRESS=1 just bench-runtime` | Default suite **does not** run regress |
| CI | **Not** in default `just check` | Measurement only |

**Soft-skip (exit 0):** missing metrics, missing baseline, or no overlapping ok arms.

**What is compared:** every arm with `exit=ok` and positive `ns_median` in both
TSV files. Different N is allowed (ns/op still compared); a note prints.

### How to run

```bash
# Refresh living metrics, then snapshot tip baseline (operator cadence)
just bench-runtime
just bench-runtime-snapshot

# After a later suite, compare current metrics to tip baseline
just bench-runtime-regress

# Looser threshold + warn only
BENCH_RUNTIME_REGRESS_PCT=15 BENCH_RUNTIME_REGRESS_MODE=warn \
  just bench-runtime-regress

# Opt-in: suite invokes regress after writing metrics (can fail suite)
BENCH_RUNTIME_REGRESS=1 just bench-runtime
```

**Honesty:** speed is empirical; not PROVABLY. Regression is a measurement
guard, not a claim flip.

---

## T7 Host perf attach

**Goal:** one-command host `perf` attach for freestanding mint or compose.
No always-on product wire.

### Recipes

| Recipe | Binary | Default N |
|--------|--------|-----------|
| `just bench-runtime-perf-mint` | freestanding mint/consume | `BENCH_RUNTIME_PERF_N` default 2000000 |
| `just bench-runtime-perf-compose` | freestanding compose | default 500000 |

Runs `perf stat -d` on a freshly linked binary. Soft-skip `status=skip_no_perf`
if `perf` is missing. Optional:

```bash
BENCH_RUNTIME_PERF_RECORD=1 just bench-runtime-perf-compose
# writes /tmp/slake-rt-perf-compose-*.data ; then: perf report -i <path>
```

Compose recipe respects `BENCH_RUNTIME_COMPOSE_MICRO=1` for hot-path attach.
Default stage timers off under perf unless caller sets them.

If `perf` fails with permissions, lower `perf_event_paranoid` on the host (operator).

---

## T9 Compose microbench mode

**Goal:** hotter compose loop that reuses the compose shell (no full cold re-init
every op) for hot-path measurement.

| Mode | How | What it measures |
|------|-----|------------------|
| **Cold (default)** | Full `slake_host_compose_init` + push + edges + mint + mark + check + extract + consume each op | Primary **product-shape** arm in default suite |
| **Micro** | Setup graph + mark once; hot loop remint + check + extract + consume | Hot path only; measurement arm |

### How to run

```bash
# Explicit micro recipe
just bench-runtime-freestanding-compose-micro

# Env on the cold recipe path
BENCH_RUNTIME_COMPOSE_MICRO=1 just bench-runtime-freestanding-compose

# Short N smoke
BENCH_RUNTIME_COMPOSE_N=50000 BENCH_RUNTIME_RUNS=1 \
  BENCH_RUNTIME_STAGE_TIMERS=0 just bench-runtime-freestanding-compose-micro
```

Driver prints `compose_mode=cold` or `compose_mode=micro` and honesty line for
micro. Stage timers (T1) still work; setup stages amortize once under micro.

**Do not** merge cold vs micro ns/op without labels. Default suite freestanding
compose arm stays **cold**. Product wire semantics unchanged (no emit SSOT edit).

---

## Paths

| Path | Role |
|------|------|
| `just/bench-runtime.just` | T6 regress, T7 perf, T9 micro recipes |
| `just/bench-runtime-report.just` | Suite Methods + optional REGRESS=1 hook |
| `src/systems/smoke/slake_runtime_bench_freestanding_compose.c` | Cold + micro loops |
| `doc/BENCH-RUNTIME-baseline.tsv` | Tip baseline (T5) |
| `doc/bench-history/README.md` | History map |

Not gated by default `just check`. Measurement only.
