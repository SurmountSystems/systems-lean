# Implement report: Package env Program expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env Program expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear+Types
multi-module env by adding IrProgram body dialect + import chain with fail-closed
E-bad. FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesProgramEnv package environment dialect (H2)

Superseded MultLinearTypesEnv-only with **MultLinearTypesProgramEnv-only** dual-pin
reseed in `src/systems/SystemsLean/HostModuleCheckPackageElab.lean` (**991** lines;
Sub-1-KLOC).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramEnv-only` |
| packageBand | `MultLinearTypesProgram-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + Types + **IrProgram**
   (`===module SystemsLean.IrProgram===` ... `===end===`)
2. Soft **J5**: Mult / Linear / Types / **IrProgram** bodies run unit term dialects
   (`checkMultTermDialect`, `checkLinearTermDialect`, `checkTypesTermDialect`,
   `checkIrProgramTermDialect`)
3. Soft **J2**: Linear and Types must `import SystemsLean.Mult`; IrProgram must
   `import SystemsLean.Types`; every import resolves to a present `===module Name===`
   section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult+Linear+Types+IrProgram good + Mult/Types imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE5 | IrProgram wrong `programCap` (0 not 8) | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesProgramEnv-only |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesProgramEnv-only |
| HostModuleCheckDriver | error string MultLinearTypesProgram-env; banner uses scope def |
| HostModuleCheck hub | greppable MultLinearTypesProgramEnv-only |
| SurfaceMatrix | rowFullElaborator MultLinearTypesProgramEnv prose |
| just/host.just | HostResidualShrink greps MultLinearTypesProgramEnv-only |
| just/host-without-lake.just | family tokens + PE5 fixture name |
| nix host-specs-compile-path-3 | PackageElab + Shrink MultLinearTypesProgramEnv-only + PE5 |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types/IrProgram unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **54** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageElab` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesProgramEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (267 paths) |
| `just hygiene` | GREEN |

## Sub-1-KLOC

| File | Lines |
|------|-------|
| HostModuleCheckPackageElab.lean | **991** (under 1000; no split required this slice) |
| HostModuleCheckDriver.lean | **1004** (pre-existing; no growth this slice) |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | Program expand Done; Open **Package env Graph expand** |
| RESIDUAL.md | Systems Open join Graph expand; Program done |
| SESSION-HANDOFF.md | Active open Graph expand |
| WATCHER.md | `/implement` Package env Graph expand |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not IrGraph package env yet (next Open)

## Next

**Package env Graph expand** (H2 next unit: IrGraph term dialect + IrProgram import).
See `WATCHER.md` and `RESIDUAL-systems.md` Open queue.
