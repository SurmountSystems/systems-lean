# Implement report: Package env seed expand (R1)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env seed expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult..EmitBody +
Kernel Mult..Emit multi-module env by adding **ParityMult** (first post-Kernel seed
unit with existing TERM surface). FullHostElaborateRemains stays **false**. No
free/complete/PROVABLY flip. Not seed-wide complete for all 206.

## What landed

### Mult..EmitBody + Kernel Mult..Emit + ParityMult package environment dialect (H2)

Superseded Kernel Mult..Emit Env-only with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultEnv-only**
dual-pin reseed.

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMult-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: prior Mult..EmitBody + CompilePath scaffold + Kernel
   Mult..Emit + **EmitMult scaffold** + **ParityMult**
2. Soft **J5**: prior unit term dialects + `checkParityMultTermDialect`
3. Soft **J2**: prior import chain; ParityMult must import KernelMult; every import
   resolves to a present `===module Name===` (Mult + KernelMult + EmitMult for
   ParityMult good text)
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Kernel + ParityMult good | accept | accept |
| PE1..PE17 | prior Mult..Kernel ill-typed twins (suffixes include ParityMult where needed) | accept | reject `ILL-TYPED-TERM` |
| PE18 | ParityMult wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE19 | ParityMult multParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

No new companion modules. Existing fixtures split kept.

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageEnvFixtures.lean` | E-good / E-bad fixtures + shared section builders | **581** |
| `HostModuleCheckPackageEnv.lean` | Dialect + evidence folds + theorems | **730** |

Harness **57** unchanged (`HostModuleCheckParityMultTerm` already present from prior
ParityMult TERM residual).

Chunked `native_decide` evidence theorems: dialect good, PE rejects fold (PE1..PE19 +
PE2 + PE3), L0 accepts fold; gate Ok folds those chunks.

### Second post-Kernel unit?

Only **ParityMult** has a living HostModuleCheck TERM companion among post-Kernel seed
units. ParityLinear TERM is **R3** (separate track; not this residual). One-unit band is
the checkable next seed expand.

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = ParityMult scope |
| HostResidualShrinkTheorems | scope theorem + dualOk |
| HostModuleCheckDriver | error string ParityMult packageBand |
| HostModuleCheck hub | greppable ParityMult scope |
| SurfaceMatrix | rowFullElaborator ParityMult env prose |
| just/host.just | Shrink greps ParityMult scope |
| just/host-without-lake.just | PE18/PE19 fixtures + ParityMult scope |
| nix host-specs-compile-path-3 | Fixtures + PackageEnv PE18/PE19 + ParityMult scope |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit + ParityMult unit TERM dual-ok | **unchanged** (ParityMult TERM already dual-ok) |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **57** |

## RED / GREEN evidence

| Contract | Evidence |
|----------|----------|
| Dialect good accepts E-good | `hostModuleCheckPackageEnvDialectOk_true` by `native_decide` (lake build exit 0) |
| PE rejects fold (incl. PE18/PE19) | `packageEnvDialectRejectsOk_true` by `native_decide` |
| L0 still accepts PE twins | `packageEnvL0AcceptsOk_true` by `native_decide` |
| Combined gate Ok | `hostModuleCheckPackageElaborateEnvOk_true` |
| Scope dual-pin | `hostModuleCheck_package_elaborate_env_band_ids_eq` / Shrink `measuredHostCheckPackageEnvBandScope_eq` |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheckPackageEnvFixtures + HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + Driver + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv dualOk path |
| `just systems-host` | GREEN (270 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | R1 Done; Open remaining R2/R3 |
| RESIDUAL.md | Systems Open join R1 done; highest value R2 then R3 |
| SESSION-HANDOFF.md | Active tip R1 done; Open R2/R3 |
| WATCHER.md | Next multi-track R2/R3 |

## Files changed

- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean`
- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixtures.lean`
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean`
- `src/systems/SystemsLean/HostModuleCheckDriver.lean`
- `src/systems/SystemsLean/HostModuleCheck.lean`
- `src/systems/SystemsLean/SurfaceMatrix.lean`
- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-specs-compile-path-3.nix`
- `RESIDUAL-systems.md`, `RESIDUAL.md`, `doc/SESSION-HANDOFF.md`, `WATCHER.md`
- this report + `/tmp` summary

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not ParityLinear TERM (R3)
- Mult..EmitBody + Kernel Mult..Emit + ParityMult package env closed; H2 still partial vs seed=206

## Next

- R2 FullHost meet progress (reseed H1-H8 after R1; expect FULLHOST_FLIP=no)
- R3 ParityLinear TERM-SURFACE (owns new HostModuleCheck companion)
