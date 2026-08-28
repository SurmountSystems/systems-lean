# Report: IrProgram term-surface pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Same bar as Mult TERM-SURFACE Mult-only, Linear TERM-SURFACE Linear-only, and
Types TERM-SURFACE Types-only for **IrProgram.lean**: reject named ill-typed
IrProgram twins that L0/L1 still accept; dual-ok **TERM-SURFACE IrProgram-only**
only with E-bad evidence. Gate dual-ok via **SurfaceOk** fold not bare dualOk.
Mult Mult-only + Linear Linear-only + Types Types-only + MultTheorems PROOF
MultTheorems-only unchanged. FullHostElaborateRemains false.
free dual-ok / free/complete/PROVABLY unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/irprogram-term-surface-gap-table-2026-08-09.md` (Kind: analysis only; PT1..PT4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckIrProgramTerm.lean` (~390 lines) |
| Process mop | Nested `:=` in structure literals: `irProgramBodyAfterAssign` re-joins after first `:=` so empty `{ nodes := [] }` and push `PushResult.ok { nodes := ... }` parse; LoadOk + Driver `maxHeartbeats 800000` / Driver `maxRecDepth 16384` for larger fold |
| Wire | `refineIrProgramWithTermSurface` on `SystemsLean.IrProgram` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckIrProgramTermSurfaceDualOk` true; **gate** `hostModuleCheckIrProgramTermSurfaceOk` (E-bad fold); scope IrProgram-only; HostResidualShrink mirror |
| L0 good fixture | `hostModuleCheckGoodIrProgramText` upgraded to L2 shapes (so seed L0 path still accepts under refine) |
| Harness | seed=206 harness=**33** (added HostModuleCheckIrProgramTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open **IrGraph term-surface pilot**; RESIDUAL.md join; WATCHER `/implement` IrGraph; SESSION-HANDOFF living tip; self-host / README / inventory tips |

## IrProgram L2 dialect rules

Documented subset (not full Lean 4 elaborator):

1. **programCap**: body exact `8`
2. **empty**: body exact `{ nodes := [] }` (nested `:=` kept)
3. **checkFailClosed**: body exact `isWellTyped p`
4. **isWellTyped**: multi-line collapsed exact
   `!p.nodes.isEmpty && decide (p.nodes.length <= programCap) && p.nodes.all IrNode.isWellTyped`
5. **push**: multi-line collapsed contains `!n.isWellTyped`, `PushResult.badNode`,
   `PushResult.full`, `PushResult.ok`, and `programCap` (fail-closed arms)

Reject reason: `ILL-TYPED-TERM` (shared with Mult/Linear/Types L2).
foldWellTyped stays L0 token only this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| PT1 | programCap `0` | accept | ILL-TYPED-TERM |
| PT2 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| PT3 | isWellTyped body `true` | accept | ILL-TYPED-TERM |
| PT4 | push always `PushResult.ok p` | accept | ILL-TYPED-TERM |
| E-good | well-typed IrProgram term fixture | accept | accept |
| Real disk | `IrProgram.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before IrProgram L2 dialect. Living dual-pin encodes the gap:
`hostModuleCheckIrProgramTermSurfaceOk` requires dialect reject of PT1..PT4 while
`hostModuleCheckBadIrProgram*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only claim pin | **true** |
| hostModuleCheckIrProgramTermSurfaceOk | IrProgram-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`irProgramTermSurface=TERM-SURFACE scope=IrProgram-only dualOk=true` alongside
Mult-only, Linear-only, Types-only. LoadOk + Driver fold **SurfaceOk**, not bare
dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.IrProgram` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; IrProgram-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (246 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (IrProgramTerm ~390; Theorems 993;
CheckersLater 998; FixtureTexts 998; Accepts 797; Driver 861+; LoadOk 877+).

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not IrProgramTheorems L3 proof-surface
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + MultTheorems PROOF MultTheorems-only stay true
