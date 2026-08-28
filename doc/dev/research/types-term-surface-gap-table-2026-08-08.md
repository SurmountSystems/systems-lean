# Types term-surface gap table (2026-08-08)

Kind: analysis + pilot. Not residual invent beyond the named queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not mathlib product dependency. Not full classic Lean 4 package typecheck claim.

ASCII only. Plain American English. Date: 2026-08-08.

**Program slice:** Types term-surface pilot (IMPL **b1c88216**) after Mult L2
TERM-SURFACE Mult-only, MultTheorems L3 PROOF-SURFACE MultTheorems-only, and
Linear L2 TERM-SURFACE Linear-only.

**Prior (do not re-run from zero):**

| Artifact | Role |
|----------|------|
| `mult-term-surface-gap-table-2026-08-08.md` | Mult L2 gap table pattern |
| `linear-term-surface-gap-table-2026-08-08.md` | Linear L2 gap table pattern |
| `real-elaborator-judgments-design-2026-08-08.md` | L0-L4 layers; L2 = TERM-SURFACE |
| `HostModuleCheckMultTerm.lean` | Living Mult L2 dialect |
| `HostModuleCheckLinearTerm.lean` | Living Linear L2 dialect |
| `src/systems/SystemsLean/Types.lean` | Types SSOT (structures + kind/mult table) |
| `HostModuleCheckRequiredDecls.lean` | Living Types required token list |

---

## 1. Living tip (measured before Types L2)

| Surface | Living value |
|---------|--------------|
| HostModuleCheck depth honesty | **PARTIAL-STRUCTURAL** (seed modules=**206**) |
| Mult TERM-SURFACE | Mult-only dual-ok **true** |
| Linear TERM-SURFACE | Linear-only dual-ok **true** |
| MultTheorems PROOF-SURFACE | MultTheorems-only dual-ok **true** |
| Types L2 | **not** dual-ok before this pilot |
| FullHostElaborateRemains | **false** (unchanged) |
| Host residual free | **claimed** F1 (unchanged) |
| harness | **31** before TypesTerm companion |

---

## 2. Types.lean: checkable def shapes (L2 dialect)

| Decl | Kind | L0 token | L2 candidate |
|------|------|----------|--------------|
| TypeTag / IrNode | structure | structure:* | L0 only this pilot |
| NodeKind | inductive | inductive:NodeKind | L0 only this pilot |
| NodeKind.name | def match | def:NodeKind.name | Arms RHS `"VALUE"` / `"LINEAR"` / `"ERASED"` |
| NodeKind.expectedMult | def match | def:NodeKind.expectedMult | Arms Mult.multOmega / mult1 / mult0 |
| kindMultOk | def | def:kindMultOk | Body `decide (k.expectedMult = m)` (same-line or next line via typesDefBodyCollapsed; real Types.lean is multi-line) |
| ofKindTag? | def match | def:ofKindTag? | 0/1/2 decode + `_ => none` |
| isValidKindTag | def | def:isValidKindTag | Body `(ofKindTag? n).isSome` |
| IrNode.isWellTyped | def | def:IrNode.isWellTyped | Body `kindMultOk n.kind n.mult` |
| typeTagInit / mkNode? / mkNodeFromTags? | def | required | L0 tokens; shape honesty on good fixture |

**Honesty:** Types L2 targets **greppable def shapes** from the SSOT, not full
Lean elaborator typecheck of structures or theorems.

---

## 3. Ill-typed twins (L0 accept, L2 reject intent)

| Twin id | Mutation | L0/L1 | L2 expected |
|---------|----------|-------|-------------|
| **TT1** | NodeKind.name value arm `"WRONG"` | accept (def:NodeKind.name) | ILL-TYPED-TERM |
| **TT2** | expectedMult value => Mult.mult0 | accept (def:NodeKind.expectedMult) | ILL-TYPED-TERM |
| **TT3** | kindMultOk body `true` | accept (def:kindMultOk) | ILL-TYPED-TERM |
| **TT4** | ofKindTag? 0 => some NodeKind.linear | accept (def:ofKindTag?) | ILL-TYPED-TERM |

E-good: well-typed Types fixture (name/expectedMult/kindMultOk/ofKindTag?/
isValidKindTag/isWellTyped shapes) must accept under L2. Real on-disk
`Types.lean` must still accept when disk seed walk runs.

---

## 4. Dual-ok honesty

| Pin | Scope | Value after pilot |
|-----|-------|-------------------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (this pilot) |
| hostModuleCheckTypesTermSurfaceOk | Types-only **gate** (E-bad fold) | **true** (not bare dualOk) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |

No package-wide TERM-SURFACE claim. Types-only coexists with Mult Mult-only and
Linear Linear-only.

---

## 5. Out of scope

- TypesTheorems L3 proof-surface
- FullHostElaborateRemains re-true
- free/complete/PROVABLY / DualResidual free dual-ok flips
- Full elaborator / mathlib package typecheck
- Program / Graph / other unit term-surface (promote-only later)

---

## 6. Pilot evidence (filled at implement)

Companion: `SystemsLean.HostModuleCheckTypesTerm`.
Wire: `refineTypesWithTermSurface` on `SystemsLean.Types` path in
`checkRealModule`. Report: `.agents/reports/impl-types-term-surface-b1c88216-2026-08-08.md`.
Harness: seed=206 harness=**32** (HostModuleCheckTypesTerm added).
