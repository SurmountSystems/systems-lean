# Runtime freestanding bench -- operator question

Generated: **2026-08-12 19:29:51 UTC**

Kind: **runtime** wall-clock + structural link honesty. Not a residual claim flip.
Not the compile-path suite (`just bench` / `doc/BENCH-latest.md`).

## Question

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## How much faster (this run)

Plain American English from **median ns/op** this run. **Freestanding product path** is our approach (linear ownership; no GC library; no Lean managed runtime on the consumer link). Lower ns/op is faster. Multipliers use "Nx faster" / "Nx slower" (not bare ratios alone).

### Mint/consume class

- Freestanding is **~28.2x faster** than Boehm GC (free **0.6645** ns/op vs Boehm **18.7710** ns/op; exit **ok**).
- Freestanding is **~11.2x faster** than Lean managed runtime (free **0.6645** ns/op vs lean **7.4700** ns/op; free N=**200000000**, lean N=**50000000**; exit **ok**). Labeled contrast only; not the same C IR.
- Freestanding is **~1.0x faster** than heap_churn (malloc/free **allocator** baseline) on this mint microbench (free **0.6645** ns/op vs heap **0.6748** ns/op). Honest: freestanding mint median <= heap_churn under this run's timing-link flags (default -O3 -flto).
- Freestanding is **~1.0x slower** than the smoke-only **stack live-flag twin** (same id+live+state protocol; **not product wire**) (free **0.6645** ns/op vs stack-twin **0.6336** ns/op). This is the protocol C bar, not malloc.

### Compose class

- Freestanding compose is **~1.6x slower** than compose heap_churn (allocator) (free-compose **17.5277** ns/op vs gcomp **10.6737** ns/op). Do **not** merge compose ns/op with mint ns/op. Do **not** treat heap_churn as the same fail-closed protocol.
- Freestanding compose is **~1.0x faster** than the smoke-only **fail_closed_shape** twin (stack 8+16, same 3+2 graph, well-typed + pre-scan + extract + post; **not product wire**) (free-compose **17.5277** ns/op vs fail_closed_shape **18.2351** ns/op).

### Flags (this suite vs contrast)

- Default suite timing-link CFLAGS: **`-O3 -flto`** (this table). Structural freestanding-first `-c` stays **`-O2 -ffreestanding -nostdlib`** (not `BENCH_RUNTIME_CFLAGS`).
- `-O3` (no LTO) mint+compose cells: recipe `just bench-runtime-flag-matrix-honesty` or `BENCH_RUNTIME_CFLAGS="-O3"` on named arms. Table below when `doc/bench-history/flag-matrix-honesty-latest.tsv` is present. Not the consumer default. Not `just build`.

### Headline

| Baseline | Freestanding vs baseline | median ns/op free | median ns/op baseline |
|----------|--------------------------|------------------:|----------------------:|
| Boehm GC | **~28.2x faster** | 0.6645 | 18.7710 |
| Lean managed runtime | **~11.2x faster** | 0.6645 | 7.4700 |
| heap_churn (malloc allocator) | **~1.0x faster** | 0.6645 | 0.6748 |
| stack live-flag twin (protocol; not product wire) | **~1.0x slower** | 0.6645 | 0.6336 |
| compose heap_churn (allocator) | **~1.6x slower** | 17.5277 | 10.6737 |
| compose fail_closed_shape (protocol; not product wire) | **~1.0x faster** | 17.5277 | 18.2351 |

## Short answer (structure)

- **No GC / no Lean runtime** on freestanding consumer paths: R-free and R-free-compose link product wire C + small smoke only. Structural freestanding-first `-c`; `ldd`/`nm` without leanshared/libgc when tools exist.
- **PROVABLY is not speed:** CompCert product seal (`just product-compcert-matrix`) is wire correctness, not "fastest C on Earth."
- Full number tables below. Speed is empirical per job class, N, and machine. Raw ratios (baseline/free): mint heap **1.016**, mint stack-twin **0.953**, Boehm **28.248**, lean **11.242**, compose heap **0.609**, compose fail_closed_shape **1.040**.
- **HostCost** Nat bounds (extract fuse, grade looks) are **not** nanoseconds. **PROVABLY** is CompCert wire correctness, not speed.

## Verdict (one sentence)

