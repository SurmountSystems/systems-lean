# Report: Package elaborate L4 remaining (PROOF package band)

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Grow PACKAGE-ELABORATE beyond Mult..Extract foundation first band. Named next
package band: **MultLinearTypes PROOF package** (MultTheorems + LinearTheorems +
TypesTheorems PROOF-SURFACE under package-scope inventory with real E-bad that
L0 still accepts). Do **not** forge FullHost or full classic elaborator parity.

## Delivered

| Item | Path / result |
|------|----------------|
| Research reseed | `doc/dev/research/package-elaborate-l4-entry-2026-08-09.md` section 4 PROOF band (E-good/E-bad PP1/PP2; gate fold; remaining L4) |
| Companion (extended) | `src/systems/SystemsLean/HostModuleCheckPackageElab.lean` (~406 lines; first band kept + PROOF band) |
| Dual-ok pins | claim `hostModuleCheckPackageElaborateProofBandDualOk` true; **gate** `hostModuleCheckPackageElaborateProofBandOk` (E-bad fold + Mult/Linear/Types PROOF SurfaceOk); scope MultLinearTypesProof-only; HostResidualShrink mirror |
| Accepts | E-good complete MultLinearTypes PROOF inventory; PP1 missing TypesTheorems / PP2 not ready reject `PACKAGE-BAND-INCOMPLETE` while L0 package tokens still accept |
| Driver | banner `packageProof=PACKAGE-ELABORATE scope=MultLinearTypesProof-only dualOk=true`; ProofBandOk smoke |
| Harness | seed=206 harness=**40** (PackageElab extended; no new companion) |
| Residual lockstep | RESIDUAL-systems Done PROOF band + Open **Package elaborate L4 Kernel/Emit/Parity**; RESIDUAL.md join; WATCHER `/implement` Kernel/Emit/Parity; SESSION-HANDOFF; surface-matrix tip; self-host tip |

## PROOF dual-ok band (checkable)

**Band:** MultLinearTypes PROOF package (package-scope).

**Why package-scope (not unit re-list alone):**

1. Package proof inventory dialect requires three unit lines
   (`unit MultTheorems/LinearTheorems/TypesTheorems PROOF-SURFACE dualOk`)
   plus packageBand MultLinearTypes-proof / packageElaborateBar /
   packageProofBandReady.
2. Gate also folds living Mult/Linear/Types PROOF SurfaceOk conjunction.
3. E-bad PP1/PP2 reject incomplete inventory that L0 package tokens still accept.

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
| hostModuleCheckPackageElaborateFirstBandDualOk | MultExtractFoundation-only claim pin | **true** (unchanged) |
| hostModuleCheckPackageElaborateFirstBandOk | MultExtractFoundation-only **gate** | **true** (unchanged) |
| hostModuleCheckPackageElaborateProofBandDualOk | MultLinearTypesProof-only claim pin | **true** |
| hostModuleCheckPackageElaborateProofBandOk | MultLinearTypesProof-only **gate** (E-bad) | **true** |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`packageElaborate=PACKAGE-ELABORATE scope=MultExtractFoundation-only dualOk=true`
`packageProof=PACKAGE-ELABORATE scope=MultLinearTypesProof-only dualOk=true`
alongside Mult..Extract TERM-SURFACE and Mult/Linear/Types PROOF-SURFACE lines.
Driver folds FirstBandOk + ProofBandOk, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build` HostModuleCheckPackageElab + HostModuleCheck + HostResidualShrink + HostResidualShrinkTheorems | **0** |
| `lake build slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; packageProof MultLinearTypesProof-only dualOk=true) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (253 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (PackageElab 406; HostResidualShrink 992;
Driver 988; LoadOk 890; HostResidualShrinkTheorems 637).

## Next Open

**Package elaborate L4 Kernel/Emit/Parity:** Kernel/Emit/Parity package inventory
band with package-scope E-good/E-bad. See residual Open Done when and research
note section 5 remaining. Surface-matrix Full classic elaborator parity stays
**open**.

## Non-claims

- Not package L4 complete / seed-wide J1-J12
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not FullHostElaborateRemains re-true
- Not full elaborator / mathlib parity claim
- Mult..Extract TERM + Mult/Linear/Types PROOF unit dual-ok stay true and unit-scoped
- First-band MultExtractFoundation PACKAGE-ELABORATE dual-ok unchanged
