<!--
  Kind: analysis only. Not residual.
  Linear long-file split inventory (2026-07-31).
-->

# Linear long-file split (2026-07-31)

## Sizes

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/Linear.lean` | 118 | **92** (-26) |
| `src/systems/SystemsLean/LinearTheorems.lean` | (new) | **71** |

Parent strictly decreased. Under 500.

## Seam

**LinearTheorems** (same namespace `SystemsLean.Linear`).

| Parent keeps | Theorems module holds |
|--------------|----------------------|
| `shareNat` | `shareNat_eq` |
| `Token` axiom | `shareNat_zero` / `shareNat_succ` |
| `mkToken` axiom | `polyId_id` |
| `consume` axiom | `roundTrip_eq` |
| `roundTrip` | |
| `polyId` | |

Coherent LINEAR-THEOREM / HOST-LINEAR-THEOREM block only. No half-file cut.
No stitch markers. No `/tmp` full-file rewrite. Axioms remain on parent
(classic Lean cannot enforce MULT-1 / LINEAR-EXACT-ONCE).

## Dependents

- `SystemsLean.lean` imports `LinearTheorems` after `Linear`.
- Host presence: `host-leans.nix`, `required-files.nix`, `host-specs-core.nix`,
  `specs.nix` root import list.
- README + host-partial-inventory Linear rows updated.
- SelfApplyFs not touched (no Linear import +1 needed).

## Gates

- `lake build SystemsLean.Linear SystemsLean.LinearTheorems` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- complete true; free/llvm/PROVABLY false (emit-wire residual free measure)

## Next

Never-split cold primary chain exhausted after Linear. Open = done-for-now.
Residual free held until free bar met.
