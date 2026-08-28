# IrProgram term-surface gap table (2026-08-09)

Kind: analysis only. Not residual invent beyond the named Open queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not mathlib product dependency. Not full classic Lean 4 package typecheck claim.

ASCII only. Plain American English. Date: 2026-08-09.

**Program slice:** IrProgram term-surface pilot (Phase 2 first unit under Full
readiness program) after Mult / Linear / Types L2 TERM-SURFACE pilots.

**Prior (do not re-run from zero):**

| Artifact | Role |
|----------|------|
| `mult-term-surface-gap-table-2026-08-08.md` | Mult L2 gap table pattern |
| `linear-term-surface-gap-table-2026-08-08.md` | Linear L2 gap table pattern |
| `types-term-surface-gap-table-2026-08-08.md` | Types L2 gap table pattern |
| `real-elaborator-judgments-design-2026-08-08.md` | L0-L4 layers; L2 = TERM-SURFACE |
| `.agents/reports/impl-irprogram-term-surface-2026-08-09.md` | IrProgram L2 after Types (landed) |
| `HostModuleCheckTypesTerm.lean` | Living Types L2 dialect mirror |
| `src/systems/SystemsLean/IrProgram.lean` | Ordered IR program SSOT |
| `HostModuleCheckRequiredDecls.lean` | Living IrProgram required token list |

---

## 1. Living tip (measured before IrProgram L2)

| Surface | Living value |
|---------|--------------|
| HostModuleCheck depth honesty | **PARTIAL-STRUCTURAL** (seed modules=**206**) |
| Mult TERM-SURFACE | Mult-only dual-ok **true** |
| Linear TERM-SURFACE | Linear-only dual-ok **true** |
| Types TERM-SURFACE | Types-only dual-ok **true** |
| MultTheorems PROOF-SURFACE | MultTheorems-only dual-ok **true** |
| IrProgram L2 | **not** dual-ok before this pilot (L0/L1 structure Program + defs only) |
| FullHostElaborateRemains | **false** (unchanged) |
| Host residual free | **claimed** F1 (unchanged) |
| harness | **32** before HostModuleCheckIrProgramTerm companion |

---

## 2. IrProgram.lean: checkable def shapes (L2 dialect)

Read from living SSOT `SystemsLean/IrProgram.lean` (namespace
`SystemsLean.IrProgram`). Structures / inductive stay L0 token presence this
pilot.

| Decl | Kind | L0 token | L2 candidate |
|------|------|----------|--------------|
| Program | structure | structure:Program | L0 only this pilot |
| PushResult | inductive | inductive:PushResult | L0 only this pilot |
| programCap | def Nat | def:programCap | Body exact `8` (emit SLAKE_IR_PROGRAM_CAP) |
| empty | def Program | def:empty | Body exact `{ nodes := [] }` |
| length / isEmpty | def | required | L0 tokens only this pilot |
| push | def multi-line | def:push | Fail-closed body: `!n.isWellTyped` then `PushResult.badNode`; length `>= programCap` then `PushResult.full`; else `PushResult.ok { nodes := p.nodes ++ [n] }` (multi-line collapsed) |
| isWellTyped | def multi-line | def:isWellTyped | Body exact `!p.nodes.isEmpty && decide (p.nodes.length <= programCap) && p.nodes.all IrNode.isWellTyped` (EMPTY-PROGRAM-FAIL-CLOSED + cap + all nodes) |
| foldWellTyped | def multi-line | def:foldWellTyped | L0 token only this pilot (signature has universe/param noise) |
| checkFailClosed | def | def:checkFailClosed | Body exact `isWellTyped p` |

**Honesty:** IrProgram L2 targets **greppable def shapes** from the SSOT, not
full Lean elaborator typecheck of Program / PushResult / foldWellTyped
polymorphism.

---

## 3. Ill-typed twins (L0 accept, L2 reject intent)

| Twin id | Mutation | L0/L1 | L2 expected |
|---------|----------|-------|-------------|
| **PT1** | programCap body `0` (not 8) | accept (def:programCap) | ILL-TYPED-TERM |
| **PT2** | checkFailClosed body `true` | accept (def:checkFailClosed) | ILL-TYPED-TERM |
| **PT3** | isWellTyped body `true` (drops empty fail-closed) | accept (def:isWellTyped) | ILL-TYPED-TERM |
| **PT4** | push body always `PushResult.ok p` (no badNode/full) | accept (def:push) | ILL-TYPED-TERM |

E-good: well-typed IrProgram fixture (programCap / empty / push fail-closed /
isWellTyped / checkFailClosed shapes) must accept under L2. Real on-disk
`IrProgram.lean` must still accept when disk seed walk runs.

RED honesty: L0/L1 structural token check accepts PT1..PT4 before dialect.
Living dual-pin requires dialect reject + L0Accept true for each twin.

---

## 4. Dual-ok honesty

| Pin | Scope | Value after pilot |
|-----|-------|-------------------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only claim pin | **true** (this pilot) |
| hostModuleCheckIrProgramTermSurfaceOk | IrProgram-only **gate** (E-bad fold) | **true** (not bare dualOk) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |

No package-wide TERM-SURFACE claim. IrProgram-only coexists with Mult / Linear /
Types scopes.

---

## 5. Out of scope

- IrProgramTheorems L3 proof-surface
- IrGraph / HostCompose / Erasure / Extract term-surface
- FullHostElaborateRemains re-true
- free/complete/PROVABLY / DualResidual free dual-ok flips
- Full elaborator / mathlib package typecheck
- foldWellTyped soft body dialect this pilot (token only)

---

## 6. Pilot evidence (filled at implement)

Companion: `SystemsLean.HostModuleCheckIrProgramTerm`.
Wire: `refineIrProgramWithTermSurface` on `SystemsLean.IrProgram` path in
`checkRealModule`. Report: `.agents/reports/impl-irprogram-term-surface-2026-08-09.md`.
Harness: seed=206 harness=**33** (HostModuleCheckIrProgramTerm added).
