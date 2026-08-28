# Report: Erasure term-surface pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Same bar as Mult / Linear / Types / IrProgram / IrGraph / HostCompose TERM-SURFACE
pilots for **Erasure.lean**: reject named ill-typed Erasure twins that L0/L1 still
accept; dual-ok **TERM-SURFACE Erasure-only** with E-bad evidence. Gate via
SurfaceOk fold not bare dualOk. Mult Mult-only + Linear Linear-only + Types
Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only + HostCompose
HostCompose-only + MultTheorems PROOF MultTheorems-only unchanged.
FullHostElaborateRemains false. free/complete/PROVABLY unchanged.

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/erasure-term-surface-gap-table-2026-08-09.md` (Kind: analysis only; ET1..ET4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckErasureTerm.lean` (~452 lines) |
| Nested `:=` lesson | `erasureBodyAfterAssign` re-joins after first `:=` so `{ marked := false }` does not truncate |
| Wire | `refineErasureWithTermSurface` on `SystemsLean.Erasure` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckErasureTermSurfaceDualOk` true; **gate** `hostModuleCheckErasureTermSurfaceOk` (E-bad fold); scope Erasure-only; HostResidualShrink mirror |
| L0 good fixture | `hostModuleCheckGoodErasureText` upgraded to L2 shapes (seed L0 path still accepts under refine) |
| Harness | seed=206 harness=**36** (added HostModuleCheckErasureTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open **Extract term-surface pilot**; RESIDUAL.md join; WATCHER `/implement` Extract; SESSION-HANDOFF living tip; self-host / inventory tips |

## Erasure L2 dialect rules

Documented subset (not full Lean 4 elaborator):

1. **unmarked**: collapsed exact `{ marked := false }`
2. **mark**: collapsed exact `{ marked := true }`
3. **isRuntimeAbsent**: collapsed exact `e.marked`
4. **erasureIsRuntimeAbsent**: collapsed exact `isRuntimeAbsent e`
5. **isErasureGrade**: match arms one `true` + at least two `false`
   (real table: mult0 true; mult1/omega false)
6. **markForGrade?**: collapsed exact
   `if isErasureGrade m then some (mark e) else none`
7. **checkFailClosed**: collapsed exact
   `isErasureGrade m && isRuntimeAbsent e`

Reject reason: `ILL-TYPED-TERM` (shared with Mult..HostCompose L2).
Structure Erased stays L0 token only this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| ET1 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| ET2 | isErasureGrade always `true` | accept | ILL-TYPED-TERM |
| ET3 | markForGrade? always `some (mark e)` | accept | ILL-TYPED-TERM |
| ET4 | isRuntimeAbsent body `true` | accept | ILL-TYPED-TERM |
| E-good | well-typed Erasure term fixture | accept | accept |
| Real disk | `Erasure.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before Erasure L2 dialect. Living dual-pin encodes the gap:
`hostModuleCheckErasureTermSurfaceOk` requires dialect reject of ET1..ET4 while
`hostModuleCheckBadErasure*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only | **true** (unchanged) |
| hostModuleCheckHostComposeTermSurfaceDualOk | HostCompose-only | **true** (unchanged) |
| hostModuleCheckErasureTermSurfaceDualOk | Erasure-only claim pin | **true** |
| hostModuleCheckErasureTermSurfaceOk | Erasure-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`erasureTermSurface=TERM-SURFACE scope=Erasure-only dualOk=true` alongside
Mult-only, Linear-only, Types-only, IrProgram-only, IrGraph-only, HostCompose-only.
LoadOk + Driver fold **SurfaceOk**, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.Erasure` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; Erasure-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (249 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (ErasureTerm ~452; Theorems 1000;
CheckersLater 999; FixtureTexts 997; Accepts 898; Driver 927; LoadOk 884;
HostResidualShrink 940).

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not ErasureTheorems L3 proof-surface
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only + HostCompose HostCompose-only + MultTheorems PROOF MultTheorems-only stay true
