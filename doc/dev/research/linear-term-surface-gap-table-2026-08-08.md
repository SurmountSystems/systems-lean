# Linear term-surface gap table (2026-08-08)

Kind: analysis only. Not residual invent beyond the named queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not mathlib product dependency. Not full classic Lean 4 package typecheck claim.

ASCII only. Plain American English. Date: 2026-08-08.

**Program slice:** Linear term-surface pilot (IMPL **d13c73db**) after Mult L2
TERM-SURFACE Mult-only and MultTheorems L3 PROOF-SURFACE MultTheorems-only.

**Prior (do not re-run from zero):**

| Artifact | Role |
|----------|------|
| `mult-term-surface-gap-table-2026-08-08.md` | Mult L2 gap table pattern |
| `real-elaborator-judgments-design-2026-08-08.md` | L0-L4 layers; L2 = TERM-SURFACE |
| `HostModuleCheckMultTerm.lean` | Living Mult L2 dialect (J5/J6) |
| `src/systems/SystemsLean/Linear.lean` | Linear SSOT (defs + axioms) |
| `HostModuleCheckRequiredDecls.lean` | Living Linear required token list |

---

## 1. Living tip (measured before Linear L2)

| Surface | Living value |
|---------|--------------|
| HostModuleCheck depth honesty | **PARTIAL-STRUCTURAL** (seed modules=**206**) |
| Mult TERM-SURFACE | Mult-only dual-ok **true** |
| MultTheorems PROOF-SURFACE | MultTheorems-only dual-ok **true** |
| Linear L2 | **not** dual-ok before this pilot |
| FullHostElaborateRemains | **false** (unchanged) |
| Host residual free | **claimed** F1 (unchanged) |

---

## 2. Linear.lean: checkable vs axiom-only

| Decl | Kind | L0 token | L2 candidate |
|------|------|----------|--------------|
| shareNat | def | def:shareNat | Return Nat + body `n + n` |
| polyId | def | def:polyId | Body exactly `x` |
| mult0ClassId | def | def:mult0ClassId | Body `"MULT-0"` |
| mult1ClassId / multOmegaClassId / honesty ids | def | required | L0 only this pilot |
| linearAxiomInventoryOk | def | required | L0 only this pilot |
| Token / mkToken / consume | axiom | axiom:* | L0 only (LINEAR-AXIOMS-REMAIN) |
| roundTrip | noncomputable def | not required L0 | Optional: body `consume (mkToken n)` when present |

**Honesty:** classic Lean does not typecheck axiom contracts the way Mult defs
typecheck. Linear L2 targets **greppable def shapes**, not MULT-1 elaborator
enforcement on Token.

---

## 3. Ill-typed twins (L0 accept, Lake reject intent)

| Twin id | Mutation | L0/L1 | L2 expected |
|---------|----------|-------|-------------|
| **LT1** | shareNat : Bool := true | accept (def:shareNat) | ILL-TYPED-TERM |
| **LT2** | polyId body `true` | accept (def:polyId) | ILL-TYPED-TERM |
| **LT3** | mult0ClassId := "MULT-1" | accept (def:mult0ClassId) | ILL-TYPED-TERM |
| **LT4** | roundTrip body `consume n` (not compose mint) | accept (roundTrip not L0-required) | ILL-TYPED-TERM |

E-good: well-typed Linear fixture (shareNat/polyId/class ids + roundTrip
compose) must accept under L2. Real on-disk `Linear.lean` must still accept
when disk seed walk runs. Axiom Token/mkToken/consume bodies are never L2-checked
(LINEAR-AXIOMS-REMAIN; L0 `axiom:Name` tokens only).

---

## 4. Dual-ok honesty

| Pin | Scope | Value after pilot |
|-----|-------|-------------------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (this pilot) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |

No package-wide TERM-SURFACE claim. Linear-only coexists with Mult Mult-only.

---

## 5. Out of scope

- LinearTheorems L3 proof-surface
- MULT-1 / LINEAR-EXACT-ONCE elaborator enforcement on Token
- FullHostElaborateRemains re-true
- free/complete/PROVABLY / DualResidual free dual-ok flips
- Affine first-class

---

## 6. Pilot evidence (filled at implement)

Companion: `SystemsLean.HostModuleCheckLinearTerm`.
Wire: `refineLinearWithTermSurface` on `SystemsLean.Linear` path in
`checkRealModule`. Report: `.agents/reports/impl-linear-term-surface-d13c73db-2026-08-08.md`.
