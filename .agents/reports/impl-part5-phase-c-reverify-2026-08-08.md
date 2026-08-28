# Implement report -- Part 5 Phase C re-verify (2026-08-08)

ASCII only. Plain American English.
IMPL_ID: 3123c44e. Role: implementer (re-verify only).

## Goal

Re-verify Phase C Curry-Howard dual deepen Done when still holds after first
land. Scrub living lag only. Do not invent a fifth dual. Do not forge
Curry-Howard complete or full isomorphism.

## C1-C4 re-check

| Step | Done when | Result |
|------|-----------|--------|
| C1 | Dual gap inventory research note: ranked next duals; Kind: analysis | **met** `doc/dev/research/dual-gap-inventory-2026-08-08.md` (four dual floor; ranks 2+ held; dual formal map open) |
| C2 | One new dual: real `src/idris2/` + `src/lean4/` + JOIN id + join-map row + gates green | **met** FailClosedGrade both sides; JOIN EX-FAIL-CLOSED; join-map row; JoinMap cite + `failClosedGradeHostUseOk`; dual Nix specs |
| C3 | Surface matrix honesty for new dual; SurfaceMatrix path green when checkable | **met** four dual cites in surface-matrix + SurfaceMatrix.lean `dualCiteOk`; Linear/JOIN-ALG **present-partial**; systems-host green |
| C4 | Optional formal edge | **open** (honest; dual formal map theorems row open; not forged closed) |

## Four JOIN-ALG duals (consistent)

| Algorithm | Idris | Lean |
|-----------|-------|------|
| ConsumeToken | `src/idris2/examples/ConsumeToken.idr` | `src/lean4/examples/ConsumeToken.lean` |
| ErasedIndex | `src/idris2/examples/ErasedIndex.idr` | `src/lean4/examples/ErasedIndex.lean` |
| UnrestrictedShare | `src/idris2/examples/UnrestrictedShare.idr` | `src/lean4/examples/UnrestrictedShare.lean` |
| FailClosedGrade | `src/idris2/examples/FailClosedGrade.idr` | `src/lean4/examples/FailClosedGrade.lean` |

Host: `JoinMap.joinDualCiteOk` + `joinAlgUseOk` (four host-use pins including
`failClosedGradeHostUseOk`). Matrix: dualCiteOk four pairs. Gates:
`nix/idris-side-presence` + `nix/lean-side-presence` list all four.

## Verification (this re-verify)

| Gate | Result |
|------|--------|
| `just hygiene` | exit 0 |
| `just idris-side` | exit 0 (7 required paths) |
| `just lean-side` | exit 0 (10 required paths) |
| `just systems-host` | exit 0 (241 required paths) |
| `just lean-elaborate` | GREEN (lake build lean-side 9 jobs) |
| `just idris-elaborate` | skipped (idris2 not on PATH; recipe exit 0 skip path) |

## Lag scrubbed (this slice)

| Surface | Lag | Fix |
|---------|-----|-----|
| `RESIDUAL-idris.md` | Done / blocked still three duals | Four duals + FailClosedGrade row; further duals **held** |
| `RESIDUAL-lean.md` | Done / blocked / L-LAKE three | Four duals + L-DONE-FAILCLOSED; further duals **held** |
| `RESIDUAL.md` | Done "three dual host uses"; held "three algorithm ids" | Four dual host uses; further duals held beyond four |
| `src/systems/surface-matrix.md` | canary prose "three dual cites" | "four dual cites" |
| `doc/dev/research/dual-gap-inventory-2026-08-08.md` | "Three JOIN-ALG"; "three (or four)"; "Fourth dual" non-gap; post-C2 "when lands" | Four / five / landed re-verify notes |
| `src/systems/self-host-host-surface-archive.md` | land-time "three dual host uses" | note four after Phase C |
| `WATCHER.md` | missing Part 5 report | cite re-verify report |
| Session plan Part 5 | first-land only | status re-verify GREEN + C1-C4 table |
| `plan-remaining-residual-2026-08-08.md` Phase C row | first land only | re-verify cite |
| `doc/SESSION-HANDOFF.md` | no Part 5 re-verify cite | report path |
| `RESIDUAL-systems.md` Phase C Done | first land only | re-verify cite + held duals |

Not scrubbed (historical Kind: analysis only, dated before FailClosedGrade):
`doc/dev/research/superset-surface-inventory-2026-08-03.md` "three JOIN-ALG"
stays as pre-C research. Living inventory is dual-gap 2026-08-08.

## Non-claims (unchanged living tip)

- free / complete / PROVABLY **true** (not flipped this slice)
- host free **claimed**; FullHostElaborateRemains **false**
- llvmUnlocked **true** (not full backend)
- Not Curry-Howard complete; not formal dual-bridge theorems finished
- Not full Idris 2 / Lean 4 elaborator parity
- Further duals (LinearPairSwap, RuntimeExtract, AffineDrop) **held**
- No fifth dual opened

## Files changed (lag + lockstep only)

- `RESIDUAL-idris.md`, `RESIDUAL-lean.md`, `RESIDUAL.md`, `RESIDUAL-systems.md`
- `src/systems/surface-matrix.md`, `src/systems/self-host-host-surface-archive.md`
- `doc/dev/research/dual-gap-inventory-2026-08-08.md`
- `doc/SESSION-HANDOFF.md`
- `WATCHER.md`
- `.agents/plans/plan-remaining-residual-2026-08-08.md`
- Session plan Part 5 status
- This report

No product Lean claim-bool flips. No new dual sources.

## Residual / watcher

- Open **empty done-for-now**
- WATCHER: DONE-FOR-NOW; Part 5 re-verify report cited
- No `/implement` next (held-only Open)

## Prior first land

`.agents/reports/impl-phase-c-dual-deepen-2026-08-08.md`

## Review mop (same day)

Review Issues 1-3 fixed: JoinMapTheorems four-dual smoke + comment;
SurfaceMatrixTheorems FailClosedGrade path smokes; host-partial-inventory
HOST-JOIN-MAP includes `failClosedGradeHostUseOk`. `just hygiene` exit 0;
`lake build SystemsLean.JoinMapTheorems SystemsLean.SurfaceMatrixTheorems`
exit 0. See `/tmp/grok-1000/grok-review-3123c44e.md`.
