# Implement report -- Arm C Lean managed runtime bench (fe4cd927)

Kind: measurement implement report. Not residual invent. Not free / complete /
PROVABLY / FullHost claim flips. ASCII only.

**Date:** 2026-08-09
**IMPL:** fe4cd927
**Status:** GREEN

## Operator question

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## Delivered

| Item | Path / note |
|------|-------------|
| Lean measurement body | `src/systems/SystemsLean/RuntimeBenchLean.lean` |
| Thin main | `src/systems/SystemsLean/RuntimeBenchLeanMain.lean` |
| Lake exe | `slake-runtime-bench-lean` (lakefile inventory 52) |
| Recipe | `just bench-runtime-lean` in `just/bench-runtime.just` |
| Suite wire | `just bench-runtime` after Boehm; report section **Numbers -- Lean managed runtime contrast** |
| Living report | `doc/BENCH-RUNTIME-latest.md` |
| Research | `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` Arm C methods |
| Residual | Arm C Open -> Done; Open empty done-for-now |
| Soft-skip | `skip_no_lake` / `skip_lean_build` (exit 0) |

## Design honesty

- **Not freestanding C IR.** Logical mint/consume-class under Lean managed RT.
- **Timed:** process **run** only after untimed warm `lake build` (not cold elaborate).
- **Impure `runOpsIO`:** pure tail loops were CSE'd across warmup/timed; IO mut loop forces real work.
- **N:** default `BENCH_RUNTIME_LEAN_N=50000000` (label separately from freestanding 2e8).
- **RT evidence:** libleanshared in ldd when shared; else embedded `lean_*` bytes (this host: static RT, ~15MB binary).

## Gates

| Gate | Result |
|------|--------|
| `just hygiene` | exit 0 |
| `lake build slake-runtime-bench-lean` | exit 0 |
| `just bench-runtime` | exit 0 overall ok; lean ok |

## Living numbers (this host; re-run)

From `doc/BENCH-RUNTIME-latest.md` 2026-08-09 17:47:34 UTC:

| Arm | median ns/op | N | Exit |
|-----|-------------:|--:|------|
| R-free | 1.9240 | 2e8 | ok |
| R-gc-shape | 0.6365 | 2e8 | ok |
| R-boehm | 18.0051 | 2e8 | ok |
| **R-lean** | **6.4591** | **5e7** | **ok** |
| R-free-compose | 41.6512 | 1e7 | ok |
| R-gc-shape-compose | 10.4988 | 1e7 | ok |

- Ratio lean_managed / freestanding ns/op (labeled N): **3.357**
- Structural: R-free no leanshared/libgc; R-lean `structural lean_rt=present`
- free / complete / PROVABLY / FullHost: **unchanged**

## Out of scope (honored)

- No emit/out freestanding wire edits
- No PROVABLY-as-speed
- No free/complete/FullHost forge
- No git commit/add
