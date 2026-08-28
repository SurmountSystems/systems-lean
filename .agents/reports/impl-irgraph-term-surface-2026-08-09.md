# Report: IrGraph term-surface pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Same bar as Mult / Linear / Types / IrProgram TERM-SURFACE pilots for
**IrGraph.lean**: reject named ill-typed IrGraph twins that L0/L1 still accept;
dual-ok **TERM-SURFACE IrGraph-only** with E-bad evidence. Gate dual-ok via
**SurfaceOk** fold not bare dualOk. Mult Mult-only + Linear Linear-only + Types
Types-only + IrProgram IrProgram-only + MultTheorems PROOF MultTheorems-only
unchanged. FullHostElaborateRemains false. free dual-ok / free/complete/PROVABLY
unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/irgraph-term-surface-gap-table-2026-08-09.md` (Kind: analysis only; GT1..GT4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckIrGraphTerm.lean` (~462 lines) |
| Nested `:=` lesson | `irGraphBodyAfterAssign` re-joins after first `:=` so empty `{ prog := IrProgram.empty, edges := [] }` and pushNode/addEdge structure literals parse |
| Wire | `refineIrGraphWithTermSurface` on `SystemsLean.IrGraph` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckIrGraphTermSurfaceDualOk` true; **gate** `hostModuleCheckIrGraphTermSurfaceOk` (E-bad fold); scope IrGraph-only; HostResidualShrink mirror |
| L0 good fixture | `hostModuleCheckGoodIrGraphText` upgraded to L2 shapes (seed L0 path still accepts under refine) |
| Harness | seed=206 harness=**34** (added HostModuleCheckIrGraphTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open **HostCompose term-surface pilot**; RESIDUAL.md join; WATCHER `/implement` HostCompose; SESSION-HANDOFF living tip; self-host / README / inventory tips |

## IrGraph L2 dialect rules

Documented subset (not full Lean 4 elaborator):

1. **edgeMax**: body exact `16`
2. **empty**: body exact `{ prog := IrProgram.empty, edges := [] }` (nested `:=` kept)
3. **checkFailClosed**: body exact `isWellTyped g`
4. **isWellTyped**: multi-line collapsed exact
   `if isEmpty g then true else if IrProgram.isEmpty g.prog then false else IrProgram.isWellTyped g.prog && edgesSound g.edges (IrProgram.length g.prog)`
5. **pushNode**: multi-line collapsed contains `IrProgram.push`, `PushNodeResult.badNode`,
   `PushNodeResult.full`, `PushNodeResult.ok`
6. **addEdge**: multi-line collapsed contains `AddEdgeResult.full`,
   `AddEdgeResult.badEndpoints`, `AddEdgeResult.ok`, and `edgeMax`

Reject reason: `ILL-TYPED-TERM` (shared with Mult/Linear/Types/IrProgram L2).
edgeCount / nodeCount / isEmpty / edgesSound stay L0 token only this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| GT1 | edgeMax `0` | accept | ILL-TYPED-TERM |
| GT2 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| GT3 | isWellTyped body `true` | accept | ILL-TYPED-TERM |
| GT4 | pushNode always `PushNodeResult.ok g` | accept | ILL-TYPED-TERM |
| E-good | well-typed IrGraph term fixture | accept | accept |
| Real disk | `IrGraph.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before IrGraph L2 dialect. Living dual-pin encodes the gap:
`hostModuleCheckIrGraphTermSurfaceOk` requires dialect reject of GT1..GT4 while
`hostModuleCheckBadIrGraph*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only claim pin | **true** |
| hostModuleCheckIrGraphTermSurfaceOk | IrGraph-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`irGraphTermSurface=TERM-SURFACE scope=IrGraph-only dualOk=true` alongside
Mult-only, Linear-only, Types-only, IrProgram-only. LoadOk + Driver fold
**SurfaceOk**, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.IrGraph` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; IrGraph-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (247 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (IrGraphTerm ~462; Theorems 1000;
CheckersLater 1000; FixtureTexts 998; Accepts 830; Driver 885; LoadOk 880).

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not IrGraphTheorems L3 proof-surface
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only + MultTheorems PROOF MultTheorems-only stay true
