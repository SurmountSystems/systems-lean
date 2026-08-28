# Package elaborate L4 entry design (2026-08-09)

Kind: analysis only. Not residual invent beyond the named Open queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not mathlib product dependency. Not full classic Lean 4 package typecheck claim.
Not full LLVM backend. Not Rust-native link.

ASCII only. Plain American English. Date: 2026-08-09.

**Program slice:** Full readiness program Phase 2.4 -- Package elaborate L4
**first slice only** (entry design reseed + dual-pin scaffold + first dual-ok
band). Progressive L4; not "package L4 complete."

**Prior (do not re-run from zero):**

| Artifact | Role |
|----------|------|
| `real-elaborator-judgments-design-2026-08-08.md` | J1-J14; L0-L4 layers; E-gates; PACKAGE-ELABORATE token proposal |
| `.agents/plans/plan-fullhost-gap-close-2026-08-08.md` | Gap close wave; FullHost stays false; parity checklist |
| Mult..Extract L2 TERM-SURFACE dual-ok | Unit term pilots closed (harness through Extract) |
| MultTheorems + LinearTheorems + TypesTheorems L3 PROOF | Proof pilots closed (harness **39** before this slice) |
| `.agents/reports/impl-typestheorems-proof-surface-2026-08-09.md` | Living tip before package L4 |

---

## 1. What PACKAGE-ELABORATE means (judgments design L4)

From judgments design section 5:

| Token | Layer | Meaning |
|-------|-------|---------|
| `PARTIAL-STRUCTURAL` | L0 | Seed imports + key decls (living floor) |
| `FOUNDATION-KIND-SURFACE` | L1 / L1b | Kind / readiness tokens on named band |
| `TERM-SURFACE` | L2 | Unit def/inductive dialect (Mult..Extract done) |
| `PROOF-SURFACE` | L3 | Named *Theorems proof dialect (Mult/Linear/Types done) |
| **`PACKAGE-ELABORATE`** | **L4** | Package-scope elaborate bar toward J1-J12 on seed |

L4 is **not** a re-list of unit dual-oks alone sold as package typecheck.
L4 is the package-scope judgment path: conjunction of living unit depth bars
**plus** package-level accept/reject evidence that unit greps alone do not
provide.

**Surface-matrix row Full classic elaborator parity stays open** until real
package dual-ok evidence + residual + lake proof say otherwise. First-slice
partial dual-ok does **not** move that row to measured.

**FullHostElaborateRemains stays false.** Cold full Lake remains bootstrap /
claim-proof / diagnostic, not day-to-day residual.

---

## 2. Evidence gates (carry-forward)

| Gate | Role for package L4 |
|------|---------------------|
| **E-good** | Named package-scope foundation inventory accepted by package dialect |
| **E-bad** | Incomplete package inventory twin rejected; L0 package tokens alone would still accept |
| **E-lake** | Cold `lake build` HostModuleCheck family + HostResidualShrink + exe exit 0 |
| **E-without-lake** | `just host-module-check-without-lake` exit 0 on seed=206 |
| **E-dual-pin** | HostModuleCheck + HostResidualShrink + just / pure Nix agree on PACKAGE-ELABORATE bar, first-band scope, dualOk |
| **E-sub1kloc** | All touched HostModuleCheck*.lean / HostResidualShrink under 1000 |
| **E-hygiene** | `just hygiene` green |
| **E-no-forge** | FullHostElaborateRemains **false**; free/complete/PROVABLY **unchanged**; Mult..Extract TERM + Mult/Linear/Types PROOF dual-ok **unchanged**; no full parity slogan |

**Rule:** dualOk claim pin may be true only when E-bad rejects land. Gate truth
is SurfaceOk / FirstBandOk fold (not bare dualOk alone). Grep-only dual-ok is
not enough when a claim bool flips; lake on PATH is required for dual-ok true.

---

## 3. First dual-ok band (this slice)

| Field | Choice |
|-------|--------|
| **Band name** | Mult..Extract foundation (package-scope) |
| **Scope string** | `MultExtractFoundation-only` |
| **Depth bar** | `PACKAGE-ELABORATE` |
| **Why legitimate** | Package-level inventory dialect requires all eight foundation units listed with TERM-SURFACE dual-ok markers **and** living unit SurfaceOk conjunction **and** package-level E-bad reject of incomplete inventory. Not "AND of dualOk pins" alone without package fixture reject. |
| **Not claimed** | Full seed J1-J12; Kernel/Emit/Parity package band; full PROOF package conjunction; surface-matrix parity measured; package L4 complete |

### 3a. Package foundation inventory dialect (documented)

Package fixture text (not a seed module path) must contain:

