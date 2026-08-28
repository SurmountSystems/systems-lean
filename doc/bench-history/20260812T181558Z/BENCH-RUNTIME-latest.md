# Runtime freestanding bench -- operator question

Generated: **2026-08-12 18:14:45 UTC**

Kind: **runtime** wall-clock + structural link honesty. Not a residual claim flip.
Not the compile-path suite (`just bench` / `doc/BENCH-latest.md`).

## Question

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## How much faster (this run)

Plain American English from **median ns/op** this run. **Freestanding product path** is our approach (linear ownership; no GC library; no Lean managed runtime on the consumer link). Lower ns/op is faster. Multipliers use "Nx faster" / "Nx slower" (not bare ratios alone).

### Mint/consume class

- Freestanding is **~30.1x faster** than Boehm GC (free **0.6164** ns/op vs Boehm **18.5725** ns/op; exit **ok**).
- Freestanding is **~10.4x faster** than Lean managed runtime (free **0.6164** ns/op vs lean **6.4041** ns/op; free N=**200000000**, lean N=**50000000**; exit **ok**). Labeled contrast only; not the same C IR.
- Freestanding is **~1.0x faster** than heap_churn (malloc/free) on this mint microbench (free **0.6164** ns/op vs heap **0.6171** ns/op). Honest: freestanding often loses pure mint churn to libc malloc/free.

### Compose class

- Freestanding compose is **~2.2x slower** than compose heap_churn (free-compose **25.4574** ns/op vs gcomp **11.5406** ns/op). Do **not** merge compose ns/op with mint ns/op.

### Headline

| Baseline | Freestanding vs baseline | median ns/op free | median ns/op baseline |
|----------|--------------------------|------------------:|----------------------:|
| Boehm GC | **~30.1x faster** | 0.6164 | 18.5725 |
| Lean managed runtime | **~10.4x faster** | 0.6164 | 6.4041 |
| heap_churn (malloc) | **~1.0x faster** | 0.6164 | 0.6171 |
| compose heap_churn | **~2.2x slower** | 25.4574 | 11.5406 |

## Short answer (structure)

- **No GC / no Lean runtime** on freestanding consumer paths: R-free and R-free-compose link product wire C + small smoke only. Structural freestanding-first `-c`; `ldd`/`nm` without leanshared/libgc when tools exist.
- **PROVABLY is not speed:** CompCert product seal (`just product-compcert-matrix`) is wire correctness, not "fastest C on Earth."
- Full number tables below. Speed is empirical per job class, N, and machine. Raw ratios (baseline/free): mint heap **1.001**, Boehm **30.131**, lean **10.390**, compose heap **0.453**.

## Verdict (one sentence)

Freestanding is **~30.1x faster** than Boehm and **~10.4x faster** than Lean managed on mint-class this run, with **no GC and no Lean RT** on the freestanding link; vs heap_churn freestanding is **~1.0x faster** (mint) and **~2.2x slower** (compose). PROVABLY seals correctness only.

## Numbers -- mint/consume v1

Job class: acquire/release-once token protocol. N default **200000000** (override `BENCH_RUNTIME_N`). Measured runs per arm **3** after one outer discard + in-driver warmup. Spread columns: **min/max/stdev** of ns/op across measured runs (first sample dropped when multi-run; sample stdev when runs>=2 after drop).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free (linear freestanding) | ok | 0.6164 | 0.6167 | 0.6148 | 0.6189 | 0.0021 | 0.123278 | 1621536611.36 | 1.287 |
| R-gc-shape (malloc/free heap_churn) | ok | 0.6171 | 0.6190 | 0.6158 | 0.6240 | 0.0044 | 0.123417 | 1615683901.17 | 1.067 |
| R-boehm (GC_MALLOC/GC_FREE) | ok | 18.5725 | 18.4899 | 18.1201 | 18.7771 | 0.3362 | 3.714499 | 54095566.23 | 30.052 |

| Comparison (mint/consume only) | Value |
|--------------------------------|-------|
| Ratio heap_churn / freestanding ns/op | **1.001** |
| Ratio boehm_gc / freestanding ns/op | **30.131** |
| N (ops per timed process) | free=200000000 / gc-shape=200000000 / boehm=200000000 |

## Numbers -- Lean managed runtime contrast

Job class: mint_consume-class **logical** protocol under classic Lean managed runtime (allocate small structure, discard; GC path). **Not** the same C IR as freestanding. N default **50000000** (override `BENCH_RUNTIME_LEAN_N`). Timed step is **process run** after untimed warm `lake build` (not cold full-package elaborate).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-lean (Lean managed runtime) | ok | 6.4041 | 8.6990 | 6.4005 | 13.2923 | 3.9780 | 0.320204 | 129206533.41 | 3.501 |

