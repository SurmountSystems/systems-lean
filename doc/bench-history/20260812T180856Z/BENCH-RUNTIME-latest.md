# Runtime freestanding bench -- operator question

Generated: **2026-08-12 18:08:10 UTC**

Kind: **runtime** wall-clock + structural link honesty. Not a residual claim flip.
Not the compile-path suite (`just bench` / `doc/BENCH-latest.md`).

## Question

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## How much faster (this run)

Plain American English from **median ns/op** this run. **Freestanding product path** is our approach (linear ownership; no GC library; no Lean managed runtime on the consumer link). Lower ns/op is faster. Multipliers use "Nx faster" / "Nx slower" (not bare ratios alone).

### Mint/consume class

- Freestanding is **~9.7x faster** than Boehm GC (free **1.8358** ns/op vs Boehm **17.7772** ns/op; exit **ok**).
- Freestanding is **~3.4x faster** than Lean managed runtime (free **1.8358** ns/op vs lean **6.2448** ns/op; free N=**200000000**, lean N=**50000000**; exit **ok**). Labeled contrast only; not the same C IR.
- Freestanding is **~2.9x slower** than heap_churn (malloc/free) on this mint microbench (free **1.8358** ns/op vs heap **0.6346** ns/op). Honest: freestanding often loses pure mint churn to libc malloc/free.

### Compose class

- Freestanding compose is **~3.2x slower** than compose heap_churn (free-compose **32.7845** ns/op vs gcomp **10.1764** ns/op). Do **not** merge compose ns/op with mint ns/op.

### Headline

| Baseline | Freestanding vs baseline | median ns/op free | median ns/op baseline |
|----------|--------------------------|------------------:|----------------------:|
| Boehm GC | **~9.7x faster** | 1.8358 | 17.7772 |
| Lean managed runtime | **~3.4x faster** | 1.8358 | 6.2448 |
| heap_churn (malloc) | **~2.9x slower** | 1.8358 | 0.6346 |
| compose heap_churn | **~3.2x slower** | 32.7845 | 10.1764 |

## Short answer (structure)

- **No GC / no Lean runtime** on freestanding consumer paths: R-free and R-free-compose link product wire C + small smoke only. Structural freestanding-first `-c`; `ldd`/`nm` without leanshared/libgc when tools exist.
- **PROVABLY is not speed:** CompCert product seal (`just product-compcert-matrix`) is wire correctness, not "fastest C on Earth."
- Full number tables below. Speed is empirical per job class, N, and machine. Raw ratios (baseline/free): mint heap **0.346**, Boehm **9.684**, lean **3.402**, compose heap **0.310**.

## Verdict (one sentence)

Freestanding is **~9.7x faster** than Boehm and **~3.4x faster** than Lean managed on mint-class this run, with **no GC and no Lean RT** on the freestanding link; vs heap_churn freestanding is **~2.9x slower** (mint) and **~3.2x slower** (compose). PROVABLY seals correctness only.

## Numbers -- mint/consume v1

Job class: acquire/release-once token protocol. N default **200000000** (override `BENCH_RUNTIME_N`). Measured runs per arm **3** after one outer discard + in-driver warmup. Spread columns: **min/max/stdev** of ns/op across measured runs (first sample dropped when multi-run; sample stdev when runs>=2 after drop).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free (linear freestanding) | ok | 1.8358 | 1.8658 | 1.8222 | 1.9394 | 0.0641 | 0.367152 | 536384250.47 | 3.756 |
| R-gc-shape (malloc/free heap_churn) | ok | 0.6346 | 0.6360 | 0.6324 | 0.6409 | 0.0044 | 0.126918 | 1572430186.11 | 1.100 |
| R-boehm (GC_MALLOC/GC_FREE) | ok | 17.7772 | 17.9017 | 17.4261 | 18.5018 | 0.5486 | 3.555450 | 55895169.16 | 28.681 |

| Comparison (mint/consume only) | Value |
|--------------------------------|-------|
| Ratio heap_churn / freestanding ns/op | **0.346** |
| Ratio boehm_gc / freestanding ns/op | **9.684** |
| N (ops per timed process) | free=200000000 / gc-shape=200000000 / boehm=200000000 |

## Numbers -- Lean managed runtime contrast