1. `packageBand: Mult..Extract-foundation`
2. `packageElaborateBar: PACKAGE-ELABORATE`
3. One line per unit: `unit <Name> TERM-SURFACE dualOk` for Mult, Linear, Types,
   IrProgram, IrGraph, HostCompose, Erasure, Extract
4. `packageFirstBandReady: true`

### 3b. E-good / E-bad twins

| Twin | Mutation | L0 package tokens | Package dialect |
|------|----------|-------------------|-----------------|
| E-good | Complete Mult..Extract foundation inventory | accept | accept |
| PB1 | Drop `unit Extract TERM-SURFACE dualOk` | accept (still has packageBand + PACKAGE-ELABORATE) | reject `PACKAGE-BAND-INCOMPLETE` |
| PB2 | `packageFirstBandReady: false` | accept | reject `PACKAGE-BAND-INCOMPLETE` |

### 3c. Gate fold (FirstBandOk)

```
hostModuleCheckPackageElaborateFirstBandDualOk
  && bar == PACKAGE-ELABORATE
  && scope == MultExtractFoundation-only
  && Mult..Extract TERM SurfaceOk (eight unit gates)
  && package dialect E-good
  && PB1/PB2 dialect reject
  && PB1/PB2 L0 still accept
```

---

## 4. PROOF package band (second dual-ok band -- closed 2026-08-09)

| Field | Choice |
|-------|--------|
| **Band name** | MultLinearTypes PROOF package (package-scope) |
| **Scope string** | `MultLinearTypesProof-only` |
| **Depth bar** | `PACKAGE-ELABORATE` |
| **Why legitimate** | Package-level PROOF inventory requires MultTheorems + LinearTheorems + TypesTheorems PROOF-SURFACE dualOk markers **and** living unit SurfaceOk conjunction **and** package-level E-bad reject of incomplete inventory. L0 package tokens alone accept incomplete lists. |
| **Not claimed** | Full seed J1-J12; Kernel/Emit/Parity package band; surface-matrix parity measured; package L4 complete |

### 4a. Package proof inventory dialect

Package fixture text (not a seed module path) must contain:

1. `packageBand: MultLinearTypes-proof`
2. `packageElaborateBar: PACKAGE-ELABORATE`
3. One line per unit: `unit <Name> PROOF-SURFACE dualOk` for MultTheorems, LinearTheorems, TypesTheorems
4. `packageProofBandReady: true`

### 4b. E-good / E-bad twins (PROOF band)

| Twin | Mutation | L0 package tokens | Package dialect |
|------|----------|-------------------|-----------------|
| E-good | Complete MultLinearTypes PROOF inventory | accept | accept |
| PP1 | Drop `unit TypesTheorems PROOF-SURFACE dualOk` | accept | reject `PACKAGE-BAND-INCOMPLETE` |
| PP2 | `packageProofBandReady: false` | accept | reject `PACKAGE-BAND-INCOMPLETE` |

### 4c. Gate fold (ProofBandOk)

```
hostModuleCheckPackageElaborateProofBandDualOk
  && bar == PACKAGE-ELABORATE
  && scope == MultLinearTypesProof-only
  && Mult/Linear/Types PROOF SurfaceOk (three unit gates)
  && package proof dialect E-good
  && PP1/PP2 dialect reject
  && PP1/PP2 L0 still accept
```

First-band MultExtractFoundation dual-ok and unit TERM/PROOF dual-ok stay
**unchanged**.

---

## 5. Kernel/Emit/Parity package band (third dual-ok band -- closed 2026-08-09)

| Field | Choice |
|-------|--------|
| **Band name** | KernelEmitParity kind package (package-scope) |
| **Scope string** | `KernelEmitParity-only` |
| **Depth bar** | `PACKAGE-ELABORATE` |
| **Why legitimate** | Package-level FOUNDATION-KIND-SURFACE inventory requires Kernel Mult..Emit + EmitPlan/Apply/Body + Parity Mult..Emit dualOk markers **and** living deepen bar/band includes those units **and** package-level E-bad reject of incomplete inventory. L0 package tokens alone accept incomplete lists. Uses existing kind-surface dual-ok (not new unit TERM/PROOF dual-ok). |
| **Not claimed** | Full seed J1-J12; surface-matrix parity measured; package L4 complete |

### 5a. Package kind inventory dialect

Package fixture text (not a seed module path) must contain:

1. `packageBand: KernelEmitParity-kind`
2. `packageElaborateBar: PACKAGE-ELABORATE`
3. One line per unit: `unit <Name> FOUNDATION-KIND-SURFACE dualOk` for KernelMult, KernelLinear, KernelTypes, KernelProgram, KernelEmit, EmitPlan, EmitApply, EmitBody, ParityMult, ParityLinear, ParityTypes, ParityProgram, ParityEmit
4. `packageKernelEmitParityBandReady: true`

