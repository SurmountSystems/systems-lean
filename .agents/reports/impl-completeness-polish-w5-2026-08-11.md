# Implement report: Completeness polish (W5)

**Date:** 2026-08-11
**Status:** GREEN
**Name:** Completeness polish (docs benchmarks proof prose)

## Goal

Living docs lockstep after W1 package-env Mult..ParityEmit and W3 TERM harness 61.
Optional cheap bench. Plain English done/not-done. Proof honesty without claim flips.

## Paths lockstep (edited)

| Path | Change |
|------|--------|
| `README.md` | harness **59->61**; item 9 done vs still open; item 10 proof honesty; prove-it renumbered 11 |
| `doc/goals.md` | harness **61**; Done / Still open / Proof honesty rows |
| `doc/SESSION-HANDOFF.md` | mid living tip package-env + harness **61**; Active open **W2 only** (W5 done); mid residual summary |
| `RESIDUAL-systems.md` | Next product work + Living Open + Open queue; W5 Open->done; Done archive row; next fence W2 |
| `RESIDUAL.md` | Systems Open join harness **61** + W5 done; What remains / Highest value; Open Names W5 done; Done archive; self-validation harness partition **61** |
| `WATCHER.md` | W5 closed; next action **W2** only |
| `.agents/reports/impl-completeness-polish-w5-2026-08-11.md` | This report |

**Not rewritten:** `doc/BENCH-RUNTIME-latest.md`, `doc/BENCH-latest.md` (no full suite re-run this slice).

## Plain English done / not-done

**Done (pilots closed this wave and earlier foundation):**

- freestanding free + complete + PROVABLY **true**
- host free **claimed** under free bar (a); FullHostElaborateRemains **false**
- package-env Mult through **ParityEmit** (Env-only pilots; PackageEnv 954 / Fixtures 802)
- ParityMult + ParityLinear + ParityTypes + ParityProgram + ParityEmit TERM dual-ok (harness **61**)
- multiUnit Mult..Graph DF deepen **true**
- W4/T4 LLVM honesty hold: DominanceClaimed **false**; band FullBackend **false**
- W5 completeness polish (this report)

**Still open / not claimed:**

- **W2** FullHost meet flip-or-partial (Phase B; Phase A FULLHOST_FLIP=no)
- H2 package-env still **partial** vs seed **206** (pilots Mult..ParityEmit, not seed-wide)
- FullHostElaborateRemains stays **false** until bar + lake
- DominanceClaimed **false**; band FullBackend **false**
- full Lean 4 / mathlib elaborator parity = non-goal day one
- freestanding product affine ABI held; host UX out of this repo

## Proof honesty

| Pin | Meaning after W5 |
|-----|------------------|
| `proofCompleteClaimed` | **true** -- Track 4c SpecProof / theorems bar met with lake evidence |
| Full elaborator parity | **not** claimed; not implied by proofCompleteClaimed |
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **true** (unchanged; no claim flips this Name) |
| DominanceClaimed / band FullBackend | **false** (unchanged) |

## Bench note

| Command | Result |
|---------|--------|
| `just bench-hot-freestanding` | exit **0**; wall ~**0.14s** (cheap compile-path sample; matches prior living A-hot ballpark) |
| `just bench-runtime` | **soft-skip** this slice (full multi-arm runtime suite not re-run; prior living report 2026-08-10 stands: ~6.7x vs Boehm, ~2.8x vs Lean managed, ~4.5x slower vs malloc mint, compose ~2.8x slower) |
| `just bench` full suite | **soft-skip** this slice (same reason) |
| BENCH md rewrite | **none** -- only update with real full-suite numbers |

## Pins table (mandatory; no flips)

| Pin | After W5 |
|-----|----------|
| free / complete / PROVABLY | **true** |
| FullHostElaborateRemains | **false** |
| seed / harness | **206** / **61** |
| package-env | Mult..EmitBody+Kernel Mult..Emit+ParityMult+ParityLinear+ParityTypes+ParityProgram+**ParityEmit** |
| TERM dual-ok | ParityMult+Linear+Types+Program+**Emit** |
| multiUnit Mult..Graph DF deepen | **true** |
| DominanceClaimed | **false** |
| band FullBackend | **false** |
| proofCompleteClaimed | **true** (not full elaborator parity) |

## Commands + exits

| Command | Exit |
|---------|------|
| `just hygiene` (pre-edit baseline) | **0** |
| `just bench-hot-freestanding` | **0** (~0.14s) |
| `just hygiene` (post-edit) | **0** (source-hygiene + professional-tone) |

## Out of scope (honored)

- Product Lean claim flips
- Invent mathlib
- Forge FullHost / DominanceClaimed
- HostModuleCheck product Lean
- git commit

## Residual closeout

- `RESIDUAL-systems.md` W5 **done**
- `RESIDUAL.md` Open Names W5 **done**
- `WATCHER.md` next: **W2** only
- Living tips lockstep on harness 61 and package-env Mult..ParityEmit
