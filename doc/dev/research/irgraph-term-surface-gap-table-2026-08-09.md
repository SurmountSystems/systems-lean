# IrGraph term-surface gap table (2026-08-09)

Kind: analysis only. Not residual invent beyond the named Open queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not mathlib product dependency. Not full classic Lean 4 package typecheck claim.

ASCII only. Plain American English. Date: 2026-08-09.

**Program slice:** IrGraph term-surface pilot (Phase 2 next unit under Full
readiness program) after Mult / Linear / Types / IrProgram L2 TERM-SURFACE pilots.

**Prior (do not re-run from zero):**

| Artifact | Role |
|----------|------|
| `irprogram-term-surface-gap-table-2026-08-09.md` | IrProgram L2 gap table pattern |
| `types-term-surface-gap-table-2026-08-08.md` | Types L2 gap table pattern |
| `real-elaborator-judgments-design-2026-08-08.md` | L0-L4 layers; L2 = TERM-SURFACE |
| `HostModuleCheckIrProgramTerm.lean` | Living IrProgram L2 dialect mirror |
| `src/systems/SystemsLean/IrGraph.lean` | Ordered IR graph SSOT |
| `HostModuleCheckRequiredDecls.lean` | Living IrGraph required token list |

---

## 1. Living tip (measured before IrGraph L2)

| Surface | Living value |
|---------|--------------|
| HostModuleCheck depth honesty | **PARTIAL-STRUCTURAL** (seed modules=**206**) |
| Mult TERM-SURFACE | Mult-only dual-ok **true** |
| Linear TERM-SURFACE | Linear-only dual-ok **true** |
| Types TERM-SURFACE | Types-only dual-ok **true** |
| IrProgram TERM-SURFACE | IrProgram-only dual-ok **true** |
| MultTheorems PROOF-SURFACE | MultTheorems-only dual-ok **true** |
| IrGraph L2 | **not** dual-ok before this pilot (L0/L1 structure Edge/Graph + defs only) |
| FullHostElaborateRemains | **false** (unchanged) |
| Host residual free | **claimed** F1 (unchanged) |
| harness | **33** before HostModuleCheckIrGraphTerm companion |

---

## 2. IrGraph.lean: checkable def shapes (L2 dialect)

Read from living SSOT `SystemsLean/IrGraph.lean` (namespace
`SystemsLean.IrGraph`). Structures / inductive stay L0 token presence this
pilot.

| Decl | Kind | L0 token | L2 candidate |
|------|------|----------|--------------|
| Edge / Graph | structure | structure:Edge / Graph | L0 only this pilot |
| PushNodeResult / AddEdgeResult | inductive | not L0 required | L0 optional; L2 body greps ctor names |
| edgeMax | def Nat | def:edgeMax | Body exact `16` (emit SLAKE_IR_EDGE_MAX) |
| empty | def Graph | def:empty | Body exact `{ prog := IrProgram.empty, edges := [] }` (nested `:=` kept) |
| edgeCount / nodeCount / isEmpty | def | required | L0 tokens only this pilot |
| edgeEndpointsOk / edgesSound | def | edgesSound required | L0 only this pilot (edgesSound shape soft via isWellTyped cite) |
| addEdge | def multi-line | def:addEdge | Fail-closed: `AddEdgeResult.full` / `badEndpoints` / `ok` + `edgeMax` (collapsed body) |
| pushNode | def multi-line | def:pushNode | Fail-closed match: `PushNodeResult.ok` / `badNode` / `full` + `IrProgram.push` |
| isWellTyped | def multi-line | def:isWellTyped | EMPTY-GRAPH-OK: `if isEmpty g then true else if IrProgram.isEmpty g.prog then false else IrProgram.isWellTyped g.prog && edgesSound g.edges (IrProgram.length g.prog)` |
| checkFailClosed | def | def:checkFailClosed | Body exact `isWellTyped g` |

**Honesty:** IrGraph L2 targets **greppable def shapes** from the SSOT, not
full Lean elaborator typecheck of Graph / Edge / pushNode polymorphism.
Nested structure literals use the same body-after-first-`:=` rejoin lesson as
IrProgram (`{ nodes := [] }` / `{ prog := ..., edges := [] }`).

---

## 3. Ill-typed twins (L0 accept, L2 reject intent)

| Twin id | Mutation | L0/L1 | L2 expected |
|---------|----------|-------|-------------|
| **GT1** | edgeMax body `0` (not 16) | accept (def:edgeMax) | ILL-TYPED-TERM |
| **GT2** | checkFailClosed body `true` | accept (def:checkFailClosed) | ILL-TYPED-TERM |
| **GT3** | isWellTyped body `true` (drops EMPTY-GRAPH-OK / edgesSound) | accept (def:isWellTyped) | ILL-TYPED-TERM |
| **GT4** | pushNode always `PushNodeResult.ok g` (no badNode/full) | accept (def:pushNode) | ILL-TYPED-TERM |

E-good: well-typed IrGraph fixture (edgeMax / empty / pushNode fail-closed /
addEdge fail-closed / isWellTyped / checkFailClosed shapes) must accept under
L2. Real on-disk `IrGraph.lean` must still accept when disk seed walk runs.

RED honesty: L0/L1 structural token check accepts GT1..GT4 before dialect.
Living dual-pin requires dialect reject + L0Accept true for each twin.

---

## 4. Dual-ok honesty

| Pin | Scope | Value after pilot |
|-----|-------|-------------------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only claim pin | **true** (this pilot) |
| hostModuleCheckIrGraphTermSurfaceOk | IrGraph-only **gate** (E-bad fold) | **true** (not bare dualOk) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |

No package-wide TERM-SURFACE claim. IrGraph-only coexists with Mult / Linear /
Types / IrProgram scopes.

---

## 5. Wire + residual

| Item | Target |
|------|--------|
| Companion | `SystemsLean.HostModuleCheckIrGraphTerm` |
| refine | `refineIrGraphWithTermSurface` on `SystemsLean.IrGraph` in `checkRealModule` |
| Gate | LoadOk + Driver fold `hostModuleCheckIrGraphTermSurfaceOk` (not bare dualOk) |
| Harness | seed=206 harness=**34** (HostModuleCheckIrGraphTerm added) |
| Next residual (recommended) | HostCompose term-surface pilot (Mult..Extract order) |

---

## 6. Non-claims

- Not IrGraphTheorems L3 proof-surface
- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not free / complete / PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only + MultTheorems PROOF MultTheorems-only stay true
