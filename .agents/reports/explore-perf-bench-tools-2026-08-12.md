# Explore: perf bench tooling for rigorous runtime optimization (2026-08-12)

Kind: analysis only. Not residual invent. Not free / complete / PROVABLY /
FullHost / DominanceClaimed / fullBackend claim flips. ASCII only.

**Related:** product-wire levers in
`.agents/reports/explore-runtime-perf-levers-2026-08-12.md` (hot APIs / SSOT).
This report is the **measurement harness** side only.

---

## Existing tools

### Primary: runtime freestanding suite

| Surface | Path / command | Role |
|---------|----------------|------|
| Arm recipes | `/home/hunter/Projects/ai/iso/just/bench-runtime.just` | Per-arm build/link/run |
| Suite + living report | `/home/hunter/Projects/ai/iso/just/bench-runtime-report.just` | `just bench-runtime` |
| Living report | `/home/hunter/Projects/ai/iso/doc/BENCH-RUNTIME-latest.md` | Overwrites on each full suite; leads with **How much faster** |
| Full log | `/tmp/systems-lean-bench-runtime-*.log` | Capture; not a durable history store |
| Research | `/home/hunter/Projects/ai/iso/doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` | Methods / honesty |

**Arms (smoke C under `src/systems/smoke/`):**

| Recipe | Driver | Baseline / job |
|--------|--------|----------------|
| `bench-runtime-freestanding` | `slake_runtime_bench_freestanding.c` | R-free mint/consume on product wire |
| `bench-runtime-gcshape` | `slake_runtime_bench_gcshape.c` | heap_churn malloc/free (same logical protocol) |
| `bench-runtime-freestanding-compose` | `slake_runtime_bench_freestanding_compose.c` | R-free-compose host_compose full path |
| `bench-runtime-gcshape-compose` | `slake_runtime_bench_gcshape_compose.c` | compose heap_churn |
| `bench-runtime-boehm` | `slake_runtime_bench_boehm.c` | real Boehm; soft-skip `skip_no_boehm` |
| `bench-runtime-lean` | Lean `SystemsLean.RuntimeBenchLean` / `slake-runtime-bench-lean` | managed RT contrast; soft-skip lake/build |

**Defaults:** `BENCH_RUNTIME_N=2e8`, `BENCH_RUNTIME_COMPOSE_N=1e7`,
`BENCH_RUNTIME_LEAN_N=5e7`, `BENCH_RUNTIME_RUNS=3`. Timing link `-std=c11 -O2`.
Freestanding-first `-c -ffreestanding -nostdlib` is **structural** only.

**Structural honesty (already solid):** freestanding-first compile mode; `size` /
`ldd` / `nm` checks (no leanshared/libgc on R-free); Boehm expects libgc; Lean
expects RT present or embedded.

**Driver metrics:** `clock_gettime(CLOCK_MONOTONIC)` whole-process timed loop;
prints `N=`, `wall_seconds=`, `ns_per_op=`, `ops_per_s=`. In-driver warmup
(untimed full N) plus outer just discard run. Untimed contract checks
(mint/double-consume or compose fail-closed).

**Report scrape stats (`scrape_arm` in bench-runtime-report.just):**

- Collects all `ns_per_op=` lines from arm stdout.
- If 2+ samples, **drops the first** sample (aligns with outer discard noise).
- Reports **median** and **mean** ns/op, **median** wall, **mean** ops/s.
- Outer just TIMEFORMAT real/user/sys per arm.
- Headline ratios from **median ns/op** (Nx faster/slower).

**Not present in stats:** p95/p99, min/max, stdev/variance, IQR/outlier trim
beyond first-sample drop, confidence intervals, multi-machine aggregation.

**Stage timers:** **none.** Compose is one timed op bundle (init, push nodes,
edges, mint, mark, well_typed, check_fail_closed, extract, consume, post-check).
No per-API or stage breakdown.

### Secondary: compile-path suite

| Surface | Path / command | Role |
|---------|----------------|------|
| Recipes | `/home/hunter/Projects/ai/iso/just/bench.just` | Wall-clock product path vs Lake |
| Living report | `/home/hunter/Projects/ai/iso/doc/BENCH-latest.md` | Two-arm framing |
| Research | `/home/hunter/Projects/ai/iso/doc/dev/research/hot-cold-benchmarks-2026-08-08.md` | Hot/cold honesty |

Scenarios: hot freestanding, without-Lake host, lake first+second pass (true
hot), CompCert matrix, cold freestanding. Optional `bench-lake-host-cold` not
in default suite. **Does not answer** linear / no-GC / fastest **runtime** C.
AGENTS policy: runtime is primary for the linear story; compile-path secondary.

### Policy / docs hooks already in place

- AGENTS **Benchmarks and user-facing docs**: real speed win must update
  `BENCH-RUNTIME-latest.md`, README tip, SESSION-HANDOFF (same slice).
- Residual Done: runtime suite landed (v1 + compose + Boehm + Lean).
- Soft-skip paths keep CI-ish environments from hard-failing without cc/libgc/lake.
- **No** `.github` workflow references to `bench-runtime` or `bench` (not gated).

---

## Gaps (for rigorous perf optimization)

