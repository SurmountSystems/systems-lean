# LinearTheorems L3 PROOF-SURFACE gap table

Kind: analysis only. Not residual.

Date: 2026-08-09. Living SSOT: `src/systems/SystemsLean/LinearTheorems.lean`.
Pattern peer: MultTheorems L3 (`HostModuleCheckMultProof`).

## Goal of this pilot

Document which LinearTheorems theorem statements and proof bodies the host
module check must accept or reject at **PROOF-SURFACE** depth for
**LinearTheorems-only**, while L0/L1 structural token checks still accept
ill-typed twins.

## Living LinearTheorems surface (read from disk)

| Theorem | Statement (collapsed) | Body | L3 pilot? |
|---------|----------------------|------|-----------|
| shareNat_eq | shareNat n = n + n | rfl | no (binders; L0 only) |
| shareNat_zero | shareNat 0 = 0 | rfl | **yes** (statement + body) |
| shareNat_succ | shareNat (n + 1) = (n + 1) + (n + 1) | rfl | no |
| shareNat_reuse | shareNat (shareNat n) = (n + n) + (n + n) | rfl | no |
| polyId_id | polyId x = x | rfl | no (type binder) |
| polyId_compose | polyId (polyId x) = x | rfl | no |
| polyId_nat | polyId n = n | rfl | no |
| roundTrip_eq | roundTrip n = consume (mkToken n) | rfl | no |
| mult0ClassId_eq | mult0ClassId = "MULT-0" | rfl | **yes** (statement + body) |
| mult1ClassId_eq | mult1ClassId = "MULT-1" | rfl | no |
| multOmegaClassId_eq | multOmegaClassId = "MULT-OMEGA" | rfl | no |
| linearExactOnceId_eq | linearExactOnceId = "LINEAR-EXACT-ONCE" | rfl | no |
| linearAxiomsRemainId_eq | linearAxiomsRemainId = "LINEAR-AXIOMS-REMAIN" | rfl | no |
| affineNotFirstClassId_eq | affineNotFirstClassId = "AFFINE-NOT-FIRST-CLASS" | rfl | no |
| linearAxiomInventoryOk_true | linearAxiomInventoryOk = true | by decide | no (tactic; L0 only) |

L0 required decls (12 names) stay token presence only for non-pilot theorems.

## Documented L3 dialect (not full Lean 4 tactic elaborator)

1. **shareNat_zero**: statement must contain `shareNat 0 = 0` and must not be
   bare `True`; proof body after `:=` must be exactly `rfl` (reject `by sorry`
   / `trivial`).
2. **mult0ClassId_eq**: statement must cite `mult0ClassId` and `MULT-0` and must
   not be bare `True`; proof body exactly `rfl`.

Reject reason: **ILL-TYPED-PROOF** (shared string with MultTheorems L3).

## Twins (RED / GREEN design)

| Twin | Mutation | L0/L1 | L3 |
|------|----------|-------|-----|
| P1 | shareNat_zero statement `True := trivial` | accept | ILL-TYPED-PROOF |
| P2 | shareNat_zero body `by sorry` with correct type | accept | ILL-TYPED-PROOF |
| E-good | well-typed shareNat_zero + mult0ClassId_eq rfl | accept | accept |
| Real disk | LinearTheorems.lean | accept | accept |

RED honesty: L0/L1 still accepts P1/P2 when theorem names are present
(dual-pin L0Accept). GREEN gate is `hostModuleCheckLinearProofSurfaceOk`
(SurfaceOk fold: dialect good + P1/P2 dialect reject + L0Accept), not bare
dualOk alone.

## Dual-ok pins (target after implement)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| hostModuleCheckLinearProofSurfaceDualOk | LinearTheorems-only claim | **true** |
| hostModuleCheckLinearProofSurfaceOk | LinearTheorems-only **gate** | **true** |
| TERM-SURFACE Mult..Extract | Mult-only .. Extract-only | **unchanged** |
| FullHostElaborateRemains | package | **false** |

## Out of scope

- TypesTheorems L3; package elaborate L4; free/complete/PROVABLY/FullHost flips
- full elaborator / mathlib parity; tactic scripts / goals
- product C / shell
