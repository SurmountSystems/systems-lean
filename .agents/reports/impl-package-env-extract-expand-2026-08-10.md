# Implement report: Package env Extract expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env Extract expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear+Types+
IrProgram+IrGraph+HostCompose+Erasure multi-module env by adding Extract body dialect
+ import chain with fail-closed E-bad. Completes Mult..Extract foundation package-env
ladder. FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesProgramGraphComposeErasureExtractEnv package environment dialect (H2)

Superseded MultLinearTypesProgramGraphComposeErasureEnv-only with
**MultLinearTypesProgramGraphComposeErasureExtractEnv-only** dual-pin reseed in
`src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (**770** lines).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtract-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + Types + IrProgram + IrGraph +
   HostCompose + Erasure + **Extract** (`===module SystemsLean.Extract===` ...
   `===end===`)
2. Soft **J5**: Mult / Linear / Types / IrProgram / IrGraph / HostCompose /
   Erasure / **Extract** bodies run unit term dialects
   (`checkMultTermDialect` ... `checkExtractTermDialect`)
3. Soft **J2**: prior import chain + Erasure import Mult; Extract must
   `import SystemsLean.Erasure`; every import resolves to a present
   `===module Name===` section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Extract good + Mult/Types/IrProgram/IrGraph/Erasure imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE5 | IrProgram wrong `programCap` (0 not 8) | accept | reject `ILL-TYPED-TERM` |
| PE6 | IrGraph wrong `edgeMax` (0 not 16) | accept | reject `ILL-TYPED-TERM` |
| PE7 | HostCompose empty drops graph/erased fields | accept | reject `ILL-TYPED-TERM` |
| PE8 | Erasure `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE9 | Extract `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageElab.lean` | Inventory PACKAGE-ELABORATE bands | **608** |
| `HostModuleCheckPackageEnv.lean` | Multi-module env judgment dialect (H2 Mult..Extract) | **770** |

Harness stays **55** (no new module). Driver pre-existing headroom residual (no growth this slice).

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesProgramGraphComposeErasureExtractEnv-only |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesProgramGraphComposeErasureExtractEnv-only |
| HostModuleCheckDriver | error string MultLinearTypesProgramGraphComposeErasureExtract-env |
| HostModuleCheck hub | greppable MultLinearTypesProgramGraphComposeErasureExtractEnv-only |
| SurfaceMatrix | rowFullElaborator MultLinearTypesProgramGraphComposeErasureExtractEnv prose |
| just/host.just | HostResidualShrink greps MultLinearTypesProgramGraphComposeErasureExtractEnv-only |
| just/host-without-lake.just | family includes PE9 Extract fixture; ExtractEnv scope |
| nix host-specs-compile-path-3 | PackageEnv PE9 + ExtractEnv scope; Shrink scope token |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types/IrProgram/IrGraph/HostCompose/Erasure/Extract unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **55** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesProgramGraphComposeErasureExtractEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (268 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | Extract expand Done; Open **Package env EmitPlan expand** |
| RESIDUAL.md | Systems Open join EmitPlan expand; Extract done |
| SESSION-HANDOFF.md | Active open EmitPlan expand |
| WATCHER.md | `/implement` Package env EmitPlan expand |
| fullhost-meet-inventory | H2 partial improved (Mult..Extract foundation closed) |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not EmitPlan package env yet (next Open)
- Mult..Extract package env foundation closed; H2 still partial vs seed=206

## Next

**Package env EmitPlan expand** (H2 next unit: EmitPlan term dialect + import chain).
See `WATCHER.md` and `RESIDUAL-systems.md` Open queue.
