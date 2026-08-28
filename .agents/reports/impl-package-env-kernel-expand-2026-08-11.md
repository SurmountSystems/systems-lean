# Implement report: Package env Kernel expand

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env Kernel expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult..EmitBody multi-module
env by adding Kernel Mult / Linear / Types / Program / Emit module sections with soft term
dialects + fail-closed E-bad. FullHostElaborateRemains stays **false**. No free/complete/
PROVABLY flip.

## What landed

### Mult..EmitBody + Kernel Mult..Emit package environment dialect (H2)

Superseded MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only
with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitEnv-only**
dual-pin reseed.

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmit-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: prior Mult..EmitBody + **CompilePath scaffold** +
   **KernelMult** + **KernelLinear** + **KernelTypes** + **KernelProgram** + **KernelEmit**
2. Soft **J5**: prior unit term dialects + `checkKernelMultTermDialect` /
   `checkKernelLinearTermDialect` / `checkKernelTypesTermDialect` /
   `checkKernelProgramTermDialect` / `checkKernelEmitTermDialect`
3. Soft **J2**: Kernel Mult/Linear/Types/Program must import CompilePath (scaffold present);
   KernelEmit must import KernelProgram; every import resolves to a present `===module Name===`
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..EmitBody + Kernel Mult..Emit good | accept | accept |
| PE1..PE12 | prior Mult..EmitBody ill-typed twins (updated suffixes include Kernel) | accept | reject `ILL-TYPED-TERM` |
| PE13 | KernelMult wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE14 | KernelLinear wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE15 | KernelTypes wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE16 | KernelProgram wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE17 | KernelEmit wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC (same-slice long-file split)

Prior tip PackageEnv was **847**. Kernel growth + PE13..PE17 would exceed 1000.

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageEnvFixtures.lean` | E-good / E-bad fixtures + shared section builders (new) | **520** |
| `HostModuleCheckPackageEnv.lean` | Dialect + evidence folds + theorems | **675** |
| `HostModuleCheckPackageElab.lean` | Inventory PACKAGE-ELABORATE bands (unchanged) | **608** |

Harness **55 -> 56** (`HostModuleCheckPackageEnvFixtures` added).

Chunked `native_decide` evidence theorems (fixture size): dialect good, PE rejects fold,
L0 accepts fold; gate Ok folds those chunks.

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = Kernel scope; harness=56 + Fixtures |
| HostResidualShrinkTheorems | scope theorem + harness=56 example |
| HostModuleCheckDriver | error string Kernel packageBand |
| HostModuleCheck hub | greppable Kernel scope + Fixtures import |
| SurfaceMatrix | rowFullElaborator Kernel env prose |
| just/host.just | Shrink greps Kernel scope + harness=56 |
| just/host-without-lake.just | PE13..PE17 fixtures + Kernel scope + Fixtures module |
| nix host-leans / required-files | PackageEnvFixtures path |
| nix host-specs-compile-path-3 | Fixtures + PackageEnv PE13..PE17 + Kernel scope + harness=56 |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **56** |

### Kernel units covered (full subset)

All five requested Kernel units fit Sub-1-KLOC via fixtures split:

- KernelMult
- KernelLinear
- KernelTypes
- KernelProgram
- KernelEmit

No remaining follow-on Names required for missing Kernel package-env sections.

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + Driver + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv Kernel scope dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (269 paths) |
| `just hygiene` | GREEN (ASCII fix on `->` types) |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | Kernel expand Done; Open remaining FullHost meet / ParityMult TERM / Affine dual |
| RESIDUAL.md | Systems Open join Kernel expand done; harness=56 |
| SESSION-HANDOFF.md | Active tip Kernel expand done |
| WATCHER.md | Next multi-track remaining three Names |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Mult..EmitBody + Kernel Mult..Emit package env closed; H2 still partial vs seed=206

## Next (P3 may start)

- ParityMult TERM-SURFACE (owns HostModuleCheck after this report)
- FullHost meet progress inventory reseed (honest partial unless bar + lake)
- Affine product dual deepen (disjoint dual trees)