| Gap | Today | Why it matters for opt |
|-----|-------|------------------------|
| **Compose / mint stage timers** | Whole-op only | Cannot attribute cost to check_fail_closed vs extract vs init without guesswork (levers report already names check/extract as likely centers) |
| **Statistical rigor** | median + mean; 3 runs; first sample drop only | No spread, no outlier policy, easy noise on small N or busy hosts |
| **Flag matrix** | Fixed `-O2` hosted link | No O0/O2/O3/-Os, LTO, march, freestanding-link vs hosted-link matrix for fair/opt contrasts |
| **perf / flame hooks** | None | No `perf record` / flamegraph recipe or documented one-liner for host Linux opt work |
| **Golden / baseline store** | Single living latest overwrite | Cannot diff this machine vs last good run without manual log dig |
| **Regression detect** | Manual read of report | No fail-on-threshold vs previous medians (or checked-in golden) |
| **CI optional long bench** | Not in workflows | No `workflow_dispatch` / nightly long run; full suite is operator-local |
| **History archive** | `/tmp` logs only | No `doc/bench-history/` or stamped copies beside latest |
| **JSON/machine scrape** | Markdown + awk scrape of printf lines | Fragile if drivers grow; no stable machine-readable arm result file |
| **Per-function product timers** | Not in wire (and should stay optional) | Product wire must not grow always-on timing; smoke-side or `#ifdef` only |

**Compile-path relationship (secondary):** keep separate question, separate
report. Growing runtime rigor should not merge ns/op with `just bench` real
seconds or sell Lake hot/cold as freestanding product speed.

**Language policy for new tools:** thin just recipes OK; algorithms prefer
Lean host tools or pure Nix gates; **no** new project Python; no long bash
mills in just. Smoke C may grow measurement contracts only (not product body).
Product speed changes go through Lean SSOT / emit templates, not hand-edited
emit C.

---

## Top 8 tooling residual Names (S/M)

Suggested Open Names for harness growth only (not product claim flips).
Size: **S** small / **M** medium.

1. **Compose stage timers** (S)
   - **Done when:** freestanding compose driver prints labeled stage ns sums
     (or per-stage ns/op) for init/push/mint/check/extract/consume; report
     scrapes a stage table; mint driver unchanged or optional.

2. **Runtime run spread stats** (S)
   - **Done when:** suite report includes min/max and at least one spread
     metric (stdev or p95 from runs) for ns/op per arm when RUNS>=3; living
     report documents the formula.

3. **Runtime flag matrix recipe** (M)
   - **Done when:** thin `just bench-runtime-flags` (or env-driven matrix)
     runs R-free mint (+ optional compose) under a fixed small set of CFLAGS
     (`-O0`/`-O2`/`-O3` minimum); writes a matrix section or side report;
     default `bench-runtime` stays single-flag for day-to-day.

4. **Host perf attach recipe** (S)
   - **Done when:** documented thin recipe (e.g. `just bench-runtime-perf-free`)
     runs freestanding mint binary under `perf record` when `perf` exists,
     soft-skips otherwise; prints output path; no always-on product wire hooks.

5. **Living baseline snapshot store** (S)
   - **Done when:** each full `bench-runtime` also writes a stamped snapshot
     under a durable path (e.g. `doc/bench-runtime-history/YYYYMMDDT...md` or
     a single `doc/BENCH-RUNTIME-previous.md` copy-before-overwrite); latest
     remains the living tip.

6. **Runtime regression vs previous** (M)
   - **Done when:** optional gate/recipe compares new medians to previous
     living or snapshot report for named arms; fails or warns on configurable
     relative threshold (e.g. freestanding mint +X%); soft-skip if no previous;
     does not flip product claim bools.

7. **Optional CI long runtime bench** (M)
   - **Done when:** workflow_dispatch or scheduled job runs a **short** or
     calibrated `bench-runtime` (or mint-only) with artifacts for the living
     report / log; default PR `just check` stays free of long benches; soft-skip
     rules preserved (no cc / no boehm).

8. **Machine-readable arm metrics** (S)
   - **Done when:** each arm (or suite) emits a stable key=value or JSONL
     block scrapeable without whole-stdout archaeology; report writer prefers
     that block; docs list the keys (`ns_per_op_median`, `N`, `arm`, ...).

**Out of scope for these Names:** inventing "fastest C" PROVABLY; FullHost /
Lake-gone; hand-growing product C; merging compile-path and runtime questions;
production always-on timers on the freestanding consumer wire.

---

## Quick bullets (parent join)

**Existing**

- Runtime suite: `just bench-runtime` + arms in `just/bench-runtime.just` /
  report in `just/bench-runtime-report.just` -> `doc/BENCH-RUNTIME-latest.md`
- Five C smoke drivers + Lean managed arm; structural no-GC / no-Lean-RT checks
- Stats: median + mean ns/op (first sample dropped when multi-run); default 3 runs
- Compile-path secondary: `just bench` -> `doc/BENCH-latest.md`
- Soft-skips: no cc / no Boehm / no lake; not in GitHub Actions today

**Gaps**

- No compose/mint **stage** timers
- No p95/stdev/outlier policy beyond first-run drop
- No CFLAGS flag matrix, perf/flame hooks, golden history, regression detect, CI long bench
- Living report overwrite only; `/tmp` logs not durable history

**Top residual Names (tooling)**

1. Compose stage timers (S)
2. Runtime run spread stats (S)
3. Runtime flag matrix recipe (M)
4. Host perf attach recipe (S)
5. Living baseline snapshot store (S)
6. Runtime regression vs previous (M)
7. Optional CI long runtime bench (M)
8. Machine-readable arm metrics (S)