Job class: mint_consume-class **logical** protocol under classic Lean managed runtime (allocate small structure, discard; GC path). **Not** the same C IR as freestanding. N default **50000000** (override `BENCH_RUNTIME_LEAN_N`). Timed step is **process run** after untimed warm `lake build` (not cold full-package elaborate).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-lean (Lean managed runtime) | ok | 6.2448 | 6.3225 | 6.2008 | 6.5219 | 0.1741 | 0.312241 | 158243419.50 | 3.077 |

| Comparison (mint-class labeled) | Value |
|----------------------------------|-------|
| Ratio lean_managed / freestanding ns/op | **3.402** |
| N freestanding mint | 200000000 |
| N Lean managed | 50000000 |
| Note | Do **not** merge ns/op across different N without labels; not freestanding C |

## Numbers -- compose-class

Job class: build small IR/host-compose graph each op (push nodes, edges, mint, mark, check, extract, consume) vs malloc node-list + free. N default **10000000** (override `BENCH_RUNTIME_COMPOSE_N`). **Different job from mint/consume; do not merge ns/op.**

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free-compose (host_compose freestanding) | ok | 32.7845 | 32.8244 | 32.5669 | 33.1217 | 0.2795 | 0.327845 | 30466646.68 | 3.413 |
| R-gc-shape-compose (malloc node list) | ok | 10.1764 | 10.1872 | 10.1359 | 10.2494 | 0.0575 | 0.101764 | 98164129.12 | 0.871 |

| Comparison (compose only) | Value |
|---------------------------|-------|
| Ratio heap_churn_compose / freestanding_compose ns/op | **0.310** |
| N (ops per timed process) | free-compose=10000000 / gc-compose=10000000 |

### Compose stage timers (R-free-compose attribution)

Smoke-side only (separate pass after primary whole-op timing). Product wire has **no** always-on timers. Default ON; set `BENCH_RUNTIME_STAGE_TIMERS=0` to skip. Cap stage N with `BENCH_RUNTIME_STAGE_N` (default min(compose N, 200000)). Stage keys: init, push_nodes, edges, mint, mark, well_typed, check_fail_closed, extract, consume, post_check.

| Stage / group | ns/op (stage pass) |
|---------------|-------------------:|
| stage_N | 200000 |
| init | 21.8356 |
| push_nodes | 26.4316 |
| edges | 24.5186 |
| mint | 23.5028 |
| mark | 23.5149 |
| well_typed | 24.9311 |
| check_fail_closed | 0.0000 |
| extract | 30.3033 |
| consume | 23.7004 |
| post_check | 25.6897 |
| group setup (init+push+edges) | 72.7857 |
| group mint_mark | 47.0176 |
| group check (well_typed+fail_closed+post) | 50.6207 |
| group extract_consume | 54.0036 |

stage_timers flag from last measured process: **on**. Stage ns includes `clock_gettime` overhead; use for relative attribution, not absolute product claim.

## Structural evidence (R-free mint + compose)

| Check | R-free (mint) | R-free-compose |
|-------|---------------|----------------|
| Freestanding-first wire `-c` | structural freestanding-first compile: ffreestanding-nostdlib | structural freestanding-first compile: ffreestanding-nostdlib |
| Link line | link line: cc -std=c11 -O3 -Isrc/systems/emit -o /tmp/slake-rt-free-1415414/r-free src/systems/smoke/slake_runtime_bench_freestanding.c src/systems/emit/slake_freestanding.c | link line: cc -std=c11 -O3 -Isrc/systems/emit -o /tmp/slake-rt-free-compose-1418067/r-free-compose src/systems/smoke/slake_runtime_bench_freestanding_compose.c src/systems/emit/slake_freestanding.c |
| Binary size note | structural binary bytes: 24386 | structural binary bytes: 31928 |
| No Lean runtime / no libgc | structural no leanshared/libgc in ldd: ok | structural no leanshared/libgc in ldd: ok |
| Linear / compose contract | in-driver untimed | in-driver untimed |

### Boehm structural contrast

| Check | Result |
|-------|--------|
| Boehm arm exit | ok |
| libgc in Boehm binary ldd | structural libgc present in ldd: ok (Boehm contrast) |
| R-free still no libgc | structural no leanshared/libgc in ldd: ok |
| Baseline name | `boehm_gc` (not heap_churn) |

### Lean managed runtime structural contrast

| Check | Result |
|-------|--------|
| Lean arm exit | ok |
| Lean RT evidence (ldd shared or embedded lean_*) | structural lean_rt=present |
| R-lean binary size note | structural binary bytes: 15281224 |
| R-free still no leanshared/libgc | structural no leanshared/libgc in ldd: ok |
| Baseline name | `lean_managed_runtime` (not freestanding C IR) |