Freestanding is **~28.2x faster** than Boehm and **~11.2x faster** than Lean managed on mint-class this run, with **no GC and no Lean RT** on the freestanding link; vs heap_churn (allocator) **~1.0x faster** (mint) and **~1.6x slower** (compose); vs protocol twins **~1.0x slower** (stack live-flag) and **~1.0x faster** (fail_closed_shape). PROVABLY seals correctness only.

## Numbers -- mint/consume v1

Job class: acquire/release-once token protocol. N default **200000000** (override `BENCH_RUNTIME_N`). Measured runs per arm **3** after one outer discard + in-driver warmup. Spread columns: **min/max/stdev** of ns/op across measured runs (first sample dropped when multi-run; sample stdev when runs>=2 after drop).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free (linear freestanding) | ok | 0.6645 | 0.6552 | 0.6273 | 0.6739 | 0.0246 | 0.132893 | 1527648851.96 | 1.363 |
| R-gc-shape (malloc/free heap_churn) | ok | 0.6748 | 0.6801 | 0.6308 | 0.7347 | 0.0522 | 0.134952 | 1476177958.46 | 1.160 |
| R-stack-twin (stack live-flag; not product wire) | ok | 0.6336 | 0.6346 | 0.6323 | 0.6380 | 0.0030 | 0.126714 | 1575749764.47 | 1.097 |
| R-boehm (GC_MALLOC/GC_FREE) | ok | 18.7710 | 18.7495 | 18.4834 | 18.9941 | 0.2560 | 3.754192 | 53341495.00 | 30.421 |

| Comparison (mint/consume only) | Value |
|--------------------------------|-------|
| Ratio heap_churn / freestanding ns/op (allocator) | **1.016** |
| Ratio stack_twin / freestanding ns/op (protocol) | **0.953** |
| Ratio boehm_gc / freestanding ns/op | **28.248** |
| N (ops per timed process) | free=200000000 / gc-shape=200000000 / stack-twin=200000000 / boehm=200000000 |

## Numbers -- Lean managed runtime contrast

Job class: mint_consume-class **logical** protocol under classic Lean managed runtime (allocate small structure, discard; GC path). **Not** the same C IR as freestanding. N default **50000000** (override `BENCH_RUNTIME_LEAN_N`). Timed step is **process run** after untimed warm `lake build` (not cold full-package elaborate).

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-lean (Lean managed runtime) | ok | 7.4700 | 7.3178 | 6.9541 | 7.5292 | 0.3164 | 0.373500 | 136828389.82 | 4.036 |

| Comparison (mint-class labeled) | Value |
|----------------------------------|-------|
| Ratio lean_managed / freestanding ns/op | **11.242** |
| N freestanding mint | 200000000 |
| N Lean managed | 50000000 |
| Note | Do **not** merge ns/op across different N without labels; not freestanding C |

## Numbers -- compose-class

Job class: build small IR/host-compose graph each op (push nodes, edges, mint, mark, check, extract, consume) vs malloc node-list + free. N default **10000000** (override `BENCH_RUNTIME_COMPOSE_N`). **Different job from mint/consume; do not merge ns/op.**

| Arm | Exit | median ns/op | mean | min | max | stdev | median wall (s) | mean ops/s | outer real (s) |
|-----|------|-------------:|-----:|----:|----:|------:|----------------:|-----------:|---------------:|
| R-free-compose (host_compose freestanding) | ok | 17.5277 | 18.0603 | 17.4279 | 19.2254 | 1.0102 | 0.175277 | 55482187.99 | 2.143 |
| R-gc-shape-compose (malloc node list) | ok | 10.6737 | 10.6944 | 10.6698 | 10.7396 | 0.0392 | 0.106737 | 93508090.75 | 0.972 |
| R-fail-closed-shape (stack protocol; not product wire) | ok | 18.2351 | 18.0769 | 17.7349 | 18.2607 | 0.2965 | 0.182351 | 55329140.21 | 1.568 |

| Comparison (compose only) | Value |
|---------------------------|-------|
| Ratio heap_churn_compose / freestanding_compose ns/op (allocator) | **0.609** |
| Ratio fail_closed_shape / freestanding_compose ns/op (protocol) | **1.040** |
| N (ops per timed process) | free-compose=10000000 / gc-compose=10000000 / fail_closed_shape=10000000 |
| Primary cold arm | unchanged (full re-init each op; extract not skipped) |

### Compose stage timers (R-free-compose attribution)

Smoke-side only (separate pass after primary whole-op timing). Product wire has **no** always-on timers. Default ON; set `BENCH_RUNTIME_STAGE_TIMERS=0` to skip. Cap stage N with `BENCH_RUNTIME_STAGE_N` (default min(compose N, 200000)). Stage keys: init, push_nodes, edges, mint, mark, well_typed, check_fail_closed, extract, consume, post_check.

