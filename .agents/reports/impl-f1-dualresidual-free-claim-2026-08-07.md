# Implement report: DualResidual free claim (F1)

ASCII only. Date: 2026-08-07. IMPL_ID: 85dd02d1.

Kind: product claim flip (host elaborator residual free dual-ok).

Design SSoT: `doc/dev/research/host-free-dual-ok-design-2026-08-07.md`
Inventory: `doc/dev/research/host-residual-free-bar-inventory-2026-08-07.md`

---

## Outcome

Host elaborator residual free is **claimed** under free bar choice (a) with
free-shape dual-ok. Product residual free / complete / PROVABLY and product Lake
pins unchanged. FullHostElaborateRemains stays **false**. Diagnostic Lake recipes
remain **true**. Open empty (done-for-now).

| Pin | After F1 |
|-----|----------|
| `hostElaboratorResidualRemains` | **false** |
| `hostElaboratorResidualFreeClaimed` | **true** |
| `hostResidualShrinkHostElaborateRemains` | **false** |
| `hostResidualShrinkHostFreeClaimed` | **true** |
| `hostResidualShrinkFullHostElaborateRemains` | **false** |
| `hostResidualShrinkDiagnosticLakeRecipesRemain` | **true** |
| `residualFreeClaimed` (product) | **true** |
| `productResidualRemains` | **false** |
| Product StillUsesLake / DependsOnLake | **false** |
| HostPackageWrite stillUsesLake / dependsOnLake | **true** (bootstrap) |

---

## What changed

### DualResidual free dual-ok

- Tip pins flipped (remains false / free true).
- Token reseed to `"host elaborator residual free"` with dual-update of
  `dualResidualSurfaceOk` and `dualResidualSurfacesDistinct`.
- `dualResidualReady` free-polarity only; product measure + complete conjuncts kept.
- `dualResidualDoesNotForgeHostFree` free-honest body (name kept for greps).
- Theorems/smokes free-shape (`hostElaboratorResidualRemains_false`,
  `hostElaboratorResidualFreeClaimed_true`).

### HostResidualShrink free dual-ok

- Mirror pins remains false / free true.
- Free-polarity inverted on: `hostLibraryBandCompleteDualOk`,
  `hostDevelopToolInventoryClosedDualOk`, keeps, ready, freeIsNotLakeGone,
  doesNotMeanHostFree.
- Theorems renamed free-shape; `claims_false` drops host-free conjunct.
- FullHost stays false; diagnostic remain true; partial shrink historical true.

### Gates

- `just/host.just` host-residual-shrink free-tip greps + forge bans.
- `just/subset-join.just` lake-retire-inventory DualResidual free-tip greps.
- Pure Nix `host-specs-hold-close.nix` DualResidual + Theorems free-shape.
- Pure Nix `host-specs-compile-path-3.nix` HostResidualShrink free-shape.

### Surface / residual

- `surface-matrix.md` Host residual free row **measured**.
- Residual Open empty; Done archive F1; WATCHER done-for-now; handoff + plan tip.

---

## Proof surface

```
lake build SystemsLean.DualResidual SystemsLean.DualResidualTheorems SystemsLean.HostResidualShrink
# exit 0
just host-residual-shrink   # exit 0
just systems-host           # exit 0
just hygiene                # exit 0
just lake-retire-inventory  # exit 0
```

---

## Non-claims (still honest)

- Not product residual free re-open.
- Not delete Lake.
- Not full Lean 4 / mathlib elaborator parity.
- Not proof complete (`proofCompleteClaimed` false).
- Not full llvm backend.
- Not re-true FullHostElaborateRemains.

---

## Summary file

`/tmp/grok-1000/grok-impl-summary-85dd02d1.md`

---

## Review lockstep fix (living residual lag after F1)

Review: `/tmp/grok-1000/grok-review-85dd02d1.md` (Issues 1-5, 8 fixed; 6, 7, 9
wontfix). Free tip pins **unchanged** (remains false / free claimed true /
FullHost false / product free true). No DualResidual re-flip.

### Living surfaces reseeded
- `RESIDUAL-systems.md` -- Focus, Section-4 free bar, plan table, M6 living row
- `RESIDUAL.md` -- living tip wins, Highest value next, Validation gates, Claim A
- `src/systems/self-host.md` -- living tip table, pin table, DualResidual map
- `LakeRetireInventory.lean` -- header/comments only; local remains true
- `DualResidual.lean` -- header complete true nit
- `surface-matrix.md` -- non-claims host free claimed (row already measured)
- `doc/SESSION-HANDOFF.md` -- Living tip F1 + Product program
- `.agents/plans/plan-slake-replaces-lake.md` -- section 0 body + layers tip

### Wontfix
- HostResidualShrink 1260 lines long-file residual debt (no full split)
- emit banner "host elaborator residual remains" (design F1 out of scope)
- optional named free dual-ok (inline design-allowed)

### Gates
`just hygiene` exit 0; `just host-residual-shrink` exit 0 (free tip green).

---

## Review lockstep fix round 2 (R2-1..R2-4)

Review: `/tmp/grok-1000/grok-review-85dd02d1.md` (all R2 open fixed). Free tip pins
unchanged.

| Issue | Fix |
|-------|-----|
| R2-1 | `surface-matrix.md` living claim tip: host free claimed / remains false / FullHost false; product free distinct |
| R2-2 | `RESIDUAL-systems.md` Decisions Still false / Recommended next / Highest value next: F1 done; Open empty done-for-now |
| R2-3 | `RESIDUAL.md` second Highest value next prose: same free claimed done-for-now |
| R2-4 | `self-host.md` SelfHostBody process + archive living tip voice; host free claimed |

Gates: `just hygiene` exit 0; `just host-residual-shrink` exit 0.
