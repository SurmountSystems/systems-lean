# Runtime freestanding bench -- operator question

Generated: **2026-08-12 17:39:34 UTC**

Kind: **runtime** wall-clock + structural link honesty. Not a residual claim flip.
Not the compile-path suite (`just bench` / `doc/BENCH-latest.md`).

## Question

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## How much faster (this run)

Plain American English from **median ns/op** this run. **Freestanding product path** is our approach (linear ownership; no GC library; no Lean managed runtime on the consumer link). Lower ns/op is faster. Multipliers use "Nx faster" / "Nx slower" (not bare ratios alone).

### Mint/consume class

- Freestanding is **~9.5x faster** than Boehm GC (free **1.8891** ns/op vs Boehm **17.9711** ns/op; exit **ok**).
- Freestanding is **~3.5x faster** than Lean managed runtime (free **1.8891** ns/op vs lean **6.6897** ns/op; free N=**200000000**, lean N=**50000000**; exit **ok**). Labeled contrast only; not the same C IR.
- Freestanding is **~3.1x slower** than heap_churn (malloc/free) on this mint microbench (free **1.8891** ns/op vs heap **0.6134** ns/op). Honest: freestanding often loses pure mint churn to libc malloc/free.

### Compose class

- Freestanding compose is **~3.9x slower** than compose heap_churn (free-compose **39.7589** ns/op vs gcomp **10.0805** ns/op). Do **not** merge compose ns/op with mint ns/op.

### Headline

| Baseline | Freestanding vs baseline | median ns/op free | median ns/op baseline |
|----------|--------------------------|------------------:|----------------------:|
| Boehm GC | **~9.5x faster** | 1.8891 | 17.9711 |
| Lean managed runtime | **~3.5x faster** | 1.8891 | 6.6897 |
| heap_churn (malloc) | **~3.1x slower** | 1.8891 | 0.6134 |
| compose heap_churn | **~3.9x slower** | 39.7589 | 10.0805 |

## Short answer (structure)

- **No GC / no Lean runtime** on freestanding consumer paths: R-free and R-free-compose link product wire C + small smoke only. Structural freestanding-first `-c`; `ldd`/`nm` without leanshared/libgc when tools exist.
- **PROVABLY is not speed:** CompCert product seal (`just product-compcert-matrix`) is wire correctness, not "fastest C on Earth."
- Full number tables below. Speed is empirical per job class, N, and machine. Raw ratios (baseline/free): mint heap **0.325**, Boehm **9.513**, lean **3.541**, compose heap **0.254**.

## Verdict (one sentence)

Freestanding is **~9.5x faster** than Boehm and **~3.5x faster** than Lean managed on mint-class this run, with **no GC and no Lean RT** on the freestanding link; vs heap_churn freestanding is **~3.1x slower** (mint) and **~3.9x slower** (compose). PROVABLY seals correctness only.

## Numbers -- mint/consume v1

Job class: acquire/release-once token protocol. N default **200000000** (override `BENCH_RUNTIME_N`). Measured runs per arm **3** after one outer discard + in-driver warmup. Spread columns: **min/max/stdev** of ns/op across measured runs (first sample dropped when multi-run; sample stdev when runs>=2 after drop).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free (linear freestanding) | ok | 1.8891 | 1.8887 | 1.8872 | 1.8899 | 0.0014 | 0.377826 | 529453942.08 | 3.435 |
| R-gc-shape (malloc/free heap_churn) | ok | 0.6134 | 0.6138 | 0.6129 | 0.6152 | 0.0012 | 0.122671 | 1629188093.57 | 1.044 |
| R-boehm (GC_MALLOC/GC_FREE) | ok | 17.9711 | 17.6613 | 17.0162 | 17.9966 | 0.5588 | 3.594224 | 56659412.09 | 28.125 |

| Comparison (mint/consume only) | Value |
|--------------------------------|-------|
| Ratio heap_churn / freestanding ns/op | **0.325** |
| Ratio boehm_gc / freestanding ns/op | **9.513** |
| N (ops per timed process) | free=200000000 / gc-shape=200000000 / boehm=200000000 |

## Numbers -- Lean managed runtime contrast

Job class: mint_consume-class **logical** protocol under classic Lean managed runtime (allocate small structure, discard; GC path). **Not** the same C IR as freestanding. N default **50000000** (override `BENCH_RUNTIME_LEAN_N`). Timed step is **process run** after untimed warm `lake build` (not cold full-package elaborate).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-lean (Lean managed runtime) | ok | 6.6897 | 6.5259 | 6.1978 | 6.6901 | 0.2841 | 0.334484 | 153435552.58 | 3.208 |

