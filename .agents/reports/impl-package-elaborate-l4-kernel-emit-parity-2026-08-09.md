# Report: Package elaborate L4 Kernel/Emit/Parity

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Grow PACKAGE-ELABORATE beyond Mult..Extract foundation + MultLinearTypes PROOF
package bands. Named package band: **KernelEmitParity kind package** (Kernel Mult..Emit
+ EmitPlan/Apply/Body + Parity Mult..Emit FOUNDATION-KIND-SURFACE under package-scope
inventory with real E-bad that L0 still accepts). Do **not** forge FullHost or full
classic elaborator parity.

## Delivered

| Item | Path / result |
|------|----------------|
| Research reseed | `doc/dev/research/package-elaborate-l4-entry-2026-08-09.md` section 5 Kernel band (E-good/E-bad PK1/PK2; gate fold; remaining L4) |
| Companion (extended) | `src/systems/SystemsLean/HostModuleCheckPackageElab.lean` (~630 lines; first + PROOF + Kernel bands) |
| Dual-ok pins | claim `hostModuleCheckPackageElaborateKernelBandDualOk` true; **gate** `hostModuleCheckPackageElaborateKernelBandOk` (E-bad fold + deepen FOUNDATION-KIND-SURFACE units); scope KernelEmitParity-only; HostResidualShrink mirror |
| Accepts | E-good complete KernelEmitParity kind inventory; PK1 missing ParityEmit / PK2 not ready reject `PACKAGE-BAND-INCOMPLETE` while L0 package tokens still accept |
| Driver | banner `packageKernel=PACKAGE-ELABORATE scope=KernelEmitParity-only dualOk=true`; KernelBandOk smoke |
| Harness | seed=206 harness=**40** (PackageElab extended; no new companion) |
| Residual lockstep | RESIDUAL-systems Done Kernel band + Open **Full classic elaborator parity measured**; RESIDUAL.md join; WATCHER `/implement` Full classic elaborator parity measured; SESSION-HANDOFF; surface-matrix tip; self-host tip |

## Kernel dual-ok band (checkable)

**Band:** KernelEmitParity kind package (package-scope).

**Why package-scope (not unit re-list alone):**

1. Package kind inventory dialect requires thirteen unit lines
   (`unit KernelMult..ParityEmit FOUNDATION-KIND-SURFACE dualOk`) plus
   packageBand KernelEmitParity-kind / packageElaborateBar /
   packageKernelEmitParityBandReady.
2. Gate also folds living deepen bar FOUNDATION-KIND-SURFACE with those units
   present on `checkDepthDeepenBand` (existing kind-surface dual-ok).
3. E-bad PK1/PK2 reject incomplete inventory that L0 package tokens still accept.

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
| hostModuleCheckPackageElaborateProofBandDualOk | MultLinearTypesProof-only claim pin | **true** (unchanged) |
| hostModuleCheckPackageElaborateProofBandOk | MultLinearTypesProof-only **gate** | **true** (unchanged) |
| hostModuleCheckPackageElaborateKernelBandDualOk | KernelEmitParity-only claim pin | **true** |
| hostModuleCheckPackageElaborateKernelBandOk | KernelEmitParity-only **gate** (E-bad) | **true** |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`packageElaborate=PACKAGE-ELABORATE scope=MultExtractFoundation-only dualOk=true`
`packageProof=PACKAGE-ELABORATE scope=MultLinearTypesProof-only dualOk=true`
`packageKernel=PACKAGE-ELABORATE scope=KernelEmitParity-only dualOk=true`
alongside Mult..Extract TERM-SURFACE and Mult/Linear/Types PROOF-SURFACE lines.
Driver folds FirstBandOk + ProofBandOk + KernelBandOk, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build` HostModuleCheckPackageElab + HostModuleCheck + HostResidualShrink + HostResidualShrinkTheorems | **0** |
| `lake build slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; packageKernel KernelEmitParity-only dualOk=true) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (253 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (PackageElab 630; HostResidualShrink 996;
Driver 992; LoadOk 891; HostResidualShrinkTheorems 648).

## Next Open

**Full classic elaborator parity measured:** multi-band package L4 inventory
evidence is in place; remaining work is real package-scope judgment path
(J5-J12 / seed-wide L4) with dual-ok redesign + lake proof before surface-matrix
row can move to measured. FullHostElaborateRemains stays **false**. See residual
Open Done when and research note section 6 remaining.

## Non-claims

- Not package L4 complete / seed-wide J1-J12
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not FullHostElaborateRemains re-true
- Not full elaborator / mathlib parity claim (surface-matrix stays open)
- Mult..Extract TERM + Mult/Linear/Types PROOF unit dual-ok stay true and unit-scoped
- First-band MultExtractFoundation + PROOF MultLinearTypesProof PACKAGE-ELABORATE dual-ok unchanged