| Stage / group | ns/op (stage pass) |
|---------------|-------------------:|
| stage_N | 200000 |
| init | 22.0684 |
| push_nodes | 25.3755 |
| edges | 24.0914 |
| mint | 23.6529 |
| mark | 23.4364 |
| well_typed | 25.0239 |
| check_fail_closed | 0.0000 |
| extract | 26.3525 |
| consume | 23.7313 |
| post_check | 24.3210 |
| group setup (init+push+edges) | 71.5353 |
| group mint_mark | 47.0893 |
| group check (well_typed+fail_closed+post) | 49.3449 |
| group extract_consume | 50.0838 |

stage_timers flag from last measured process: **on**. Stage ns includes `clock_gettime` overhead; use for relative attribution, not absolute product claim.

### Compose leftover isolate (bench well_typed vs extract vs cold init)

Focused rebench stamp **20260812T203148Z** (`just bench-runtime-compose-isolate`). Same timing-link **`-O3 -flto`**. N compose **10000000**. Default suite mint numbers above stay stamp **20260812T192951Z** (this slice did **not** re-run the mint suite).

Per-call `clock_gettime` stage sandwiches are **timer-dominated** (each stage ~22-26 ns vs ~17 ns whole-op). The isolate pass times one call kind in a batch loop so timer overhead is amortized. `is_well_typed` is **bench-only** (not product Out). Extract still runs on the primary cold arm. Default cold stays full `init`. Recipe `just bench-runtime-freestanding-compose-reset` is opt-in only.

| Arm / bucket | median ns/op | Role |
|--------------|-------------:|------|
| R-free-compose cold (whole-op) | 17.2105 | Primary product-shape; full re-init; extract not skipped |
| R-gc-shape-compose (heap_churn) | 9.8852 | Allocator only; not fail-closed protocol |
| R-fail-closed-shape | 17.1701 | Protocol twin; **not product wire** |
| R-free-compose reset (whole-op) | 16.0208 | Opt-in `BENCH_RUNTIME_COMPOSE_RESET=1`; not the default |
| isolate well_typed | 3.0905 | Bench `is_well_typed` only; not product Out |
| isolate extract | 4.5060 | Product extract walk; not skipped |
| isolate init | 3.6766 | Batch full `init` |
| isolate reset call | 0.8400 | Batch E3 count-only `reset` |

Of cold whole-op **17.2105** ns: bench well_typed is **~18%** (3.0905), extract is **~26%** (4.5060), cold init is **~21%** (3.6766). Those three sum to **11.2731** ns. Remainder (push, edges, mint, mark, consume, post_check) is about **5.94** ns.

Versus heap **9.8852**: cold is **~1.7x slower** (did **not** beat heap). The leftover gap is about **7.33** ns. Bench well_typed is **3.09** ns of that gap and is **not** product Out. Extract is **4.51** ns of product work. Whole-op reset vs cold saves about **1.19** ns (**~16%** of the heap gap). The 1.6x leftover is **not** mostly E3 cold-init tax.

Versus fail_closed_shape **17.1701**: cold is about the same (~1.0x). Twin is not product wire.

Default cold unchanged. Extract not skipped. No product SSOT edit (bench `is_well_typed` is extra to the single product walk). TSV: `doc/bench-history/compose-isolate-latest.tsv`.

## Structural evidence (R-free mint + compose)

| Check | R-free (mint) | R-free-compose |
|-------|---------------|----------------|
| Freestanding-first wire `-c` | structural freestanding-first compile: ffreestanding-nostdlib | structural freestanding-first compile: ffreestanding-nostdlib |
| Link line | link line: cc -std=c11 -O3 -flto -Isrc/systems/emit -o /tmp/slake-rt-free-807644/r-free src/systems/smoke/slake_runtime_bench_freestanding.c src/systems/emit/slake_freestanding.c | link line: cc -std=c11 -O3 -flto -Isrc/systems/emit -o /tmp/slake-rt-free-compose-810163/r-free-compose src/systems/smoke/slake_runtime_bench_freestanding_compose.c src/systems/emit/slake_freestanding.c |
| Binary size note | structural binary bytes: 8496 | structural binary bytes: 19922 |
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
| R-lean binary size note | structural binary bytes: 15287968 |
| R-free still no leanshared/libgc | structural no leanshared/libgc in ldd: ok |
| Baseline name | `lean_managed_runtime` (not freestanding C IR) |

