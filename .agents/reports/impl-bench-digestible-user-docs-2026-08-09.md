# Implement report: digestible runtime bench + user-facing docs

Kind: measurement presentation + process law. Not residual invent.
Not free / complete / PROVABLY / FullHost claim flips. ASCII only.

Date: 2026-08-09

## Goal

Make runtime bench results easily digestible for humans, and require that
real speed wins update user-facing living docs in the same slice.

## What changed

### 1) Report generator (How much faster first)

- Split suite/report out of `just/bench-runtime.just` (was 989 lines, Sub-1-KLOC bar)
  into `just/bench-runtime-report.just` (568 lines).
- Arms + N defaults stay in `just/bench-runtime.just` (469 lines).
- Root `justfile` imports both (shared just namespace for `_bench_rt_*` vars).
- After **Question**, living report now emits:

  - **How much faster (this run)** with plain English mint/compose bullets
  - **Headline** table: Baseline | Freestanding vs baseline | free ns/op | baseline ns/op
  - Multipliers: `~Nx faster` / `~Nx slower` (ASCII `x`, not unicode times)
  - Short structural bullets + one-sentence Verdict
  - Full number tables below (unchanged role)

Helper `phrase_vs` compares freestanding median ns/op to each baseline.

### 2) User-facing docs

| Path | Update |
|------|--------|
| Root `README.md` | Runtime evidence line: ~9.3x Boehm, ~3.4x Lean managed, honest slower vs malloc; link to living report; table row for `just bench-runtime` |
| `out/freestanding-c/README.md` | **Runtime evidence** paragraph + monorepo link |
| `doc/SESSION-HANDOFF.md` | Measurement digest tip with How much faster multipliers |
| `just/README.md` | Split recipe rows for arms vs report module |

### 3) Process law

Project `AGENTS.md` under Documentation hygiene:

**Benchmarks and user-facing docs (hard rule)**

When a run shows a real improvement (or first solid win vs a named baseline),
same-slice updates: living report (via suite), root README living tip (or
consumer surface), SESSION-HANDOFF if reseed tip stale; optional freestanding
README. Honesty: never invent faster; do not claim faster when freestanding
is slower vs that baseline. Runtime suite primary; compile-path secondary.

Research note one-liner:
`doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md`.

### 4) Residual / WATCHER

- `RESIDUAL-systems.md` Runtime bench Done rows note digestible report + process rule.
- `WATCHER.md` DONE-FOR-NOW (Open still empty; no forge).

## Verification

```text
just bench-runtime   # exit 0; wrote doc/BENCH-RUNTIME-latest.md
just hygiene         # exit 0
```

Living report stamp: **2026-08-09 17:59:20 UTC**.

Sample How much faster (host run):

- Freestanding **~9.3x faster** than Boehm GC
- Freestanding **~3.4x faster** than Lean managed runtime
- Freestanding **~3.1x slower** than heap_churn (mint)
- Freestanding compose **~3.9x slower** than compose heap_churn

Structural: no GC / no Lean RT on freestanding link unchanged.
PROVABLY != speed unchanged.

## Non-claims

- free / complete / PROVABLY / FullHost / full elaborator parity / full LLVM
  backend / Rust-native link: **not** flipped by this slice.
- Not "fastest C on Earth."
- Not a claim that freestanding beats malloc microchurn (it does not on this job).

## Summary path

`/tmp/grok-1000/grok-impl-summary-bench-digestible.md`
