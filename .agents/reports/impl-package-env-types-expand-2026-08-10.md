# Implement report: Package env Types expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env Types expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear
multi-module env by adding Types body dialect + import chain with fail-closed
E-bad. FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesEnv package environment dialect (H2)

Superseded MultLinearEnv-only with **MultLinearTypesEnv-only** dual-pin reseed
in `src/systems/SystemsLean/HostModuleCheckPackageElab.lean` (**925** lines;
Sub-1-KLOC).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesEnv-only` |
| packageBand | `MultLinearTypes-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + **Types**
   (`===module SystemsLean.Types===` ... `===end===`)
2. Soft **J5**: Mult / Linear / **Types** bodies run unit term dialects
   (`checkMultTermDialect`, `checkLinearTermDialect`, `checkTypesTermDialect`)
3. Soft **J2**: Linear and Types must `import SystemsLean.Mult`; every import
   resolves to a present `===module Name===` section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult+Linear+Types good + Mult imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesEnv-only |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesEnv-only |
| HostModuleCheckDriver | error string MultLinearTypes-env; banner uses scope def |
| just/host.just | HostResidualShrink greps MultLinearTypesEnv-only |
| just/host-without-lake.just | family tokens + PE4 fixture name |
| nix host-specs-compile-path-3 | PackageElab + Shrink MultLinearTypesEnv-only + PE4 |
| HostModuleCheck hub / SurfaceMatrix | greppable MultLinearTypesEnv-only |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types unit TERM + PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **54** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageElab` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (267 paths) |
| `just hygiene` | GREEN |

## Sub-1-KLOC

| File | Lines |
|------|-------|
| HostModuleCheckPackageElab.lean | **925** (under 1000) |
| HostModuleCheckDriver.lean | **1004** (pre-existing; no growth this slice) |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | Types expand Done; Open **Package env Program expand** |
| RESIDUAL.md | Systems Open join Program expand; Types done |
| SESSION-HANDOFF.md | Active open Program expand |
| WATCHER.md | `/implement` Package env Program expand |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not IrProgram package env yet (next Open)

## Next

**Package env Program expand** (H2 next unit: IrProgram term dialect + Types import).
See `WATCHER.md` and `RESIDUAL-systems.md` Open queue.
