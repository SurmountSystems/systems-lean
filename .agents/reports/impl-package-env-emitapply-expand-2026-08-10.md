# Implement report: Package env EmitApply expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env EmitApply expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear+Types+
IrProgram+IrGraph+HostCompose+Erasure+Extract+EmitPlan multi-module env by adding
EmitApply body dialect + import chain with fail-closed E-bad. FullHostElaborateRemains
stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv package environment dialect (H2)

Superseded MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEnv-only with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only** dual-pin
reseed in `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (**944** lines).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApply-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + Types + IrProgram + IrGraph +
   HostCompose + Erasure + Extract + EmitPlanScaffold + EmitPlan +
   **EmitApplyScaffold** (import resolve only) + **EmitApply**
   (`===module SystemsLean.EmitApply===` ... `===end===`)
2. Soft **J5**: Mult / Linear / Types / IrProgram / IrGraph / HostCompose /
   Erasure / Extract / EmitPlan / **EmitApply** bodies run unit term dialects
   (`checkMultTermDialect` ... `checkEmitApplyTermDialect`)
3. Soft **J2**: prior import chain + EmitPlan import HostCompose; EmitApply must
   `import SystemsLean.HostCompose` (also Mult/Types/EmitApplyScaffold present);
   every import resolves to a present `===module Name===` section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Extract+EmitPlan+EmitApply good + Mult/Types/IrProgram/IrGraph/Erasure/HostCompose imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE5 | IrProgram wrong `programCap` (0 not 8) | accept | reject `ILL-TYPED-TERM` |
| PE6 | IrGraph wrong `edgeMax` (0 not 16) | accept | reject `ILL-TYPED-TERM` |
| PE7 | HostCompose empty drops graph/erased fields | accept | reject `ILL-TYPED-TERM` |
| PE8 | Erasure `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE9 | Extract `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE10 | EmitPlan `Plan.failClosed` ready true | accept | reject `ILL-TYPED-TERM` |
| PE11 | EmitApply `Apply.failClosed` valid true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageElab.lean` | Inventory PACKAGE-ELABORATE bands | **608** |
| `HostModuleCheckPackageEnv.lean` | Multi-module env judgment dialect (H2 Mult..EmitApply) | **944** |

Harness stays **55** (no new module). Driver pre-existing headroom residual (no growth this slice).
Next EmitBody expand: PackageEnv **944** may need long-file split same slice if growth exceeds 1000.

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only |
| HostModuleCheckDriver | error string MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApply-env |
| HostModuleCheck hub | greppable MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only |
| SurfaceMatrix | rowFullElaborator MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv prose |
| just/host.just | HostResidualShrink greps MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only |
| just/host-without-lake.just | family includes PE11 EmitApply fixture; EmitApplyEnv scope |
| nix host-specs-compile-path-3 | PackageEnv PE11 + EmitApplyEnv scope; Shrink scope token |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types/IrProgram/IrGraph/HostCompose/Erasure/Extract/EmitPlan/EmitApply unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **55** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (268 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | EmitApply expand Done; Open **Package env EmitBody expand** |
| RESIDUAL.md | Systems Open join EmitBody expand; EmitApply done |
| SESSION-HANDOFF.md | Active open EmitBody expand |
| WATCHER.md | `/implement` Package env EmitBody expand |
| fullhost-meet-inventory | H2 partial improved (Mult..Extract+EmitPlan+EmitApply ladder closed through EmitApply) |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not EmitBody package env yet (next Open)
- Mult..Extract+EmitPlan+EmitApply package env closed through EmitApply; H2 still partial vs seed=206

## Next

**Package env EmitBody expand** (H2 next unit: EmitBody term dialect + import chain).
See `WATCHER.md` and `RESIDUAL-systems.md` Open queue.
PackageEnv **944** lines: long-file split same slice if EmitBody growth would exceed 1000.