### 5b. E-good / E-bad twins (Kernel band)

| Twin | Mutation | L0 package tokens | Package dialect |
|------|----------|-------------------|-----------------|
| E-good | Complete KernelEmitParity kind inventory | accept | accept |
| PK1 | Drop `unit ParityEmit FOUNDATION-KIND-SURFACE dualOk` | accept | reject `PACKAGE-BAND-INCOMPLETE` |
| PK2 | `packageKernelEmitParityBandReady: false` | accept | reject `PACKAGE-BAND-INCOMPLETE` |

### 5c. Gate fold (KernelBandOk)

```
hostModuleCheckPackageElaborateKernelBandDualOk
  && bar == PACKAGE-ELABORATE
  && scope == KernelEmitParity-only
  && deepen bar FOUNDATION-KIND-SURFACE + Kernel/Emit/Parity units on deepen band
  && package kernel dialect E-good
  && PK1/PK2 dialect reject
  && PK1/PK2 L0 still accept
```

Prior MultExtractFoundation + MultLinearTypesProof dual-ok and unit TERM/PROOF
dual-ok stay **unchanged**.

---

## 6. Remaining L4 (after Kernel band)

| Remaining | Goal sketch |
|-----------|-------------|
| Real J5-J12 package environment | Beyond inventory dialect toward Lake-grade package typecheck |
| Surface-matrix Full classic elaborator parity | **present-partial** after multi-band inventory (2026-08-09); **measured** only with M4 real package judgments / seed-wide L4 + lake; never automatic from inventory alone |
| Seed-wide L4 dual-ok | All seed modules under package elaborate bar |
| M4 real package judgments | Beyond inventory dialect; see `full-classic-elaborator-parity-measured-bar-2026-08-09.md` |

---

## 7. Pin honesty (after Kernel band)

| Pin | Living tip |
|-----|------------|
| FullHostElaborateRemains | **false** (unchanged) |
| free / complete / PROVABLY | **unchanged** |
| DualResidual free dual-ok | **unchanged** |
| Mult..Extract TERM dual-ok | **unchanged** (still Mult-only .. Extract-only) |
| Mult/Linear/Types PROOF dual-ok | **unchanged** (unit scope) |
| PACKAGE-ELABORATE first-band dual-ok | **true** (MultExtractFoundation-only; FirstBandOk E-bad fold) |
| PACKAGE-ELABORATE PROOF-band dual-ok | **true** (MultLinearTypesProof-only; ProofBandOk E-bad fold) |
| PACKAGE-ELABORATE Kernel-band dual-ok | **true** (KernelEmitParity-only; KernelBandOk E-bad fold) |
| Full classic elaborator parity | **present-partial** (surface-matrix 2026-08-09; not measured; next M4 real judgments path) |
| seed modules | **206** |
| harness | **40** (PackageElab companion extended; no new harness module) |

---

## 8. Non-claims

- Does **not** claim package L4 complete or full seed J1-J12
- Does **not** re-true FullHostElaborateRemains
- Does **not** flip free / complete / PROVABLY / DualResidual free
- Does **not** claim full classic elaborator parity or mathlib
- Does **not** sell unit dual-ok re-list alone as L4 done
- Does **not** invent TERM/PROOF dual-ok without E-bad on those units
- Does **not** grow shell/Python product mills

---

## 9. Pointers

| Artifact | Role |
|----------|------|
| This note | Package L4 entry + first + PROOF + Kernel band evidence path |
| `real-elaborator-judgments-design-2026-08-08.md` | Judgment classes L0-L4 SSoT |
| `plan-fullhost-gap-close-2026-08-08.md` | FullHost false; parity checklist |
| `HostModuleCheckPackageElab.lean` | First + PROOF + Kernel dual-pin companion |
| `surface-matrix.md` | Full classic elaborator parity **present-partial** (not measured) |
| Residual Open / Done | `RESIDUAL-systems.md` Package elaborate real judgments path (next); present-partial Done |
| Measured bar reseed | `doc/dev/research/full-classic-elaborator-parity-measured-bar-2026-08-09.md` |
| Report Kernel band | `.agents/reports/impl-package-elaborate-l4-kernel-emit-parity-2026-08-09.md` |
| Report PROOF band | `.agents/reports/impl-package-elaborate-l4-remaining-2026-08-09.md` |
| Report present-partial | `.agents/reports/impl-full-classic-elaborator-parity-measured-2026-08-09.md` |