### Product wire sizes

| Bytes | Path |
|------:|------|
| 32584 | `src/systems/emit/slake_freestanding.c` |
| 31969 | `src/systems/emit/slake_freestanding.h` |
| 32584 | `out/freestanding-c/slake_freestanding.c` |
| 31969 | `out/freestanding-c/slake_freestanding.h` |

## How to re-run

```bash
just bench-runtime
# arms: just bench-runtime-freestanding | just bench-runtime-gcshape
#        just bench-runtime-freestanding-compose | just bench-runtime-gcshape-compose
#        just bench-runtime-boehm | just bench-runtime-lean
# calibrate mint: BENCH_RUNTIME_N=10000000 BENCH_RUNTIME_RUNS=5 just bench-runtime
# calibrate compose: BENCH_RUNTIME_COMPOSE_N=5000000 just bench-runtime
# calibrate lean: BENCH_RUNTIME_LEAN_N=5000000 just bench-runtime
# stage timers off: BENCH_RUNTIME_STAGE_TIMERS=0 just bench-runtime-freestanding-compose
# stage N cap: BENCH_RUNTIME_STAGE_N=50000 just bench-runtime-freestanding-compose
# timing-link flags (default -O3 E4): BENCH_RUNTIME_CFLAGS="-O2" just bench-runtime-freestanding
# flag matrix (T3): just bench-runtime-flag-matrix
# snapshot history (T5): just bench-runtime-snapshot
# regression vs tip baseline (T6 opt-in; default suite never fails CI):
#   just bench-runtime-regress
#   BENCH_RUNTIME_REGRESS=1 just bench-runtime
#   BENCH_RUNTIME_REGRESS_PCT=10 BENCH_RUNTIME_REGRESS_MODE=warn just bench-runtime-regress
# host perf attach (T7; soft-skip no perf): just bench-runtime-perf-mint | bench-runtime-perf-compose
# compose micro hot path (T9; cold remains primary): just bench-runtime-freestanding-compose-micro
#   BENCH_RUNTIME_COMPOSE_MICRO=1 just bench-runtime-freestanding-compose
```

## Machine

| Item | Value |
|------|-------|
| Hostname | horizon |
| uname -srm | Linux 7.1.8-zen1-3-zen x86_64 |
| nproc | 16 |
| cc --version | cc (GCC) 16.2.1 20260810 |
| CFLAGS | `-std=c11` + `BENCH_RUNTIME_CFLAGS` (default `-O3` E4; hosted timing link only; freestanding-first `-c` separate fixed) |

## Methods (short)

| Arm | Job class | Workload | Link |
|-----|-----------|----------|------|
| R-free | mint_consume | `slake_consume_token_mint` then `slake_consume_token_consume` | emit + smoke |
| R-gc-shape | mint_consume | malloc payload then free (heap_churn) | driver only |
| R-boehm | mint_consume | `GC_MALLOC` then `GC_FREE` (boehm_gc) | driver + `-lgc` |
| R-lean | mint_consume | Lean mint ByteArray discard (lean_managed_runtime) | lake exe; Lean RT shared or embedded |
| R-free-compose | compose | host_compose init/push/edge/mint/mark/check/extract/consume | emit + smoke |
| R-gc-shape-compose | compose | malloc node list + edges + token; free all each op | driver only |

Baselines are named honestly: **heap_churn**, **boehm_gc**, **lean_managed_runtime**. Lean is not freestanding C IR.

**Spread formula (T2):** for each arm, collect `ns_per_op=` lines; if 2+ samples drop the first (outer discard noise); report min, max, median, mean, and sample standard deviation (sqrt of sum((x-mean)^2)/(n-1) when n>=2 after drop). Default `BENCH_RUNTIME_RUNS=3`; raise for tighter stdev.

**Stage timers (T1):** freestanding compose driver only; separate stage pass after primary whole-op loop; keys `stage_ns_per_op_*` and group rollups; product wire never always-on.

**Machine-readable metrics (T4):** suite also writes `doc/BENCH-RUNTIME-metrics.tsv` (tab-separated; one row per arm; soft-skips as exit status). Human markdown remains primary.

