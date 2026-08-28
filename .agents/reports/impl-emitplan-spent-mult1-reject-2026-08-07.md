# Implement report: EmitPlan spent mult1 reject

**Date:** 2026-08-07
**Impl id:** 4d08dd80
**Status:** GREEN

## Goal

On a MULT-1 host after mint then consume (spent live scrub), prove planOk /
planFromCompose fail-closed (readiness reject), net-new vs
`planOk_mult1_minted_true` alone and vs HostCompose spent mult1 reject alone
(EmitPlan readiness layer).

## What landed

### Product Lean (`SystemsLean/EmitPlan.lean`)

- Private fixture `thmHostMult1Spent`: MULT-1 graph node present, linear empty
  (live scrubbed after mint+consume shape; same structure as HostComposeTheorems
  spent fixture; local mirror, not imported).
- Theorems:
  - `planOk_mult1_spent_false` -- planOk spent = false (`by decide`)
  - `planFromCompose_mult1_spent_failClosed` -- zeroed inventory
    (`!valid && !ready && counts 0`) like unminted failClosed (`by decide`)
  - `planOk_mult1_spent_reject` -- conjunction: consume minted equals ok spent
    payload 1 + planOk false + fail-closed zeroed plan (`And.intro rfl ...`)
- Module header theorem list + greppable EMIT-PLAN-THEOREM /
  HOST-EMIT-PLAN-THEOREM tokens updated.
- SpecProof header cite list mentions spent theorem names (still refuses
  complete flip).

### Pure Nix presence

- `nix/systems-host-presence/host-specs-core-1.nix` EmitPlan `all` list:
  short names + `theorem ...` forms for the three new theorems.

### Residual lockstep

- `RESIDUAL-systems.md`: Open moved to **EmitBody spent mult1 reject**; Done
  archive row for EmitPlan spent; tip line updated.
- `WATCHER.md`: next `/implement` for EmitBody spent mult1 reject.
- `doc/SESSION-HANDOFF.md`: Active / Next / recommended Name.
- `RESIDUAL.md`: Systems Open join, What remains, ranked table, EmitPlan
  theorems row, Done archive join row.
- `src/systems/surface-matrix.md`: SpecProof tip Open Name.
- `src/systems/host-partial-inventory.md`: EmitPlan theorem list.
- `doc/dev/research/proof-complete-inventory-2026-08-07.md`: EmitPlan spent
  closed; living primary EmitBody spent.

## Gates (ran)

| Command | Exit |
|---------|------|
| `lake build SystemsLean.EmitPlan` (from `src/systems`, elan lake) | **0** |
| `just systems-host` | **0** (218 required paths) |
| `just hygiene` | **0** |

## Non-claims (unchanged)

- `proofCompleteClaimed` **false** (`def proofCompleteClaimed : Bool := false`)
- free / complete / PROVABLY true; product Lake pins false
- host free claimed F1; FullHostElaborateRemains false
- not elaborator MULT-1; not Track 4c complete flip
- no product C or shell growth

## Next Open Name

**EmitBody spent mult1 reject** -- bodyOk false after mint+consume; mirrors
plan spent after compose.

## SCORE

fail=0
