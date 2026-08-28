# Implement report: Package elaborate real judgments path (M4)

Date: 2026-08-09
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package elaborate real judgments path

## Goal

Land package-scope judgment evidence **beyond inventory dialects** (M4) so Full
classic elaborator parity could move from present-partial toward measured under
the M1-M6 bar. FullHost stays false. No mathlib. free/complete/PROVABLY unchanged.

## What landed

### MultLinearEnv package environment dialect (M4)

Companion extension: `src/systems/SystemsLean/HostModuleCheckPackageElab.lean`
(~865 lines; Sub-1-KLOC).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearEnv-only` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this is not inventory re-list:**

1. Multi-module fixture sections: `===module SystemsLean.Mult===` ...
   `===end===` and `===module SystemsLean.Linear===` ... `===end===`
2. Soft **J5**: Mult body runs `checkMultTermDialect`; Linear body runs
   `checkLinearTermDialect` (package-scoped unit term dialects)
3. Soft **J2**: Linear must `import SystemsLean.Mult`; every import resolves to a
   present `===module Name===` section in the package fixture
4. E-bad twins L0 package tokens alone still accept (`packageBand:` +
   `PACKAGE-ELABORATE` only)

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult good + Linear good + Mult import | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `hostModuleCheckPackageElaborateEnvDualOk` + `measuredHostCheckPackageEnvBandScope` |
| HostResidualShrinkTheorems | dual-ok + scope theorems |
| HostModuleCheckDriver | banner `packageEnv=... MultLinearEnv-only dualOk=true`; gate `EnvOk` |
| just/host.just | HostResidualShrink greps for Env dual-ok + MultLinearEnv-only |
| just/host-without-lake.just | family tokens for Env dialect / fixtures / Ok |
| nix/systems-host-presence/host-specs-compile-path-3.nix | PackageElab + Shrink tokens |

### Surface-matrix measured flip (M1-M6)

| Req | Status after this slice |
|-----|-------------------------|
| M1 Multi-band PACKAGE-ELABORATE | met (three inventory bands + MultLinearEnv) |
| M2 Unit TERM Mult..Extract | met (unchanged) |
| M3 Unit PROOF Mult/Linear/Types | met (unchanged) |
| M4 Package-scope beyond inventory | **met** (MultLinearEnv multi-module env) |
| M5 E-lake | met (`lake build` HostModuleCheck + HostResidualShrink + SurfaceMatrix + exe) |
| M6 FullHost / free / product | met (FullHost false; free/complete/PROVABLY unchanged) |

| Pin | Value |
|-----|-------|
| `rowFullElaborator` | `measured` |
| `rowFullElaboratorMeasuredOk` | true (matrixSurfaceOk fold) |
| FullHostElaborateRemains | false (unchanged) |
| free / complete / PROVABLY | unchanged |

Honesty: measured is the **named develop-seed M1-M6 bar**, not seed-wide J1-J12
Lake-grade package typecheck of every seed module, not mathlib, not
"Slake typechecks like Lake."

### Prior bands unchanged

- TERM Mult..Extract dual-ok
- PROOF Mult/Linear/Types dual-ok
- PACKAGE-ELABORATE MultExtractFoundation / MultLinearTypesProof / KernelEmitParity
  inventory bands dual-ok
- seed=206; harness=40 (no new companion; PackageElab extended)

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageElab` | exit 0 |
| `lake build SystemsLean.HostModuleCheck SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.SurfaceMatrix SystemsLean.SurfaceMatrixTheorems slake-host-module-check` | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN |
| `just systems-host` | GREEN (253 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | M4 Done; Open next Mult foreign link success; living tip measured |
| RESIDUAL.md | Systems Open join Mult foreign link |
| surface-matrix.md | Full classic elaborator parity **measured** |
| SESSION-HANDOFF.md | Active residual Mult foreign link; parity measured |
| WATCHER.md | `/implement` Mult foreign link success |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12 on full seed library
- Not FullHostElaborateRemains re-true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Not full LLVM backend
- Not Mult foreign link success (opened as next residual)

## Next

**Mult foreign link success** (Phase 3). See `WATCHER.md` and
`RESIDUAL-systems.md` Open queue.
