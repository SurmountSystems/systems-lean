# TypesTheorems L3 PROOF-SURFACE gap table

Kind: analysis only. Not residual.

Date: 2026-08-09. Living SSOT: `src/systems/SystemsLean/TypesTheorems.lean`.
Pattern peers: MultTheorems L3 (`HostModuleCheckMultProof`); LinearTheorems L3
(`HostModuleCheckLinearProof`).

## Goal of this pilot

Document which TypesTheorems theorem statements and proof bodies the host
module check must accept or reject at **PROOF-SURFACE** depth for
**TypesTheorems-only**, while L0/L1 structural token checks still accept
ill-typed twins.

## Living TypesTheorems surface (read from disk)

| Theorem | Statement (collapsed) | Body | L3 pilot? |
|---------|----------------------|------|-----------|
| ofKindTag?_zero | ofKindTag? 0 = some NodeKind.value | rfl | **yes** (statement + body) |
| ofKindTag?_one | ofKindTag? 1 = some NodeKind.linear | rfl | no |
| ofKindTag?_two | ofKindTag? 2 = some NodeKind.erased | rfl | no |
| ofKindTag?_fail_closed | ofKindTag? n = none (n > 2) | by cases... | no (tactic; L0 only) |
| isValidKindTag_eq_ofKindTag?_isSome | isValidKindTag n = (ofKindTag? n).isSome | rfl | no (binder) |
| isValidKindTag_zero | isValidKindTag 0 = true | rfl | **yes** (statement + body) |
| isValidKindTag_one | isValidKindTag 1 = true | rfl | no |
| isValidKindTag_two | isValidKindTag 2 = true | rfl | no |
| isValidKindTag_fail_closed | isValidKindTag n = false (n > 2) | by unfold... | no |
| kindMultOk_value_omega | kindMultOk NodeKind.value Mult.multOmega = true | rfl | no (L0 only this pilot) |
| kindMultOk_linear_one | kindMultOk NodeKind.linear Mult.mult1 = true | rfl | no |
| kindMultOk_erased_zero | kindMultOk NodeKind.erased Mult.mult0 = true | rfl | no |
| kindMultOk_* mismatch family | ... = false | rfl | no |
| mkNode?_mismatch_none / mkNode?_ok | Option paths | by unfold... | no |
| expectedMult_value / linear / erased | expectedMult = Mult.* | rfl | no |
| isWellTyped_eq_kindMultOk | n.isWellTyped = kindMultOk ... | rfl | no |
| mkNodeFromTags?* family | Option / some node | by / rfl | no |

L0 required decls (14 names in `typesTheoremsRequiredDecls`) stay token presence
only for non-pilot theorems. Note: L0 good fixture text may use `True := trivial`
for some non-pilot required names; pilot pair stays well-typed in that fixture.

## Documented L3 dialect (not full Lean 4 tactic elaborator)

1. **ofKindTag?_zero**: statement must contain
   `ofKindTag? 0 = some NodeKind.value` and must not be bare `True`; proof body
   after `:=` must be exactly `rfl` (reject `by sorry` / `trivial`).
2. **isValidKindTag_zero**: statement must contain `isValidKindTag 0 = true` and
   must not be bare `True`; proof body exactly `rfl`.

Reject reason: **ILL-TYPED-PROOF** (shared string with MultTheorems / LinearTheorems L3).

## Twins (RED / GREEN design)

| Twin | Mutation | L0/L1 | L3 |
|------|----------|-------|-----|
| P1 | ofKindTag?_zero statement `True := trivial` | accept | ILL-TYPED-PROOF |
| P2 | ofKindTag?_zero body `by sorry` with correct type | accept | ILL-TYPED-PROOF |
| E-good | well-typed ofKindTag?_zero + isValidKindTag_zero rfl | accept | accept |
| Real disk | TypesTheorems.lean | accept | accept |

RED honesty: L0/L1 still accepts P1/P2 when theorem names are present
(dual-pin L0Accept). GREEN gate is `hostModuleCheckTypesProofSurfaceOk`
(SurfaceOk fold: dialect good + P1/P2 dialect reject + L0Accept), not bare
dualOk alone.

## Dual-ok pins (target after implement)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| hostModuleCheckLinearProofSurfaceDualOk | LinearTheorems-only claim | **true** (unchanged) |
| hostModuleCheckTypesProofSurfaceDualOk | TypesTheorems-only claim | **true** |
| hostModuleCheckTypesProofSurfaceOk | TypesTheorems-only **gate** | **true** |
| TERM-SURFACE Mult..Extract | Mult-only .. Extract-only | **unchanged** |
| FullHostElaborateRemains | package | **false** |

## Out of scope

- package elaborate L4; free/complete/PROVABLY/FullHost flips
- full elaborator / mathlib parity; tactic scripts / goals
- product C / shell
- remaining *Theorems L3 pilots beyond TypesTheorems this slice