**Flag matrix (T3) / E4 policy:** `just bench-runtime-flag-matrix` or `BENCH_RUNTIME_CFLAGS` on arms. Compares timing-link `-O2` vs `-O3` (+ optional LTO). Structural freestanding-first `-c` unchanged. **Default suite timing link is `-O3` (E4)** after T3 evidence; optional `-O3 -flto` is a measured ceiling, not the default. Research: `doc/dev/research/runtime-flag-matrix-2026-08-12.md`.

**Baseline snapshot (T5):** living latest and metrics still **overwrite** on each suite. Durable stamped copies: `just bench-runtime-snapshot` -> `doc/bench-history/<stamp>/` plus tip `doc/BENCH-RUNTIME-baseline.tsv`. Refresh: re-run suite then snapshot.

**Structural no-GC gate (T8):** freestanding arms print `structural_gate=pass` (or `fail_ldd`/`fail_nm` with matched lines). Soft-skip ldd/nm when tools missing. Not part of default `just check`.

**Runtime regression (T6):** compare living `doc/BENCH-RUNTIME-metrics.tsv` median ns/op to tip `doc/BENCH-RUNTIME-baseline.tsv` (or `BENCH_RUNTIME_REGRESS_BASELINE`). Recipe `just bench-runtime-regress`. Defaults: `BENCH_RUNTIME_REGRESS_PCT=10` (fail if current > baseline by more than 10%); `BENCH_RUNTIME_REGRESS_MODE=fail` or `warn`. Soft-skip if baseline missing. **Default `just bench-runtime` does not run this and never hard-fails CI on regression**; set `BENCH_RUNTIME_REGRESS=1` to opt in after the suite writes metrics. Not in `just check`.

**Host perf attach (T7):** `just bench-runtime-perf-mint` / `just bench-runtime-perf-compose` run `perf stat` on freestanding binaries; optional `BENCH_RUNTIME_PERF_RECORD=1` for `perf record -g`. Soft-skip `skip_no_perf`. No always-on product wire.

**Compose micro (T9):** `BENCH_RUNTIME_COMPOSE_MICRO=1` or `just bench-runtime-freestanding-compose-micro` reuses the compose shell (setup once; remint/check/extract/consume hot loop). **Cold full re-init each op remains the primary product-shape arm** in the default suite. Micro is hot-path measurement only; do not merge cold vs micro ns/op without labels. Research: `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md`.

## Limits

- Not "fastest C on Earth" or all programs. Workloads are mint/consume, compose-class, and Lean managed mint-class only.
- Lean arm is **not** the same C IR as freestanding; it answers cost of a similar logical protocol under Lean managed runtime.
- Lean arm times process **run** after untimed warm lake build -- not cold full-package elaborate (that is compile-path secondary).
- Speed is empirical on this machine; re-run for your host. Document N per arm; never merge unlabeled N.
- **PROVABLY** (CompCert seal) is **correctness**, not a speed proof.
- free / complete / FullHost / full parity are **not** flipped by this bench.
- Never merge ns/op across mint/consume vs compose without labels.

## Secondary suite (different question)

Compile-path wall-clock (emit vs Lake elaborate) lives under `just bench` and `doc/BENCH-latest.md`. That suite **does not answer** the linear / no-GC / fastest **runtime** question.

## Paths

| What | Path |
|------|------|
| This report | `doc/BENCH-RUNTIME-latest.md` |
| Machine-readable metrics (TSV) | `doc/BENCH-RUNTIME-metrics.tsv` |
| Baseline tip (T5 snapshot) | `doc/BENCH-RUNTIME-baseline.tsv` |
| Stamped history | `doc/bench-history/` |
| Flag matrix TSV | `doc/bench-history/flag-matrix-latest.tsv` |
| Full transcript | `/tmp/systems-lean-bench-runtime-20260812T180810Z.log` |
| Research note | `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` |
| Flag matrix research | `doc/dev/research/runtime-flag-matrix-2026-08-12.md` |
| T6/T7/T9 research | `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md` |
| Recipes | `just/bench-runtime.just` (arms + flag matrix + regress + perf + micro) + `just/bench-runtime-report.just` (suite/report/snapshot) |
| Drivers | `src/systems/smoke/slake_runtime_bench_*.c` |
| Lean measurement | `SystemsLean.RuntimeBenchLean` / `slake-runtime-bench-lean` |
| Secondary compile report | `doc/BENCH-latest.md` |

## Overall exit

**ok** (measured arms exit 0; Boehm/Lean may soft-skip)

