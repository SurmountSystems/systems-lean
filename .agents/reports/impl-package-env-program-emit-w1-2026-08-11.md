# Implement report: Package env seed expand (W1 ParityProgram + ParityEmit)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env seed expand (W1 ParityProgram then ParityEmit bands)
Status: **GREEN** (both bands under Sub-1-KLOC)

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult..ParityTypes
by adding **ParityProgram** then **ParityEmit** multi-module package-env (TERM surfaces
dual-ok after W3; harness **61**). FullHostElaborateRemains stays **false**. No
free/complete/PROVABLY flip. Not seed-wide complete for all 206.

## What landed

### Mult..EmitBody + Kernel Mult..Emit + Parity Mult..Types + ParityProgram + ParityEmit package environment dialect (H2)

Superseded Mult..ParityTypes Env-only with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEnv-only**
dual-pin reseed.

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmit-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: prior Mult..EmitBody + CompilePath scaffold + Kernel
   Mult..Emit + EmitMult scaffold + ParityMult + ParityLinear + ParityTypes +
   **ParityProgram** + **ParityEmit**
2. Soft **J5**: prior unit term dialects + `checkParityProgramTermDialect` +
   `checkParityEmitTermDialect` (HostModuleCheckParityProgramTerm /
   HostModuleCheckParityEmitTerm from W3)
3. Soft **J2**: prior import chain; ParityProgram imports KernelProgram; ParityEmit
   imports KernelEmit; every import resolves to a present `===module Name===`
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Kernel + Parity Mult..Emit good | accept | accept |
| PE1..PE23 | prior Mult..ParityTypes ill-typed twins (suffixes include Program/Emit good) | accept | reject `ILL-TYPED-TERM` |
| PE24 | ParityProgram wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE25 | ParityProgram programParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PE26 | ParityEmit wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE27 | ParityEmit emitParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

Both bands landed in-place (no new companion modules; TERM dialects already exist).
PackageEnv **954** and Fixtures **802** stay under **1000**. No honest stop after Program only.

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageEnvFixtures.lean` | E-good / E-bad fixtures + shared section builders | **802** |
| `HostModuleCheckPackageEnv.lean` | Dialect + evidence folds + theorems | **954** |

Side fix (not W1 primary scope, required for green LoadOk/Ready): RealModule good
fixtures for ParityProgram/ParityEmit in `HostModuleCheckFixtureTextsLater.lean`
rewritten fail-closed (aligned with ParityTypes / TERM good mids). Always-true
ready/contract bodies were rejected by `refineParity*WithTermSurface` as
ILL-TYPED-TERM. FixtureTextsLater **1033** is residual long-file (pre-existing
headroom / follow-up split; not claimed closed here). Import-alias to TERM modules
was tried and reverted (import cycle).

Harness **61** unchanged (ParityProgram/Emit TERM already present).
Seed **206** unchanged.

Chunked `native_decide` evidence theorems: dialect good, PE rejects fold (PE1..PE27 +
PE2 + PE3), L0 accepts fold; gate Ok folds those chunks.

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = ParityMult..ParityEmit scope |
| HostResidualShrinkTheorems | scope theorem + dualOk comment |
| HostModuleCheck hub | greppable ParityProgram+ParityEmit scope |
| SurfaceMatrix | rowFullElaborator ParityProgram+ParityEmit env prose |
| just/host.just | Shrink greps ParityProgram+ParityEmit scope |
| just/host-without-lake.just | ParityProgram+ParityEmit Env-only scope token |
| nix host-specs-compile-path-3 | Fixtures + PackageEnv + Shrink ParityProgram+ParityEmit scope |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit + Parity Mult..Emit unit TERM dual-ok | **unchanged** (W3) |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **61** |
| DominanceClaimed | **false** (untouched) |
| band FullBackend | **false** (untouched) |

## RED / GREEN evidence

| Contract | Evidence |
|----------|----------|
| Dialect good accepts E-good | `hostModuleCheckPackageEnvDialectOk_true` by `native_decide` (lake build exit 0) |
| PE rejects fold (incl. PE24..PE27) | `packageEnvDialectRejectsOk_true` by `native_decide` |
| L0 still accepts PE twins | `packageEnvL0AcceptsOk_true` by `native_decide` |
| Combined gate Ok | `hostModuleCheckPackageElaborateEnvOk_true` |
| Scope dual-pin | PackageEnv / Shrink measured scope strings match Env-only tip |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnvFixtures` | exit 0 |
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostResidualShrink + Theorems + HostModuleCheck + SurfaceMatrix + `slake-host-module-check` | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=**206** |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN |
| `just hygiene` | GREEN |

## Files changed

- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean`
- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixtures.lean`
- `src/systems/SystemsLean/HostModuleCheckFixtureTextsLater.lean` (RealModule fail-closed side fix)
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean`
- `src/systems/SystemsLean/HostModuleCheck.lean`
- `src/systems/SystemsLean/SurfaceMatrix.lean`
- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-specs-compile-path-3.nix`
- residual: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`, `doc/SESSION-HANDOFF.md`
- this report

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true (W2 owns flip-or-partial after this evidence)
- Not free / complete / PROVABLY re-open
- Not seed-wide 206 package-env complete
- Not mathlib / full Lean 4 core parity
- Not DominanceClaimed forge
- Not FixtureTextsLater long-file closed (1033 residual)

## Residual

W1 **done** (both bands). Living package-env tip Mult..**ParityEmit** Env-only.
Open remains **W2** (FullHost meet Phase B reseed after W1) and **W5** (completeness polish).
H2 still **partial** vs seed=206 (pilots Mult..ParityEmit package-env, not seed-wide).
