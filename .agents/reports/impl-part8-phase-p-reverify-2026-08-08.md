# Implement report -- Part 8 Phase P re-verify (2026-08-08)

ASCII only. Plain American English.
IMPL_ID: 0854727a. Role: implementer (role-swapped vs Part 7; re-verify only).

## Goal

Re-verify Phase P inventories polish + residual lockstep + CompCert process-banner
scrub Done when still holds after Parts 1-7 and program close. Scrub living lag
only. Do not invent Open Names. Do not forge free/complete/PROVABLY/FullHost/full
llvm backend. Do not grow near-1000 companions past Sub-1-KLOC without a role split.

## Done when (re-check)

| # | Item | Result |
|---|------|--------|
| 1 | Inventory honesty | **met** -- free-bar / host-partial / llvm / dual-gap living tips match residual pins; Kind honesty intact |
| 2 | Plans + residual + handoff + WATCHER lockstep | **met** -- D/M/C/B/L/P closed; Open empty done-for-now; no invent empty-queue theater |
| 3 | CompCert just-banner scrub | **met** -- `just/compcert.just` has no stale "not PROVABLY" / "provablyUnlocked must stay false"; matrix GREEN PROVABLY wording OK |
| 4 | `just hygiene` | **met** -- exit **0** |
| 5 | Durable re-verify report | **met** -- this file |
| 6 | Part cites | **met** -- plan-remaining Phase P + session plan Part 8 + RESIDUAL-systems program P + WATCHER cite Part 8; DONE-FOR-NOW; no implement slash-command in WATCHER fence |
| 7 | Standing headroom | **met** -- no companion growth this pass (line counts stay under bar) |

## Honesty pins (product claims; no flips this pass)

| Claim | Living tip |
|-------|------------|
| free / complete / PROVABLY | **true** |
| product Lake pins | **false** |
| host free | **claimed** (F1) |
| FullHostElaborateRemains | **false** |
| proofCompleteClaimed | **true** |
| llvmUnlocked | **true** (not full backend) |
| Mult SSA partial | **done** (not full backend) |
| seed / harness | modules=**206**, harness=**28** |

Verified against product Lean greps (`DualResidual` free claimed true / remains false;
`LlvmHold.llvmUnlocked` true) and residual living tips. No claim-bool edits.

## Inventories spot-check (already honest; content scrub not required)

| Surface | Tip |
|---------|-----|
| `doc/dev/research/host-residual-free-bar-inventory-2026-08-07.md` | Phase P living reseed: F1 claimed; Mult SSA partial; program closed; pre-F1 body archaeology with living tip wins |
| `src/systems/host-partial-inventory.md` | DualResidual + HOST-DUAL-RESIDUAL living tip Phase P: free claimed F1; Mult SSA partial; seed=206 harness=28 |
| `doc/dev/research/llvm-backend-deepen-inventory-2026-08-08.md` | Mult SSA **done**; full backend unclaimed; seed/harness honesty |
| `doc/dev/research/dual-gap-inventory-2026-08-08.md` | FailClosedGrade dual floor; Rank 1 **done**; living claim pins true/claimed |

No stale living "host free open" / "SSA not done" / wrong dual count. Full backend
still held distinct from Mult SSA partial.

## Lag scrubbed this pass (lockstep cite only)

| Surface | Lag | Fix |
|---------|-----|-----|
| `.agents/plans/plan-remaining-residual-2026-08-08.md` Phase P | "this reseed" only | Part 8 re-verify status + report path |
| Session plan Part 8 + rank table Phase P | no re-verify status | Status re-verify GREEN + Done when re-check table; rank row Part 8 cite |
| `RESIDUAL-systems.md` program P + Done archive Phase P | done without Part 8 cite | Part 8 re-verify cite |
| `WATCHER.md` | missing Part 8 report | cite re-verify report; stay DONE-FOR-NOW |

Plans `plan-north-star-remaining.md` / `plan-slake-replaces-lake.md`, handoff living
tips, and coordinator `RESIDUAL.md` already agreed on program closed + honesty pins;
no content scrub needed beyond Part 8 cite path on the Phase P owners above.

## Verification

| Check | Result |
|-------|--------|
| `just hygiene` | exit **0** (source-hygiene OK; professional-tone OK) |
| `rg 'not PROVABLY\|provablyUnlocked must stay false' just/compcert.just` | **no matches** |
| `rg '/implement' WATCHER.md` | **no matches** (DONE-FOR-NOW fence clean) |
| Product Lean claim flips | **none** |
| git add / commit / push | **none** |
| Open Names invented | **none** |
| Full backend / FullHost / free re-open forge | **none** |
| New CompCert matrix row | **none** (not required) |

## Files changed (lag + lockstep only)

- `.agents/plans/plan-remaining-residual-2026-08-08.md`
- Session plan Part 8 + rank table Phase P
- `RESIDUAL-systems.md` (program P row + Done archive Phase P)
- `WATCHER.md`
- This report

No product Lean. No Nix gate body change. No inventory body rewrite. No new residual
Open Names.

## Residual / watcher

- Open **empty done-for-now**
- WATCHER: DONE-FOR-NOW; Part 8 re-verify report cited
- No implement slash-command next (held-only Open; program D/M/C/B/L/P closed)

## Non-claims (unchanged living tip)

- free / complete / PROVABLY **true** (not flipped this slice)
- host free **claimed** F1; FullHostElaborateRemains **false**
- llvmUnlocked **true** (not full backend); Mult SSA **partial** only
- Not full CFG/dominance production pipeline; not Rust-native link
- Not full elaborator / mathlib parity; further duals held
- seed modules=**206** harness=**28** (not host seed expand)
- Standing: Sub-1-KLOC; FixtureTextsLater ~999 / Walk ~999 / LoadOk ~995

## Standing headroom (line counts; unchanged this pass)

| Companion | ~Lines |
|-----------|--------|
| free-bar inventory | 263 |
| host-partial-inventory | 569 |
| llvm-backend-deepen inventory | 54 |
| dual-gap inventory | 157 |

All under Sub-1-KLOC. No growth this pass.

## TDD

Pure re-verify / docs lockstep. TDD red/green exempt (no product behavior change).

## SCORE

fail=0. GREEN. Done when still holds. Lockstep lag fixed.

SPDX-License-Identifier: Unlicense
