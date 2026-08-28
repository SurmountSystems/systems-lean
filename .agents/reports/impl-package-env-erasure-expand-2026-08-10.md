# Implement report: Package env Erasure expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env Erasure expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear+Types+IrProgram
+IrGraph+HostCompose multi-module env by adding Erasure body dialect + import chain with
fail-closed E-bad. FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesProgramGraphComposeErasureEnv package environment dialect (H2)

Superseded MultLinearTypesProgramGraphComposeEnv-only with
**MultLinearTypesProgramGraphComposeErasureEnv-only** dual-pin reseed in
`src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (**687** lines).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasure-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + Types + IrProgram + IrGraph + HostCompose
   + **Erasure** (`===module SystemsLean.Erasure===` ... `===end===`)
2. Soft **J5**: Mult / Linear / Types / IrProgram / IrGraph / HostCompose / **Erasure** bodies
   run unit term dialects (`checkMultTermDialect` ... `checkErasureTermDialect`)
3. Soft **J2**: Linear and Types must `import SystemsLean.Mult`; IrProgram must
   `import SystemsLean.Types`; IrGraph must `import SystemsLean.IrProgram`; HostCompose must
   `import SystemsLean.IrGraph`; Erasure must `import SystemsLean.Mult`; every import resolves
   to a present `===module Name===` section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult+Linear+Types+IrProgram+IrGraph+HostCompose+Erasure good + Mult/Types/IrProgram/IrGraph imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE5 | IrProgram wrong `programCap` (0 not 8) | accept | reject `ILL-TYPED-TERM` |
| PE6 | IrGraph wrong `edgeMax` (0 not 16) | accept | reject `ILL-TYPED-TERM` |
| PE7 | HostCompose empty drops graph/erased fields | accept | reject `ILL-TYPED-TERM` |
| PE8 | Erasure `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageElab.lean` | Inventory PACKAGE-ELABORATE bands | **608** |
| `HostModuleCheckPackageEnv.lean` | Multi-module env judgment dialect (H2 Mult..Erasure) | **687** |

Harness stays **55** (no new module). Driver pre-existing headroom residual (**1005**; no growth this slice).

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesProgramGraphComposeErasureEnv-only |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesProgramGraphComposeErasureEnv-only |
| HostModuleCheckDriver | error string MultLinearTypesProgramGraphComposeErasure-env |
| HostModuleCheck hub | greppable MultLinearTypesProgramGraphComposeErasureEnv-only |
| SurfaceMatrix | rowFullElaborator MultLinearTypesProgramGraphComposeErasureEnv prose |
| just/host.just | HostResidualShrink greps MultLinearTypesProgramGraphComposeErasureEnv-only |
| just/host-without-lake.just | family includes PE8 Erasure fixture; ErasureEnv scope |
| nix host-specs-compile-path-3 | PackageEnv PE8 + ErasureEnv scope; Shrink scope token |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types/IrProgram/IrGraph/HostCompose/Erasure unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **55** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesProgramGraphComposeErasureEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (268 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | Erasure expand Done; Open **Package env Extract expand** |
| RESIDUAL.md | Systems Open join Extract expand; Erasure done |
| SESSION-HANDOFF.md | Active open Extract expand |
| WATCHER.md | `/implement` Package env Extract expand |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not Extract package env yet (next Open)
- Mult..Erasure package env foundation closed; H2 still partial vs seed=206

## Next

**Package env Extract expand** (H2 next unit: Extract term dialect + import chain).
See `WATCHER.md` and `RESIDUAL-systems.md` Open queue.
