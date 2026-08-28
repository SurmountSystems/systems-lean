# Implement report: Package env seed expand (N1)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env seed expand (N1)
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult..EmitBody +
Kernel Mult..Emit + ParityMult multi-module env by adding **ParityLinear** (second
post-Kernel seed unit; TERM surface already dual-ok after R3). FullHostElaborateRemains
stays **false**. No free/complete/PROVABLY flip. Not seed-wide complete for all 206.

## What landed

### Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear package environment dialect (H2)

Superseded Mult..ParityMult Env-only with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearEnv-only**
dual-pin reseed.

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinear-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: prior Mult..EmitBody + CompilePath scaffold + Kernel
   Mult..Emit + EmitMult scaffold + ParityMult + **ParityLinear**
2. Soft **J5**: prior unit term dialects + `checkParityLinearTermDialect`
3. Soft **J2**: prior import chain; ParityLinear must import KernelLinear; every import
   resolves to a present `===module Name===` (KernelLinear + ParityMult already in env)
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Kernel + ParityMult + ParityLinear good | accept | accept |
| PE1..PE19 | prior Mult..ParityMult ill-typed twins (suffixes include ParityLinear good) | accept | reject `ILL-TYPED-TERM` |
| PE20 | ParityLinear wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE21 | ParityLinear linearParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

No new companion modules. ParityLinear TERM already exists (`HostModuleCheckParityLinearTerm`).

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageEnvFixtures.lean` | E-good / E-bad fixtures + shared section builders | **631** |
| `HostModuleCheckPackageEnv.lean` | Dialect + evidence folds + theorems | **788** |

Harness **58** unchanged (`HostModuleCheckParityLinearTerm` already present from R3).
Seed **206** unchanged.

Chunked `native_decide` evidence theorems: dialect good, PE rejects fold (PE1..PE21 +
PE2 + PE3), L0 accepts fold; gate Ok folds those chunks.

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = ParityMult+ParityLinear scope |
| HostResidualShrinkTheorems | scope theorem + dualOk comment |
| HostModuleCheck hub | greppable ParityLinear scope |
| SurfaceMatrix | rowFullElaborator ParityLinear env prose |
| just/host.just | Shrink greps ParityLinear scope |
| just/host-without-lake.just | PE20/PE21 fixtures + ParityLinear scope |
| nix host-specs-compile-path-3 | Fixtures + PackageEnv PE20/PE21 + ParityLinear scope (Fixtures, PackageEnv, Shrink) |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear unit TERM dual-ok | **unchanged** (ParityLinear TERM already dual-ok from R3) |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **58** |
| DominanceClaimed | **false** (untouched) |
| band FullBackend | **false** (untouched) |

## RED / GREEN evidence

| Contract | Evidence |
|----------|----------|
| Dialect good accepts E-good | `hostModuleCheckPackageEnvDialectOk_true` by `native_decide` (lake build exit 0) |
| PE rejects fold (incl. PE20/PE21) | `packageEnvDialectRejectsOk_true` by `native_decide` |
| L0 still accepts PE twins | `packageEnvL0AcceptsOk_true` by `native_decide` |
| Combined gate Ok | `hostModuleCheckPackageElaborateEnvOk_true` |
| Scope dual-pin | `hostModuleCheck_package_elaborate_env_band_ids_eq` / Shrink `measuredHostCheckPackageEnvBandScope_eq` |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnvFixtures` | exit 0 |
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + Driver | exit 0 |
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
- Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear package env closed; H2 still partial vs seed=206

## Residual (report-only)

N1 product Done when met. Phase 3 mop may mark Open N1 done in residual ledgers.
N2 FullHost meet progress reseed still open (FULLHOST_FLIP expected no unless full bar).
N3 / N4 untouched.

## Next (for coordinator / N2)

- N2 FullHost meet progress (reseed H1-H8 after N1 ParityLinear package-env evidence; expect FULLHOST_FLIP=no)
- Optional further package-env band (e.g. ParityTypes) only under a new Name
