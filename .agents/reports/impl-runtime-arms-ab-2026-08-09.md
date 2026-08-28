# Implement report: runtime bench Arm A (compose) + Arm B (Boehm)

Date: 2026-08-09
Kind: measurement implement. Not claim flips.
Status: **GREEN**

## Operator question

> Do linear types help us make provably fastest C because there is no GC and there are no runtime libraries?

## What landed

| Piece | Path |
|-------|------|
| Compose freestanding driver | `src/systems/smoke/slake_runtime_bench_freestanding_compose.c` |
| Compose heap_churn driver | `src/systems/smoke/slake_runtime_bench_gcshape_compose.c` |
| Boehm driver | `src/systems/smoke/slake_runtime_bench_boehm.c` |
| Recipes + suite report | `just/bench-runtime.just` (831 lines, under Sub-1-KLOC) |
| Living report | `doc/BENCH-RUNTIME-latest.md` |
| Research | `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` |
| Residual / WATCHER / handoff | lockstep; next Open = Lean managed runtime arm (Arm C) |

## Numbers (this host; full suite exit 0)

Stamp: 2026-08-09 17:32:26 UTC
Log: `/tmp/systems-lean-bench-runtime-20260809T173226Z.log`

### Mint/consume v1

| Arm | Exit | median ns/op | median wall (s) |
|-----|------|-------------:|----------------:|
| R-free | ok | 2.1176 | 0.423512 |
| R-gc-shape (heap_churn) | ok | 0.7098 | 0.141964 |
| R-boehm (boehm_gc) | ok | 18.6907 | 3.738135 |

| Ratio | Value |
|-------|------:|
| heap_churn / freestanding | 0.335 |
| boehm_gc / freestanding | 8.826 |

### Compose-class (separate job; do not merge with mint)

| Arm | Exit | median ns/op | median wall (s) |
|-----|------|-------------:|----------------:|
| R-free-compose | ok | 44.8602 | 0.448602 |
| R-gc-shape-compose | ok | 10.7879 | 0.107879 |

| Ratio | Value |
|-------|------:|
| heap_churn_compose / freestanding_compose | 0.240 |

N mint = 200000000; N compose = 10000000; runs = 3 after outer discard.

## Structural honesty

- R-free and R-free-compose: freestanding-first `-c` = ffreestanding-nostdlib; ldd/nm no leanshared/libgc.
- R-boehm: libgc present in ldd (contrast).
- No product emit/out C feature edits.
- Soft-skip path for missing Boehm documented (`status=skip_no_boehm`, suite exit 0).

## Short answer (structure + speed)

- **Structure:** freestanding consumer paths have **no GC library** and **no Lean runtime** on the link line; linear mint/consume and host_compose exact-once ownership are the product mechanism.
- **Speed (mint):** freestanding slower than libc heap_churn on this microbench; freestanding **much faster** than real Boehm on the same job (~8.8x Boehm/free ratio).
- **Speed (compose):** freestanding compose still loses to thin malloc node-list heap_churn on this host (~0.24 ratio baseline/free).
- **PROVABLY** is CompCert correctness of the wire, not a speed proof.

## Gates

| Gate | Result |
|------|--------|
| `just bench-runtime` | exit 0; report has mint + compose + Boehm sections |
| `just hygiene` | exit 0 |

## Held

- Arm C Lean managed runtime: next residual Open (WATCHER `/implement`).
- free / complete / PROVABLY / FullHost: **unchanged**.

## Summary mirror

`/tmp/grok-1000/grok-impl-summary-runtime-arms-ab.md`
