# Implement report: Package env Graph expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env Graph expand
Status: **GREEN**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear+Types+IrProgram
multi-module env by adding IrGraph body dialect + import chain with fail-closed
E-bad. FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesProgramGraphEnv package environment dialect (H2)

Superseded MultLinearTypesProgramEnv-only with **MultLinearTypesProgramGraphEnv-only**
dual-pin reseed in long-file split companion
`src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (**501** lines).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphEnv-only` |
| packageBand | `MultLinearTypesProgramGraph-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + Types + IrProgram + **IrGraph**
   (`===module SystemsLean.IrGraph===` ... `===end===`)
2. Soft **J5**: Mult / Linear / Types / IrProgram / **IrGraph** bodies run unit term
   dialects (`checkMultTermDialect` ... `checkIrGraphTermDialect`)
3. Soft **J2**: Linear and Types must `import SystemsLean.Mult`; IrProgram must
   `import SystemsLean.Types`; IrGraph must `import SystemsLean.IrProgram`; every
   import resolves to a present `===module Name===` section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult+Linear+Types+IrProgram+IrGraph good + Mult/Types/IrProgram imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE5 | IrProgram wrong `programCap` (0 not 8) | accept | reject `ILL-TYPED-TERM` |
| PE6 | IrGraph wrong `edgeMax` (0 not 16) | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Long-file split (Sub-1-KLOC)

PackageElab was **991** lines; Graph expand would exceed 1000. Same-slice role split:

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageElab.lean` | Inventory PACKAGE-ELABORATE bands (first / PROOF / Kernel) + shared `packageInventoryHas` / bar | **608** |
| `HostModuleCheckPackageEnv.lean` | Multi-module env judgment dialect (H2 Mult..IrGraph) | **501** |

Harness inventory: **54 -> 55** (`HostModuleCheckPackageEnv` after PackageElab).
Driver **1004** pre-existing headroom residual (no growth this slice).

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesProgramGraphEnv-only; harness=55 + PackageEnv in list |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesProgramGraphEnv-only; harness=55 |
| HostModuleCheckDriver | import PackageEnv; error string MultLinearTypesProgramGraph-env; banner uses scope def |
| HostModuleCheck hub | import PackageEnv; greppable MultLinearTypesProgramGraphEnv-only |
| SurfaceMatrix | rowFullElaborator MultLinearTypesProgramGraphEnv prose |
| just/host.just | HostResidualShrink greps MultLinearTypesProgramGraphEnv-only + harness=55 |
| just/host-without-lake.just | family includes PackageEnv; PE6 fixture name; GraphEnv scope |
| nix host-leans / required-files / host-specs-compile-path-3 | PackageEnv path + split presence tokens; harness=55 |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types/IrProgram/IrGraph unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **55** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageElab` | exit 0 |
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesProgramGraphEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (268 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | Graph expand Done; Open **Package env HostCompose expand** |
| RESIDUAL.md | Systems Open join HostCompose expand; Graph done |
| SESSION-HANDOFF.md | Active open HostCompose expand |
| WATCHER.md | `/implement` Package env HostCompose expand |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not HostCompose package env yet (next Open)

## Next

**Package env HostCompose expand** (H2 next unit: HostCompose term dialect + IrGraph
import chain). See `WATCHER.md` and `RESIDUAL-systems.md` Open queue.
