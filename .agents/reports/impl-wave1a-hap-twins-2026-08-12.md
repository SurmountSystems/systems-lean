# Implementer report: Wave 1 tools Names 1-3 (2026-08-12)

**Status:** GREEN

**Scope:** residual Names 1-3 only (stack live-flag twin, fail_closed_shape,
flag-matrix honesty). Smoke C + just recipes + living report. Not product
Lean. Not emit SSOT. Not claim flips.

## TDD

Red first: `just bench-runtime-twin-contract` failed (exit 1) while smoke
files, recipes, and living-report twin labels were missing. After arms and a
real suite write, the same recipe is **ok** (exit 0). Contract greps for
product header and malloc were tightened to `#include` / `malloc(` call
sites so honesty comments do not false-fail. Asserts were not weakened.

## Commands and exit codes

| Command | Exit |
|---------|-----:|
| `just hygiene` (before residual docs) | 0 |
| `just bench-runtime-flag-matrix-honesty` (`BENCH_RUNTIME_FLAG_MATRIX_N=20000000` `COMPOSE_N=2000000` `RUNS=2`) | 0 |
| `just bench-runtime` (defaults: mint N=2e8, compose N=1e7, lean N=5e7, runs=3) | 0 |
| `just bench-runtime-twin-contract` (after living report) | 0 |
| `just hygiene` (after residual / README / research / this report) | 0 |

Honesty log: `/tmp/systems-lean-bench-runtime-flag-matrix-honesty-20260812T190614Z.log`

Suite log: `/tmp/systems-lean-bench-runtime-20260812T190625Z.log`

## Median ns/op (real timed; not invented)

### Production suite (`just bench-runtime`, stamp **20260812T190625Z**, timing link `-O3 -flto`)

| Arm | Job | N | median ns/op |
|-----|-----|--:|-------------:|
| R-free | mint | 200000000 | 0.6872 |
| R-gc-shape (heap_churn allocator) | mint | 200000000 | 0.6683 |
| R-stack-twin (protocol; not product wire) | mint | 200000000 | 0.6621 |
| R-boehm | mint | 200000000 | 20.6896 |
| R-lean | mint | 50000000 | 8.0803 |
| R-free-compose | compose | 10000000 | 27.8212 |
| R-gc-shape-compose (heap_churn) | compose | 10000000 | 11.2595 |
| R-fail-closed-shape (protocol; not product wire) | compose | 10000000 | 18.6116 |

Phrases this run: mint vs heap **~1.0x slower**; mint vs stack twin **~1.0x
slower**; compose vs heap **~2.5x slower**; compose vs fail_closed_shape
**~1.5x slower**. Mint vs Boehm **~30.1x faster**; vs Lean **~11.8x faster**.
Do not call these PROVABLY. HostCost remains Nat bounds, not ns.

### Honesty cells (`just bench-runtime-flag-matrix-honesty`, stamp **20260812T190614Z**)

Mint N=20000000, compose N=2000000, runs=2.

| flags | R-free | R-gc-shape | R-stack-twin | R-free-compose | R-gc-shape-compose | R-fail-closed-shape |
|-------|-------:|-----------:|-------------:|---------------:|-------------------:|--------------------:|
| `-O3` | 2.0314 | 1.0901 | 1.0738 | 67.8119 | 12.4505 | 29.5022 |
| `-O3 -flto` | 0.9772 | 1.0170 | 0.9008 | 31.6688 | 11.8850 | 20.4040 |

Operator reproduce: `just bench-runtime-flag-matrix-honesty` or
`BENCH_RUNTIME_CFLAGS="-O3"` on named arms. Default suite stays `-O3 -flto`.
Structural `-c` stays `-O2 -ffreestanding -nostdlib`. Not `just build`.

## What landed

- Smoke `src/systems/smoke/slake_runtime_bench_stack_twin.c`: stack id+live+state;
  mint/consume fail-closed codes; remint after spent; no malloc; no `slake_*`.
- Smoke `src/systems/smoke/slake_runtime_bench_fail_closed_shape.c`: stack 8+16;
  same 3+2 graph; well-typed; mult pre-scan; extract-shaped runtime-fs write;
  consume; post fail-closed. Label `fail_closed_shape`. Not heap_churn.
- Recipes in `just/bench-runtime-twins.just`; suite in
  `just/bench-runtime-report.just` runs both twins; heap_churn arms kept.
- Living report `doc/BENCH-RUNTIME-latest.md` leads with How much faster and
  names both allocator and protocol ratios plus `-O3` / `-O3 -flto`.
- Honesty TSV `doc/bench-history/flag-matrix-honesty-latest.tsv`.

## Residual lockstep

Names 1-3 marked **done** in `RESIDUAL-systems.md` and `RESIDUAL.md` join.
Names 5-9 stay **open**. Name 4 stays **done**. Open is **not** empty.
WATCHER stays **IN PROGRESS** (Wave 2 Lean next). Not DONE-FOR-NOW.

## Confirm (this implementer)

- **No** product emit C edits (`src/systems/emit/*.c`, `out/freestanding-c/*.c`).
- **No** `HostCost.lean` edits.
- **No** claim-bool flips (free / complete / PROVABLY stay true; FullHost /
  Dominance / FullBackend stay false).
- **No** `git add` / `git commit`.
- Speed is empirical. PROVABLY is CompCert.

## Files touched

- `src/systems/smoke/slake_runtime_bench_stack_twin.c` (new)
- `src/systems/smoke/slake_runtime_bench_fail_closed_shape.c` (new)
- `just/bench-runtime-twins.just` (new)
- `just/bench-runtime-report.just`
- `just/bench-runtime.just` (header mention)
- `justfile` (import)
- `just/README.md`
- `doc/BENCH-RUNTIME-latest.md` (generated)
- `doc/BENCH-RUNTIME-metrics.tsv` (generated)
- `doc/bench-history/flag-matrix-honesty-latest.tsv` (generated)
- `doc/bench-history/flag-matrix-honesty-20260812T190614Z.tsv` (generated)
- `doc/dev/research/runtime-flag-matrix-2026-08-12.md`
- `RESIDUAL-systems.md`
- `RESIDUAL.md`
- `WATCHER.md`
- `doc/SESSION-HANDOFF.md`
- `README.md` (living tip 8: two ratios / twins; no invented product speed win)
- `.agents/reports/impl-wave1a-hap-twins-2026-08-12.md` (this file)
