# Implement report: Wave 2 tools T3 T5 T8

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**IMPL_ID:** 5aac7784
**Kind:** measurement tooling (just process glue + research + history). Not claim flips.
**Status:** **GREEN**

ASCII only. Plain American English.

---

## Goal

Close residual Names **T3 Runtime flag matrix**, **T5 Living baseline snapshot store**,
and **T8 Structural no-GC gate polish** (Wave 2 tools track). Leave L2-L4 and Wave 3
Names to their owners (peer Lean already closed L2 L3 L4). No free/complete/PROVABLY/FullHost forge.

---

## Done when (met)

| # | Name | Outcome | Evidence |
|---|------|---------|----------|
| T3 | Runtime flag matrix | Env `BENCH_RUNTIME_CFLAGS` + recipe `bench-runtime-flag-matrix`; O2/O3/LTO on timing link only; structural `-c` fixed; research note + measured TSV | just + research + flag-matrix TSV |
| T5 | Living baseline snapshot store | `just bench-runtime-snapshot` -> stamped `doc/bench-history/<stamp>/` + tip `doc/BENCH-RUNTIME-baseline.tsv`; living latest still overwrites | recipe + history dir + README |
| T8 | Structural no-GC gate polish | Clearer fail messages with matched lines; `structural_gate=pass/fail_*`; nm -D + full; soft-skip tools missing | freestanding arms |

---

## Implementation

### T3 Runtime flag matrix

- `_bench_rt_cflags := env("BENCH_RUNTIME_CFLAGS", "-O2")` on **hosted timing link only**.
- Structural freestanding-first `-c` stays fixed: `-O2 -ffreestanding -nostdlib` (hosted fallback separate).
- All C timing arms use `tcflags` for link; print `timing_link_cflags=...`.
- Recipe `just bench-runtime-flag-matrix`: cells `-O2`, `-O3`, `-O3 -flto` on R-free mint;
  LTO soft-skips on link/run fail; required O2/O3 hard-fail.
- Writes `doc/bench-history/flag-matrix-latest.tsv` + stamped copy.
- Research: `doc/dev/research/runtime-flag-matrix-2026-08-12.md` with measured short-N table.
- Default suite remains `-O2` until E4.

### T5 Living baseline snapshot store

- Recipe `just bench-runtime-snapshot` in `just/bench-runtime-report.just`.
- Copies living metrics (+ report when present) to `doc/bench-history/<stamp>/`.
- Tip baseline: `doc/BENCH-RUNTIME-baseline.tsv`.
- Map: `doc/bench-history/README.md` (created on first snapshot).
- Living `BENCH-RUNTIME-latest.md` / metrics TSV still overwrite on suite.

### T8 Structural no-GC gate polish

- R-free and R-free-compose: fail_ldd / fail_nm with matched lines and arm name.
- Greppable `structural_gate=pass`, `structural_gate_ldd=pass|skip_no_ldd`, `structural_gate_nm=pass|skip_no_nm`.
- nm checks both `nm -D` and full `nm`.
- Soft-skip when ldd/nm missing; soft-skip no cc unchanged.
- Not folded into default `just check`.

---

## Commands and exit codes

| Command | Exit | Notes |
|---------|-----:|-------|
| `BENCH_RUNTIME_N=2000000 BENCH_RUNTIME_RUNS=2 just bench-runtime-freestanding` | 0 | structural_gate=pass |
| `BENCH_RUNTIME_COMPOSE_N=20000 BENCH_RUNTIME_RUNS=1 BENCH_RUNTIME_STAGE_TIMERS=0 just bench-runtime-freestanding-compose` | 0 | structural_gate=pass |
| `BENCH_RUNTIME_FLAG_MATRIX_N=2000000 BENCH_RUNTIME_FLAG_MATRIX_RUNS=2 just bench-runtime-flag-matrix` | 0 | O2/O3/LTO cells ok |
| `just bench-runtime-snapshot` | 0 | stamped history + tip baseline |
| `just hygiene` | 0 | source-hygiene + professional-tone OK |

Sample matrix (short N): O2 ~2.72 ns/op; O3 ~2.54; O3 -flto ~0.79 (re-check at production N before E4).

Line counts: `bench-runtime.just` 648; `bench-runtime-report.just` 808 (both under 1000).

---

## Paths touched

| Path | Change |
|------|--------|
| `just/bench-runtime.just` | CFLAGS env; T8 gates; flag-matrix recipe |
| `just/bench-runtime-report.just` | snapshot recipe; report Methods/How-to paths |
| `just/README.md` | module role rows |
| `doc/dev/research/runtime-flag-matrix-2026-08-12.md` | T3 research + measured table |
| `doc/dev/research/linear-freestanding-runtime-bench-2026-08-08.md` | T3/T5/T8 methods |
| `doc/bench-history/` | history map + flag-matrix TSV + stamped snapshot |
| `doc/BENCH-RUNTIME-baseline.tsv` | tip baseline (from snapshot) |
| `RESIDUAL-systems.md` | T3 T5 T8 **done**; Done archive; living tip |
| `RESIDUAL.md` | join Open Names + tip |
| `WATCHER.md` | Wave 3 next (T6 first) |
| `doc/SESSION-HANDOFF.md` | Active open Wave 2 tools done |
| `.agents/reports/impl-wave2-tools-t3t5t8-5aac7784-2026-08-12.md` | this report |

---

## Pins (unchanged)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | true |
| FullHostElaborateRemains | false |
| DominanceClaimed / band FullBackend | false |
| seed / harness | 206 / 99 |
| TERM dual-ok | 46 |
| FULLHOST_FLIP | no |

---

## Out of scope (honored)

- Default flag policy change (E4)
- Product emit SSOT hand edit
- Claim-bool flips
- L2-L4 product Lean (peer closed)
- T6 regression gate / T7 perf / T9 micro
- Git add/commit
- Project Python / new shell mills under `script/`
- Hard-fail whole `just check` on bench

---

## Residual lockstep

- T3 T5 T8 **done** in `RESIDUAL-systems.md` + Done archive row
- Wave 2 tools + Wave 2 Lean both complete; next Wave 3 (T6 first in WATCHER)
- Do not mark L2-L4 or Wave 3 Names as this implementer's product Lean work
- SESSION-HANDOFF Active open updated
