# Report: Package elaborate L4 first band

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Begin PACKAGE-ELABORATE dual-ok for host seed library (judgments design L4),
first slice only: entry design reseed + evidence-gate scaffold + first dual-ok
band path. Do **not** forge FullHost or full classic elaborator parity.

## Delivered

| Item | Path / result |
|------|----------------|
| Research note | `doc/dev/research/package-elaborate-l4-entry-2026-08-09.md` (Kind: analysis only; PACKAGE-ELABORATE; E-gates; first band; remaining L4; surface-matrix parity stays open) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckPackageElab.lean` (~244 lines) |
| Dual-ok pins | claim `hostModuleCheckPackageElaborateFirstBandDualOk` true; **gate** `hostModuleCheckPackageElaborateFirstBandOk` (E-bad fold + Mult..Extract TERM SurfaceOk); scope MultExtractFoundation-only; HostResidualShrink mirror |
| Accepts | E-good complete Mult..Extract foundation inventory; PB1 missing Extract / PB2 not ready reject `PACKAGE-BAND-INCOMPLETE` while L0 package tokens still accept |
| Driver | banner `packageElaborate=PACKAGE-ELABORATE scope=MultExtractFoundation-only dualOk=true`; FirstBandOk smoke |
| Harness | seed=206 harness=**40** (added HostModuleCheckPackageElab) |
| Residual lockstep | RESIDUAL-systems Done first band + Open **Package elaborate L4 remaining**; RESIDUAL.md join; WATCHER `/implement` remaining; SESSION-HANDOFF; surface-matrix tip; self-host tip |

## First dual-ok band (checkable)

**Band:** Mult..Extract foundation (package-scope).

**Why package-scope (not unit re-list alone):**

1. Package foundation inventory dialect requires all eight unit lines
   (`unit Mult..Extract TERM-SURFACE dualOk`) plus packageBand /
   packageElaborateBar / packageFirstBandReady.
2. Gate also folds living Mult..Extract TERM SurfaceOk conjunction.
3. E-bad PB1/PB2 reject incomplete inventory that L0 package tokens still accept.

Not claimed: package L4 complete; seed-wide J1-J12; surface-matrix Full classic
elaborator parity measured.

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only | **true** (unchanged) |
| hostModuleCheckHostComposeTermSurfaceDualOk | HostCompose-only | **true** (unchanged) |
| hostModuleCheckErasureTermSurfaceDualOk | Erasure-only | **true** (unchanged) |
| hostModuleCheckExtractTermSurfaceDualOk | Extract-only | **true** (unchanged) |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| hostModuleCheckLinearProofSurfaceDualOk | LinearTheorems-only | **true** (unchanged) |
| hostModuleCheckTypesProofSurfaceDualOk | TypesTheorems-only | **true** (unchanged) |
| hostModuleCheckPackageElaborateFirstBandDualOk | MultExtractFoundation-only claim pin | **true** |
| hostModuleCheckPackageElaborateFirstBandOk | MultExtractFoundation-only **gate** (E-bad) | **true** |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`packageElaborate=PACKAGE-ELABORATE scope=MultExtractFoundation-only dualOk=true`
alongside Mult..Extract TERM-SURFACE and Mult/Linear/Types PROOF-SURFACE lines.
Driver folds FirstBandOk, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build` HostModuleCheckPackageElab + HostModuleCheck + HostResidualShrink + HostResidualShrinkTheorems | **0** |
| `lake build slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; packageElaborate MultExtractFoundation-only dualOk=true) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (253 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (PackageElab ~244; CheckersLater 1000;
Theorems 1000; Driver 994; HostResidualShrink 997; LoadOk 889).

## Next Open

**Package elaborate L4 remaining:** Kernel/Emit/Parity package inventory band
and/or PROOF package conjunction. See residual Open Done when and research note
section 4. Surface-matrix Full classic elaborator parity stays **open**.

## Non-claims

- Not package L4 complete / seed-wide J1-J12
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not FullHostElaborateRemains re-true
- Not full elaborator / mathlib parity claim
- Mult..Extract TERM + Mult/Linear/Types PROOF dual-ok stay true and unit-scoped
