# Implement report: EmitBody spent mult1 reject

**Date:** 2026-08-07
**Impl id:** ae85441d
**Status:** GREEN

## Goal

On a MULT-1 host after mint then consume (spent live scrub), prove bodyOk /
bodyFromCompose fail-closed (body readiness reject), net-new vs
`bodyOk_mult1_minted_true` alone and vs EmitPlan spent mult1 reject alone
(EmitBody readiness layer).

## What landed

### Product Lean (`SystemsLean/EmitBody.lean`)

- Private fixtures `thmHostMult1Minted` / `thmHostMult1Spent`: MULT-1 graph node
  present; spent has linear empty (live scrubbed after mint+consume shape; local
  mirror of EmitPlan / HostCompose spent; not imported).
- Theorems:
  - `bodyOk_mult1_spent_false` -- bodyOk spent = false (`by decide`)
  - `bodyFromCompose_mult1_spent_failClosed` -- zeroed fail-closed body
    (`!valid && len 0 && counts 0 && markers false`) (`by decide`)
  - `bodyOk_mult1_spent_reject` -- conjunction: consume minted equals ok spent
    payload 1 + bodyOk false + fail-closed zeroed body (`And.intro rfl ...`)
- Module header theorem list + greppable EMIT-BODY-THEOREM /
  HOST-EMIT-BODY-THEOREM tokens updated.
- SpecProof header cite list mentions spent theorem names (still refuses
  complete flip).
- File stays under 1000 lines (~537).

### Pure Nix presence

- `nix/systems-host-presence/host-specs-core-2.nix` EmitBody `all` list:
  short names + `theorem ...` forms for the three new theorems.

### Residual lockstep

- `RESIDUAL-systems.md`: Open moved to **Proof complete residual** (Track 4c);
  Done archive row for EmitBody spent; tip + Decisions recommended Name.
- `WATCHER.md`: next `/implement` for Proof complete residual.
- `doc/SESSION-HANDOFF.md`: Active / Next / recommended Name.
- `RESIDUAL.md`: Systems Open join, What remains, ranked table, EmitBody
  theorems row, Done archive join row.
- `src/systems/surface-matrix.md`: SpecProof tip Open Name.
- `src/systems/host-partial-inventory.md`: EmitBody theorem list.
- `src/systems/extract.md`: EMIT-BODY-THEOREM row.
- `doc/dev/research/proof-complete-inventory-2026-08-07.md`: EmitBody spent
  closed; living primary Proof complete residual (Track 4c).

## Gates (ran)

| Command | Exit |
|---------|------|
| `lake build SystemsLean.EmitBody` (from `src/systems`, elan lake) | **0** |
| `just systems-host` | **0** (218 required paths) |
| `just hygiene` | **0** |

## Non-claims (unchanged)

- `proofCompleteClaimed` **false** (`def proofCompleteClaimed : Bool := false`)
- free / complete / PROVABLY true; product Lake pins false
- host free claimed F1; FullHostElaborateRemains false
- not elaborator MULT-1; not Track 4c complete flip (opened as residual only)
- no product C or shell growth

## Next Open Name

**Proof complete residual** -- Track 4c pin flip only with named inventory bar +
SpecProof rewrite so ready allows complete true + lake elaborator proof +
lockstep. Do not forge complete on inventory alone.

## SCORE

fail=0