| Comparison (mint-class labeled) | Value |
|----------------------------------|-------|
| Ratio lean_managed / freestanding ns/op | **3.541** |
| N freestanding mint | 200000000 |
| N Lean managed | 50000000 |
| Note | Do **not** merge ns/op across different N without labels; not freestanding C |

## Numbers -- compose-class

Job class: build small IR/host-compose graph each op (push nodes, edges, mint, mark, check, extract, consume) vs malloc node-list + free. N default **10000000** (override `BENCH_RUNTIME_COMPOSE_N`). **Different job from mint/consume; do not merge ns/op.**

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free-compose (host_compose freestanding) | ok | 39.7589 | 40.0603 | 39.5007 | 40.9212 | 0.7567 | 0.397589 | 24968253.65 | 3.835 |
| R-gc-shape-compose (malloc node list) | ok | 10.0805 | 10.0994 | 10.0580 | 10.1598 | 0.0535 | 0.100805 | 99017059.03 | 0.872 |

| Comparison (compose only) | Value |
|---------------------------|-------|
| Ratio heap_churn_compose / freestanding_compose ns/op | **0.254** |
| N (ops per timed process) | free-compose=10000000 / gc-compose=10000000 |

### Compose stage timers (R-free-compose attribution)

Smoke-side only (separate pass after primary whole-op timing). Product wire has **no** always-on timers. Default ON; set `BENCH_RUNTIME_STAGE_TIMERS=0` to skip. Cap stage N with `BENCH_RUNTIME_STAGE_N` (default min(compose N, 200000)). Stage keys: init, push_nodes, edges, mint, mark, well_typed, check_fail_closed, extract, consume, post_check.

| Stage / group | ns/op (stage pass) |
|---------------|-------------------:|
| stage_N | 200000 |
| init | 22.6754 |
| push_nodes | 28.0512 |
| edges | 24.3446 |
| mint | 25.2302 |
| mark | 25.1202 |
| well_typed | 26.6474 |
| check_fail_closed | 30.3532 |
| extract | 31.0903 |
| consume | 25.4355 |
| post_check | 27.8316 |
| group setup (init+push+edges) | 75.0712 |
| group mint_mark | 50.3504 |
| group check (well_typed+fail_closed+post) | 84.8322 |
| group extract_consume | 56.5258 |

stage_timers flag from last measured process: **on**. Stage ns includes `clock_gettime` overhead; use for relative attribution, not absolute product claim.

## Structural evidence (R-free mint + compose)

| Check | R-free (mint) | R-free-compose |
|-------|---------------|----------------|
| Freestanding-first wire `-c` | structural freestanding-first compile: ffreestanding-nostdlib | structural freestanding-first compile: ffreestanding-nostdlib |
| Link line | link line: cc -std=c11 -O2 -Isrc/systems/emit -o /tmp/slake-rt-free-528230/r-free src/systems/smoke/slake_runtime_bench_freestanding.c src/systems/emit/slake_freestanding.c | link line: cc -std=c11 -O2 -Isrc/systems/emit -o /tmp/slake-rt-free-compose-530298/r-free-compose src/systems/smoke/slake_runtime_bench_freestanding_compose.c src/systems/emit/slake_freestanding.c |
| Binary size note | structural binary bytes: 20188 | structural binary bytes: 25117 |
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
| R-lean binary size note | structural binary bytes: 15022616 |
| R-free still no leanshared/libgc | structural no leanshared/libgc in ldd: ok |
| Baseline name | `lean_managed_runtime` (not freestanding C IR) |

### Product wire sizes

| Bytes | Path |
|------:|------|
| 31742 | `src/systems/emit/slake_freestanding.c` |
| 31118 | `src/systems/emit/slake_freestanding.h` |
| 31742 | `out/freestanding-c/slake_freestanding.c` |
| 31118 | `out/freestanding-c/slake_freestanding.h` |

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
```

## Machine

| Item | Value |
|------|-------|
| Hostname | horizon |
| uname -srm | Linux 7.1.8-zen1-3-zen x86_64 |
| nproc | 16 |
| cc --version | cc (GCC) 16.2.1 20260810 |
| CFLAGS | `-std=c11 -O2` (hosted link for timing; freestanding-first `-c` separate) |

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
| Full transcript | `/tmp/systems-lean-bench-runtime-20260812T173934Z.log` |
| Research note | `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` |
| Recipes | `just/bench-runtime.just` (arms) + `just/bench-runtime-report.just` (suite/report) |
| Drivers | `src/systems/smoke/slake_runtime_bench_*.c` |
| Lean measurement | `SystemsLean.RuntimeBenchLean` / `slake-runtime-bench-lean` |
| Secondary compile report | `doc/BENCH-latest.md` |

## Overall exit

**ok** (measured arms exit 0; Boehm/Lean may soft-skip)

