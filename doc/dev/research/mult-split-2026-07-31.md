<!--
  Kind: analysis only. Not residual.
  Mult long-file split inventory (2026-07-31).
-->

# Mult long-file split (2026-07-31)

## Sizes

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/Mult.lean` | 184 | **90** (-94) |
| `src/systems/SystemsLean/MultTheorems.lean` | (new) | **148** |

Parent strictly decreased. Under 500.

## Seam

**MultTheorems** (same namespace `SystemsLean.Mult`).

| Parent keeps | Theorems module holds |
|--------------|----------------------|
| `Mult` inductive | `ofNat?_zero` / `_one` / `_two` |
| `name` | `ofNat?_fail_closed` / `isValidTag_fail_closed` |
| `isValid` / `multIsValid` | `isValid_true` / `multIsValid_eq_isValid` |
| `ofNat?` / `isValidTag` | `name_mult0` / `_mult1` / `_multOmega` |
| | `ofNat?_some_implies_isValidTag` |
| | `ofNat?_name_zero` / `_one` / `_two` / `_fail_closed` |
| | known-tag `isValidTag_*` pins |

Coherent MULT-THEOREM / HOST-MULT-THEOREM block only. No half-file cut.
No stitch markers. No `/tmp` full-file rewrite.

## Dependents

- `SystemsLean.lean` imports `MultTheorems` after `Mult`.
- `TypesTheorems.lean` imports `MultTheorems` (uses `Mult.ofNat?_fail_closed`).
- Host presence: `host-leans.nix`, `required-files.nix`, `host-specs-core.nix`,
  `specs.nix` root import list.
- README + host-partial-inventory Mult rows updated.

## Gates

- `lake build SystemsLean.Mult SystemsLean.MultTheorems SystemsLean.TypesTheorems` green
- `just hygiene` green
- `just systems-host` green
- Tip SelfApplyFs not touched
- Claims: complete true; free/llvm/PROVABLY false unchanged

## Next cold primary

**ProductPathWriterPathExec** at **169** (never-split; theorem/smoke capable).
