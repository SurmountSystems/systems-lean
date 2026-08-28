# Implement report: Part 4 Phase M benchmarks re-verify (2026-08-08)

## Goal

Re-verify Phase M Done when still holds after Phases C/B/L/P and Parts 1-3.
Scrub lag only. No Open invent. No claim-bool flips. No cold `.lake` wipe.

## Done when (re-check)

| # | Item | Status |
|---|------|--------|
| 1 | Durable research note with methods, machine, commands, tables | **met** -- `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` (sections 1-6 + first-land tables 4.x; re-verify sample section 11) |
| 2 | Thin just timing recipes (no Python; Sub-1-KLOC) | **met** -- `just/bench.just` ~151 lines; root `justfile` imports; `just/README.md` map row |
| 3 | Results recorded in the note | **met** -- first-land numbers + re-verify hot sample |
| 4 | Wipe = trash / ordered recovery (not rimraf) | **met** -- cold freestanding and optional cold Lake use dated `/tmp` mv only; A65 recovery cited; this re-verify did not wipe `.lake` |
| 5 | Explicit non-claims | **met** -- note section 8 (Mult SSA partial + CompCert banner honesty scrubbed this pass) |

## Recipe inventory (no drift)

| Recipe | Listed in note | `just --list` | Role |
|--------|----------------|---------------|------|
| `bench-hot-freestanding` | yes | yes | Time `just build` hot |
| `bench-cold-freestanding` | yes | yes | Trash generated wire; rebuild |
| `bench-without-lake-host` | yes | yes | Import-graph + module-check + package-roots |
| `bench-lake-host` | yes | yes | Hot `lake build` |
| `bench-lake-host-cold` | yes (optional) | yes | Trash `.lake`; full cold (not re-run) |
| `bench-compcert-matrix` | yes | yes | CompCert matrix wall-clock (not re-run) |
| `bench-phase-m` | yes | yes | Short suite menu (skips cold lake) |

Dependencies present: `host-import-graph-without-lake`, `host-module-check-without-lake`,
`host-package-roots-without-lake`, `product-compcert-matrix`.

## Lag fixed this pass

| Lag | Fix |
|-----|-----|
| Mult SSA partial not in bench note living tip | Living tip + machine tip + non-claim 5 name Mult SSA partial done (not full backend) |
| Non-claim 8 implied CompCert just banners still say "not PROVABLY" | Phase P scrubbed `just/compcert.just`; non-claim 8 now says living CompCert banners OK; freestanding/without-Lake driver stdout may still lag; residual wins |
| Package-roots vs seed module count under-described | Note section 4.3: seed=206 vs package-roots library walk (re-verify 296) |
| Plan / WATCHER first-land only for Part 4 | Session plan Part 4 Status re-verify DONE; plan-remaining Phase M row; WATCHER cites re-verify report |
| No re-verify sample timings | Note section 11 lightweight hot sample |

## Re-verify sample (lightweight hot only)

| Recipe | real (s) | Exit |
|--------|----------|------|
| `just bench-hot-freestanding` | 0.085 | 0 |
| `host-import-graph-without-lake` | 0.217 | 0 |
| `host-module-check-without-lake` | 0.672 | 0 |
| `host-package-roots-without-lake` | 0.023 | 0 |

Logs: `/tmp/grok-1000/bench-reverify-hot-fs-2026-08-08.log`,
`/tmp/grok-1000/bench-reverify-wol-2026-08-08.log`.

First-land headline numbers (unchanged authority for cold Lake / CompCert / cold FS):

| Scenario | real (s) |
|----------|----------|
| Hot freestanding | 0.087-0.123 (re-verify 0.085) |
| Cold freestanding | 0.083 |
| Without-Lake suite | ~0.96 sum |
| Lake rebuild-heavy | 259.136 |
| Lake true hot | 0.453 |
| CompCert matrix | 72.503 |
| Cold full Lake | cite 2026-08-01 ~828-878 s (not re-timed) |

## Files touched

| Path | Change |
|------|--------|
| `doc/dev/research/hot-cold-benchmarks-2026-08-08.md` | Mult SSA tip; non-claims; package-roots honesty; section 11 re-verify sample |
| `just/bench.just` | Header non-claim Mult SSA partial (no recipe body change) |
| `.agents/plans/plan-remaining-residual-2026-08-08.md` | Phase M re-verify pointer |
| Session plan Part 4 | Status re-verify DONE + rank table |
| `WATCHER.md` | Cite Part 4 re-verify report; stay DONE-FOR-NOW (no `/implement`) |
| `.agents/reports/impl-part4-phase-m-reverify-2026-08-08.md` | This report |

Unchanged product Lean. No git add/commit.

## Non-claims (unchanged product pins)

- Freestanding product C != classic Lean managed-runtime AOT C
- Without-Lake host tools != full elaborator parity; FullHostElaborateRemains **false**
- free/complete/PROVABLY **true**; host free **claimed** F1; product Lake pins **false**
- llvmUnlocked **true** + Mult SSA **partial** != full LLVM backend
- Cold full Lake not re-measured this re-verify

## Verification

| Check | Result |
|-------|--------|
| `just --list` bench recipes | all seven present |
| `wc -l just/bench.just` | ~151 (Sub-1-KLOC) |
| `just bench-hot-freestanding` | exit 0 |
| `just bench-without-lake-host` | exit 0 |
| `just hygiene` | exit **0** (source-hygiene OK; professional-tone OK) |
| Product Lean claim flips | none |
| git add/commit | none |
| Open Names invented | none |

## TDD

Pure docs / measurement re-verify. TDD red/green exempt (no product behavior change).

SPDX-License-Identifier: Unlicense
