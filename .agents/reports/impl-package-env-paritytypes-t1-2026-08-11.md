# Implement report: Package env seed expand (T1 ParityTypes)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env seed expand (T1 ParityTypes band)
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult..ParityLinear
by adding **ParityTypes** (third post-Kernel seed unit; TERM surface already dual-ok).
FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip. Not seed-wide
complete for all 206.

## What landed

### Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear + ParityTypes package environment dialect (H2)

Superseded Mult..ParityLinear Env-only with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesEnv-only**
dual-pin reseed.

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypes-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: prior Mult..EmitBody + CompilePath scaffold + Kernel
   Mult..Emit + EmitMult scaffold + ParityMult + ParityLinear + **ParityTypes**
2. Soft **J5**: prior unit term dialects + `checkParityTypesTermDialect`
3. Soft **J2**: prior import chain; ParityTypes must import KernelTypes; every import
   resolves to a present `===module Name===` (KernelTypes + ParityLinear already in env)
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Kernel + Parity Mult/Linear/Types good | accept | accept |
| PE1..PE21 | prior Mult..ParityLinear ill-typed twins (suffixes include ParityTypes good) | accept | reject `ILL-TYPED-TERM` |
| PE22 | ParityTypes wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE23 | ParityTypes typesParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

No new companion modules. ParityTypes TERM already exists (`HostModuleCheckParityTypesTerm`).

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageEnvFixtures.lean` | E-good / E-bad fixtures + shared section builders | **684** |
| `HostModuleCheckPackageEnv.lean` | Dialect + evidence folds + theorems | **844** |

Harness **58** unchanged (`HostModuleCheckParityTypesTerm` already present).
Seed **206** unchanged.

Chunked `native_decide` evidence theorems: dialect good, PE rejects fold (PE1..PE23 +
PE2 + PE3), L0 accepts fold; gate Ok folds those chunks.

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = ParityMult+ParityLinear+ParityTypes scope |
| HostResidualShrinkTheorems | scope theorem + dualOk comment |
| HostModuleCheck hub | greppable ParityTypes scope |
| SurfaceMatrix | rowFullElaborator ParityTypes env prose |
| just/host.just | Shrink greps ParityTypes scope |
| just/host-without-lake.just | PE22/PE23 fixtures + ParityTypes scope |
| nix host-specs-compile-path-3 | Fixtures + PackageEnv PE22/PE23 + ParityTypes scope (Fixtures, PackageEnv, Shrink) |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear + ParityTypes unit TERM dual-ok | **unchanged** (ParityTypes TERM already dual-ok) |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **58** |
| DominanceClaimed | **false** (untouched) |
| band FullBackend | **false** (untouched) |

## RED / GREEN evidence

| Contract | Evidence |
|----------|----------|
| Dialect good accepts E-good | `hostModuleCheckPackageEnvDialectOk_true` by `native_decide` (lake build exit 0) |
| PE rejects fold (incl. PE22/PE23) | `packageEnvDialectRejectsOk_true` by `native_decide` |
| L0 still accepts PE twins | `packageEnvL0AcceptsOk_true` by `native_decide` |
| Combined gate Ok | `hostModuleCheckPackageElaborateEnvOk_true` |
| Scope dual-pin | `hostModuleCheck_package_elaborate_env_band_ids_eq` / Shrink `measuredHostCheckPackageEnvBandScope_eq` |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnvFixtures` | exit 0 |
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + Driver | exit 0 |
| `lake build slake-host-module-check` (relink after PackageEnv c.o) | exit 0; banner scope includes ParityTypes |
| `just host-module-check-without-lake` | GREEN; modules=206 |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just hygiene` | GREEN |

## Files changed

- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean`
- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixtures.lean`
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean`
- `src/systems/SystemsLean/HostModuleCheck.lean`
- `src/systems/SystemsLean/SurfaceMatrix.lean`
- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-specs-compile-path-3.nix`
- this report

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not DominanceClaimed forge
- Not llvm / N4 band FullBackend
- Not T3 TERM companions (ParityProgram/Emit)
- Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear + ParityTypes package env closed; H2 still partial vs seed=206

## Residual (report-only)

T1 product Done when met. Coordinator may mark Open T1 done in residual ledgers.
Optional further package-env band (e.g. ParityProgram) only under a new Name.
