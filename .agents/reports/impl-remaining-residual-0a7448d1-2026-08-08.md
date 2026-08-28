# Report: compile-path bench Phase 2 + residual lockstep

**IMPL:** `0a7448d1`
**Date:** 2026-08-08
**Kind:** implement report (measurement process + residual honesty)
**Status:** GREEN

## Goal

Approved session plan Phase 2 polish: true-hot Lake second pass in primary
`just bench`, plus residual/companion lockstep so living tips match Phase 1+2
compile-path framing. Systems Open remains empty done-for-now. Held tracks stay
held.

## What landed

### 1) Phase 2 -- true-hot Lake second pass

In `just/bench.just` primary suite:

- Scenario order: hot freestanding, without-Lake host, **B-hot first pass**,
  **B-hot second pass** (same recipe `bench-lake-host` twice), CompCert matrix,
  cold freestanding.
- Report Arm B table has both rows.
- Interpretation prefers **B-hot second pass** for B/A ratio when second is ok;
  still notes first pass (and rebuild-heavy when first real > 10 s).
- `bench-lake-host-cold` still skipped by default; suite not destructive.

### 2) Residual / companion lockstep

- `RESIDUAL.md` -- Host finish highest-value + self-validation cite `just bench`
  and `doc/BENCH-latest.md`; evidence points at this report.
- `RESIDUAL-systems.md` -- Plans row for compile-path Phase 1+2; Phase M note;
  Done archive row; Open empty done-for-now.
- `WATCHER.md` -- DONE-FOR-NOW (no `/implement` token).
- `doc/SESSION-HANDOFF.md` -- compile-path bench table row + Next product work.
- `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` -- Phase 2 second-pass note.
- `just/README.md` -- second-pass Lake wording.
- `doc/vocabulary.md` -- **Compile-path bench** term: wall-clock only; not
  PROVABLY; not runtime-fastest-C.

### 3) Living report regenerate

`just bench` exit 0 rewrote `doc/BENCH-latest.md` with full two-arm framing and
both Arm B passes.

## Files changed

See `/tmp/grok-1000/grok-impl-summary-0a7448d1.md` for the path table.

## Verify

| Command | Exit | Notes |
|---------|------|--------|
| `just hygiene` | 0 | ASCII, trailing WS, professional tone |
| `just bench` | 0 | overall ok; wrote `doc/BENCH-latest.md` |

**Report contract (GREEN):** `rg` on `doc/BENCH-latest.md` finds Question, Arm A,
Arm B, B-hot first pass, B-hot second pass; interpretation line uses second pass
for B/A.

This-run headline (horizon, package already Built so first pass was already hot):

| Arm | Scenario | real (s) |
|-----|----------|----------|
| A | hot freestanding | 0.103 |
| A | without-Lake host | 0.834 |
| A | cold freestanding | 0.111 |
| B | B-hot first pass | 0.388 |
| B | B-hot second pass | 0.386 |
| seal | CompCert matrix | 62.323 |

Ratio B/A (second pass / A-hot) ~ **3.7** (different jobs: emit wire vs host
elaborate probe).

## Pin honesty

- free / complete / PROVABLY true (not flipped)
- FullHostElaborateRemains false
- Not PROVABLY-as-speed; not runtime-fastest-C
- Not full elaborator; not full backend; not Rust link
- Open empty done-for-now; held list unchanged

## Residual / WATCHER

- Open: **empty done-for-now**
- WATCHER: DONE-FOR-NOW fence only
- Held: full elaborator/mathlib; Full LLVM production backend; true Rust-native
  link success; AffineDrop dual; mathlib product dependency

## Design notes

- Second pass is an explicit suite scenario, not a wipe or a new cold recipe.
- When the package is already Built, first and second pass look similar; the
  second-pass row still documents the true idle hot probe contract for when the
  first pass is rebuild-heavy.

## Out of scope (not done)

- Token microbench / GC baselines / hand-C loops
- Cold Lake wipe as default suite
- Inventing residual Open for held tracks
- Product claim pin flips

---

## Closeout (2026-08-08)

**Status:** GREEN closeout after fix round + re-review.

| Item | Result |
|------|--------|
| Fix round | Complete; prior review issues Status fixed (research line-count, lake-host banner honesty, residual living tip 0a7448d1 cite) |
| General re-review | **APPROVE**, open **0** -- `.agents/reports/review-remaining-residual-0a7448d1-general-rereview-2026-08-08.md` |
| Plan re-review | **ALIGNED**, open **0** -- `.agents/reports/review-remaining-residual-0a7448d1-plan-rereview-2026-08-08.md` |
| Gates | `just hygiene` exit 0 (closeout pass); `just bench` exit 0 (impl report above) |
| Pin honesty | free / complete / PROVABLY true **not flipped**; FullHostElaborateRemains false; not full elaborator; not full backend; not Rust link; not runtime-fastest-C |
| Open | **empty done-for-now** (no agent-checkable Open Name) |
| Highest-value next | **Held only** (operator promote). Prefer true Rust-native / foreign layout **link success** (out-of-tree consumer) if promote one package; then production CFG/dominance deepen; AffineDrop only if affine opens; optional Phase 3 freestanding product **runtime** microbench (not compile-path tooling times). Do not invent Open Names. |

**Residual lockstep at closeout:** `RESIDUAL.md` Host finish remaining honesty; `RESIDUAL-systems.md` Next product work already cites 0a7448d1 (no lag fix needed); `WATCHER.md` DONE-FOR-NOW with re-review report paths (no `/implement` token).