### Product wire sizes

| Bytes | Path |
|------:|------|
| 33794 | `src/systems/emit/slake_freestanding.c` |
| 32574 | `src/systems/emit/slake_freestanding.h` |
| 33794 | `out/freestanding-c/slake_freestanding.c` |
| 32574 | `out/freestanding-c/slake_freestanding.h` |

## How to re-run

```bash
just bench-runtime
# arms: just bench-runtime-freestanding | just bench-runtime-gcshape
#        just bench-runtime-stack-twin
#        just bench-runtime-freestanding-compose | just bench-runtime-gcshape-compose
#        just bench-runtime-fail-closed-shape
#        just bench-runtime-boehm | just bench-runtime-lean
# calibrate mint: BENCH_RUNTIME_N=10000000 BENCH_RUNTIME_RUNS=5 just bench-runtime
# calibrate compose: BENCH_RUNTIME_COMPOSE_N=5000000 just bench-runtime
# calibrate lean: BENCH_RUNTIME_LEAN_N=5000000 just bench-runtime
# stage timers off: BENCH_RUNTIME_STAGE_TIMERS=0 just bench-runtime-freestanding-compose
# stage N cap: BENCH_RUNTIME_STAGE_N=50000 just bench-runtime-freestanding-compose
# timing-link flags (default -O3 -flto E4+LTO): BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-freestanding
# flag matrix (T3 mint R-free): just bench-runtime-flag-matrix
# flag matrix honesty (mint+compose -O3 and -O3 -flto): just bench-runtime-flag-matrix-honesty
#   BENCH_RUNTIME_CFLAGS="-O3" just bench-runtime-freestanding
# snapshot history (T5): just bench-runtime-snapshot
# regression vs tip baseline (T6 opt-in; default suite never fails CI):
#   just bench-runtime-regress
#   BENCH_RUNTIME_REGRESS=1 just bench-runtime
#   BENCH_RUNTIME_REGRESS_PCT=10 BENCH_RUNTIME_REGRESS_MODE=warn just bench-runtime-regress
# host perf attach (T7; soft-skip no perf): just bench-runtime-perf-mint | bench-runtime-perf-compose
# compose micro hot path (T9; cold remains primary): just bench-runtime-freestanding-compose-micro
#   BENCH_RUNTIME_COMPOSE_MICRO=1 just bench-runtime-freestanding-compose
# leftover isolate (well_typed vs extract vs init; vs heap and fail_closed_shape):
#   just bench-runtime-compose-isolate
# reset path (opt-in; default cold unchanged): just bench-runtime-freestanding-compose-reset
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
| R-gc-shape | mint_consume | malloc payload then free (heap_churn allocator) | driver only |
| R-stack-twin | mint_consume | stack id+live+state mint/consume (protocol twin; **not product wire**) | driver only |
| R-boehm | mint_consume | `GC_MALLOC` then `GC_FREE` (boehm_gc) | driver + `-lgc` |
| R-lean | mint_consume | Lean mint ByteArray discard (lean_managed_runtime) | lake exe; Lean RT shared or embedded |
| R-free-compose | compose | host_compose init/push/edge/mint/mark/check/extract/consume (primary cold) | emit + smoke |
| R-gc-shape-compose | compose | malloc node list + edges + token; free all each op (heap_churn) | driver only |
| R-fail-closed-shape | compose | stack 8+16 well-typed + pre-scan + extract + post (**fail_closed_shape**; not product wire) | driver only |

Baselines are named honestly: **heap_churn** (allocator), **stack live-flag twin** / **fail_closed_shape** (protocol; not product wire), **boehm_gc**, **lean_managed_runtime**. Lean is not freestanding C IR.

**Spread formula (T2):** for each arm, collect `ns_per_op=` lines; if 2+ samples drop the first (outer discard noise); report min, max, median, mean, and sample standard deviation (sqrt of sum((x-mean)^2)/(n-1) when n>=2 after drop). Default `BENCH_RUNTIME_RUNS=3`; raise for tighter stdev.

**Stage timers (T1):** freestanding compose driver only; separate stage pass after primary whole-op loop; keys `stage_ns_per_op_*` and group rollups; product wire never always-on.

**Machine-readable metrics (T4):** suite also writes `doc/BENCH-RUNTIME-metrics.tsv` (tab-separated; one row per arm; soft-skips as exit status). Human markdown remains primary.

**Flag matrix (T3) / E4+LTO policy:** `just bench-runtime-flag-matrix` or `BENCH_RUNTIME_CFLAGS` on arms. Compares timing-link `-O2` vs `-O3` vs `-O3 -flto` for R-free mint. **Honesty cells (mint+compose):** `just bench-runtime-flag-matrix-honesty` writes `doc/bench-history/flag-matrix-honesty-latest.tsv` (`-O3` and `-O3 -flto` for R-free, heap, stack-twin, compose, heap compose, fail_closed_shape). Structural freestanding-first `-c` unchanged (`-O2 -ffreestanding -nostdlib`). **Default suite timing link is `-O3 -flto`**. Override `BENCH_RUNTIME_CFLAGS="-O3"` if LTO link fails. Not `just build`. Research: `doc/dev/research/runtime-flag-matrix-2026-08-12.md`.

### Flag-matrix honesty cells (`-O3` and `-O3 -flto`)

Reproduce: `just bench-runtime-flag-matrix-honesty` (calibrate `BENCH_RUNTIME_FLAG_MATRIX_N` / `BENCH_RUNTIME_FLAG_MATRIX_COMPOSE_N`). Default suite numbers above are **`-O3 -flto`** only.

| stamp | flags | arm | exit | N | ns_median | ns_mean | ns_min | ns_max | status |
|-------|-------|-----|------|--:|----------:|--------:|-------:|-------:|--------|
| 20260812T190614Z | `-O3` | R-free | ok | 20000000 | 2.0314 | 2.0314 | 1.9261 | 2.1367 | ok |
| 20260812T190614Z | `-O3` | R-gc-shape | ok | 20000000 | 1.0901 | 1.0901 | 1.0826 | 1.0976 | ok |
| 20260812T190614Z | `-O3` | R-stack-twin | ok | 20000000 | 1.0738 | 1.0738 | 1.0609 | 1.0867 | ok |
| 20260812T190614Z | `-O3` | R-free-compose | ok | 2000000 | 67.8119 | 67.8119 | 63.1390 | 72.4849 | ok |
| 20260812T190614Z | `-O3` | R-gc-shape-compose | ok | 2000000 | 12.4505 | 12.4505 | 11.7300 | 13.1711 | ok |
| 20260812T190614Z | `-O3` | R-fail-closed-shape | ok | 2000000 | 29.5022 | 29.5022 | 26.0889 | 32.9154 | ok |
| 20260812T190614Z | `-O3 -flto` | R-free | ok | 20000000 | 0.9772 | 0.9772 | 0.8291 | 1.1254 | ok |
| 20260812T190614Z | `-O3 -flto` | R-gc-shape | ok | 20000000 | 1.0170 | 1.0170 | 0.9492 | 1.0847 | ok |
| 20260812T190614Z | `-O3 -flto` | R-stack-twin | ok | 20000000 | 0.9008 | 0.9008 | 0.7745 | 1.0271 | ok |
| 20260812T190614Z | `-O3 -flto` | R-free-compose | ok | 2000000 | 31.6688 | 31.6688 | 29.4472 | 33.8905 | ok |
| 20260812T190614Z | `-O3 -flto` | R-gc-shape-compose | ok | 2000000 | 11.8850 | 11.8850 | 11.2503 | 12.5198 | ok |
| 20260812T190614Z | `-O3 -flto` | R-fail-closed-shape | ok | 2000000 | 20.4040 | 20.4041 | 20.2967 | 20.5114 | ok |

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
| Full transcript | `/tmp/systems-lean-bench-runtime-20260812T192951Z.log` |
| Research note | `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` |
| Flag matrix research | `doc/dev/research/runtime-flag-matrix-2026-08-12.md` |
| T6/T7/T9 research | `doc/dev/research/runtime-regression-perf-micro-2026-08-12.md` |
| Recipes | `just/bench-runtime.just` (arms + flag matrix + regress + perf + micro) + `just/bench-runtime-twins.just` (stack twin, fail_closed_shape, honesty matrix) + `just/bench-runtime-report.just` (suite/report/snapshot) |
| Drivers | `src/systems/smoke/slake_runtime_bench_*.c` |
| Lean measurement | `SystemsLean.RuntimeBenchLean` / `slake-runtime-bench-lean` |
| Secondary compile report | `doc/BENCH-latest.md` |

## Overall exit

**ok** (measured arms exit 0; Boehm/Lean may soft-skip)