| Comparison (mint-class labeled) | Value |
|----------------------------------|-------|
| Ratio lean_managed / freestanding ns/op | **10.390** |
| N freestanding mint | 200000000 |
| N Lean managed | 50000000 |
| Note | Do **not** merge ns/op across different N without labels; not freestanding C |

## Numbers -- compose-class

Job class: build small IR/host-compose graph each op (push nodes, edges, mint, mark, check, extract, consume) vs malloc node-list + free. N default **10000000** (override `BENCH_RUNTIME_COMPOSE_N`). **Different job from mint/consume; do not merge ns/op.**

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free-compose (host_compose freestanding) | ok | 25.4574 | 25.4832 | 25.4240 | 25.5683 | 0.0755 | 0.254574 | 39241752.23 | 2.662 |
| R-gc-shape-compose (malloc node list) | ok | 11.5406 | 12.2705 | 10.5683 | 14.7026 | 2.1616 | 0.115406 | 83096194.88 | 1.105 |

| Comparison (compose only) | Value |
|---------------------------|-------|
| Ratio heap_churn_compose / freestanding_compose ns/op | **0.453** |
| N (ops per timed process) | free-compose=10000000 / gc-compose=10000000 |

### Compose stage timers (R-free-compose attribution)

Smoke-side only (separate pass after primary whole-op timing). Product wire has **no** always-on timers. Default ON; set `BENCH_RUNTIME_STAGE_TIMERS=0` to skip. Cap stage N with `BENCH_RUNTIME_STAGE_N` (default min(compose N, 200000)). Stage keys: init, push_nodes, edges, mint, mark, well_typed, check_fail_closed, extract, consume, post_check.

| Stage / group | ns/op (stage pass) |
|---------------|-------------------:|
| stage_N | 200000 |
| init | 22.0314 |
| push_nodes | 25.3951 |
| edges | 24.1203 |
| mint | 23.7032 |
| mark | 23.4913 |
| well_typed | 25.1487 |
| check_fail_closed | 0.0000 |
| extract | 28.7999 |
| consume | 23.6888 |
| post_check | 25.9975 |
| group setup (init+push+edges) | 71.5467 |
| group mint_mark | 47.1946 |
| group check (well_typed+fail_closed+post) | 51.1462 |
| group extract_consume | 52.4887 |

stage_timers flag from last measured process: **on**. Stage ns includes `clock_gettime` overhead; use for relative attribution, not absolute product claim.

## Structural evidence (R-free mint + compose)

| Check | R-free (mint) | R-free-compose |
|-------|---------------|----------------|
| Freestanding-first wire `-c` | structural freestanding-first compile: ffreestanding-nostdlib | structural freestanding-first compile: ffreestanding-nostdlib |
| Link line | link line: cc -std=c11 -O3 -flto -Isrc/systems/emit -o /tmp/slake-rt-free-1680994/r-free src/systems/smoke/slake_runtime_bench_freestanding.c src/systems/emit/slake_freestanding.c | link line: cc -std=c11 -O3 -flto -Isrc/systems/emit -o /tmp/slake-rt-free-compose-1682770/r-free-compose src/systems/smoke/slake_runtime_bench_freestanding_compose.c src/systems/emit/slake_freestanding.c |
| Binary size note | structural binary bytes: 8496 | structural binary bytes: 19984 |
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
# timing-link flags (default -O3 -flto E4+LTO): BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-freestanding
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
| CFLAGS | `-std=c11` + `BENCH_RUNTIME_CFLAGS` (default `-O3 -flto` E4+LTO; hosted timing link only; freestanding-first `-c` separate fixed) |

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

**Flag matrix (T3) / E4+LTO policy:** `just bench-runtime-flag-matrix` or `BENCH_RUNTIME_CFLAGS` on arms. Compares timing-link `-O2` vs `-O3` vs `-O3 -flto`. Structural freestanding-first `-c` unchanged. **Default suite timing link is `-O3 -flto` (E4 + Runtime LTO timing default)** after production-N fair mint freestanding median <= heap_churn. Override `BENCH_RUNTIME_CFLAGS="-O3"` if LTO link fails. Research: `doc/dev/research/runtime-flag-matrix-2026-08-12.md`.

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
| Full transcript | `/tmp/systems-lean-bench-runtime-20260812T181445Z.log` |
| Research note | `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` |
| Flag matrix research | `doc/dev/research/runtime-flag-matrix-2026-08-12.md` |
| T6/T7/T9 research | `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md` |
| Recipes | `just/bench-runtime.just` (arms + flag matrix + regress + perf + micro) + `just/bench-runtime-report.just` (suite/report/snapshot) |
| Drivers | `src/systems/smoke/slake_runtime_bench_*.c` |
| Lean measurement | `SystemsLean.RuntimeBenchLean` / `slake-runtime-bench-lean` |
| Secondary compile report | `doc/BENCH-latest.md` |

## Overall exit

**ok** (measured arms exit 0; Boehm/Lean may soft-skip)

