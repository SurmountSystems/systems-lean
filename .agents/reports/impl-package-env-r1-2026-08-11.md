# Implement report: Package env seed expand (R1 honest stop)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env seed expand (R1 -- next real band after ParityEmit)
Status: **GREEN** (evidence-based honest stop; no next real unit band)

## Goal

Grow FullHost meet **H2** package-env beyond Mult..ParityEmit with the next
**real** product unit band only. FullHostElaborateRemains stays **false**.
No free/complete/PROVABLY flip. Not seed-wide 206 complete.

Done when allows: inventory + land next real band(s) **or** honest stop when no
next real unit with TERM dialect exists (still GREEN with evidence).

## Inventory (criterion 1)

### Pattern for a real package-env band

From W1 / T1 / N1 / prior seed expand reports, a package-env band needs:

1. A **real** product unit module under `SystemsLean.*` (not invented)
2. A **TERM** companion dialect (`HostModuleCheck*Term`) for soft **J5**
3. Soft **J2** import resolve into the multi-module fixture
4. E-good multi-module text + E-bad twins (ILL-TYPED-TERM and/or PACKAGE-ENV-INCOMPLETE)
5. Gate fold into `hostModuleCheckPackageElaborateEnvOk` + HostResidualShrink scope mirror

Without a unit TERM dialect, soft J5 cannot honestly reject ILL-TYPED-TERM at
package scope. Scaffold-only sections (CompilePath, EmitMult) exist only to
resolve imports for later TERM units.

### Living package-env tip (W1 closed)

Scope:
`MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEnv-only`

| Surface | Status |
|---------|--------|
| PackageEnv | **954** lines (under 1000) |
| Fixtures | **802** lines (under 1000) |
| Gate | `hostModuleCheckPackageElaborateEnvOk` dual-ok |
| PE twins | PE1..PE27 + PE2 + PE3 (from W1) |
| Seed / harness | **206** / **61** |

### Units with unit TERM (harness path) -- all already in package-env

| Unit | TERM companion | Package-env band |
|------|----------------|------------------|
| Mult | HostModuleCheckMultTerm | yes (foundation) |
| Linear | HostModuleCheckLinearTerm | yes |
| Types | HostModuleCheckTypesTerm | yes |
| IrProgram | HostModuleCheckIrProgramTerm | yes |
| IrGraph | HostModuleCheckIrGraphTerm | yes |
| HostCompose | HostModuleCheckHostComposeTerm | yes |
| Erasure | HostModuleCheckErasureTerm | yes |
| Extract | HostModuleCheckExtractTerm | yes |
| EmitPlan | HostModuleCheckEmitPlanTerm | yes |
| EmitApply | HostModuleCheckEmitApplyTerm | yes |
| EmitBody | HostModuleCheckEmitBodyTerm | yes |
| KernelMult | HostModuleCheckKernelMultTerm | yes (P1) |
| KernelLinear | HostModuleCheckKernelLinearTerm | yes |
| KernelTypes | HostModuleCheckKernelTypesTerm | yes |
| KernelProgram | HostModuleCheckKernelProgramTerm | yes |
| KernelEmit | HostModuleCheckKernelEmitTerm | yes |
| ParityMult | HostModuleCheckParityMultTerm | yes (prior R1) |
| ParityLinear | HostModuleCheckParityLinearTerm | yes (N1) |
| ParityTypes | HostModuleCheckParityTypesTerm | yes (T1) |
| ParityProgram | HostModuleCheckParityProgramTerm | yes (W1) |
| ParityEmit | HostModuleCheckParityEmitTerm | yes (W1) |

**Count:** 21 TERM dual-ok product units. **All 21** are soft-J5 members of the
living Mult..ParityEmit package-env fixture. There is **no** leftover TERM unit
waiting for a package-env band after ParityEmit.

### Scaffold-only (import resolve; not soft-J5 bands)

| Module section | Role |
|----------------|------|
| CompilePath | Kernel* import scaffold |
| EmitMult | ParityMult / ParityEmit import scaffold |

No `HostModuleCheckEmitMultTerm` (or EmitLinear/Types/Program/Graph/Compose/Erasure/Extract/Banner Term).

### L0-only vs package-env (seed 206 honesty)

Seed: **206** modules (`hostModuleCheckSeedModules`). Non-theorems ~142; Theorems ~64.

| Class | Coverage | Package-env? |
|-------|----------|--------------|
| Mult..Extract + EmitPlan/Apply/Body + Kernel Mult..Emit + Parity Mult..Emit | Unit TERM + multi-module package-env | **yes** (living tip) |
| Mult/Linear/Types + Kernel Mult..Emit Theorems | Unit **PROOF** L3 (not package-env J5) | no (PROOF surface; separate ladder) |
| EmitMult product + EmitLinear/Types/Program/Graph/Compose/Erasure/Extract/Banner | RealModule L0 structural only | no (no TERM dialect) |
| Emit* Scaffold modules | L0 scaffold surfaces | scaffold only where listed above |
| CompilePath + CompilePath Mult..Extract | L0 structural | scaffold CompilePath only |
| KernelSelfApply + Theorems | L0 | no |
| SelfApply / SelfHost / ProductOutKernel (+ theorems) | L0 | no |
| ProductPath* / Capable* / DualEq* / Official* / Ownership* / Perform* / StepContract* / InstallOut / FreestandingEmit* / HostPackage* / HostFront* / HostGraph* / HostTerm / HostCheck / HostImportGraph* / HostModuleCheck* / HostResidualShrink* / DualResidual / SurfaceMatrix / SpecProof / ProbeWire / BootstrapHonesty / LakeRetireInventory / FirstSurface / Subset* / Foreign* / Llvm* / RustIrInterop / RuntimeBenchLean / SelfApplyFs / ProductWireWriteTool / ... | L0 structural (or dedicated surface checks, not package-env J5) | **no** |

**Verdict:** after ParityEmit, **zero** real product units have both (a) a TERM
dialect and (b) missing package-env membership. Next package-env growth requires
a **prior** TERM residual on a real L0 unit (e.g. EmitLinear TERM, KernelSelfApply
TERM, or another named real unit). Inventing a unit or forging soft J5 without a
TERM companion is out of scope.

### Sub-1-KLOC

| Module | Lines | Action |
|--------|-------|--------|
| HostModuleCheckPackageEnv.lean | **954** | no grow; under 1000 |
| HostModuleCheckPackageEnvFixtures.lean | **802** | no grow; under 1000 |

No helper split this slice (no band growth to force LOC). Future TERM-then-env
bands should split helpers **before** PackageEnv crosses 1000.

## What landed (product Lean)

**No package-env product Lean band.** Honest stop after inventory.

Pins verified unchanged (read, not flipped):

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** |
| hostModuleCheckPackageElaborateEnvDualOk | **true** (unchanged Mult..ParityEmit) |
| DominanceClaimed / band FullBackend | **false** (untouched) |
| seed / harness | **206** / **61** |

## Residual / docs (this slice)

| Surface | Change |
|---------|--------|
| RESIDUAL-systems.md | R1 Status **done** (honest stop); Done archive row; Open tip R1 closed |
| RESIDUAL.md | Systems Open join: R1 **done**; Highest value next shifts to R2 + parallel R3-R5 |
| WATCHER.md | R1 done; remaining R2-R5; next `/implement` favors R2 after R1 (R3/R4/R5 parallel-capable) |
| doc/SESSION-HANDOFF.md | Active tip: R1 honest stop done; R2-R5 still open |
| this report | `.agents/reports/impl-package-env-r1-2026-08-11.md` |

R2-R5 left for other agents / next implement (surgical R1 only).

## Gates

| Gate | Result |
|------|--------|
| Inventory evidence (TERM list vs package-env imports/scope) | **done** (this report) |
| PackageEnv / Fixtures LOC | 954 / 802 under 1000 |
| FullHost false / free complete PROVABLY true | verified on disk |
| `just hygiene` | **GREEN** exit 0 (source-hygiene + professional-tone) |
| `just systems-host` | **RED** concurrent lag (not R1 product Lean): pure Nix still greps `hostModuleCheckGoodProductPathPerformText` on FixtureTexts, `hostModuleCheckGoodSelfApplyTheoremsText` on FixtureTextsLater, `loadAndCheckRealModule` on Driver, while defs live in FixtureTextsProduct / FixtureTextsSelfHost / DriverIO after mid-flight **R5** long-file split. Package-env Mult..ParityEmit tokens and PackageEnv modules unchanged by R1. |

No lake product rebuild required for no-Lean-band honest stop. R1 did not edit
product Lean or pure Nix host-presence. systems-host red is R5 residual wire-up
lag; do not race R5 on host-specs here.

## Non-claims

- Not package L4 complete / not seed-wide J1-J12 for 206
- Not FullHostElaborateRemains true (R2 owns flip-or-partial)
- Not free / complete / PROVABLY re-open
- Not invent EmitLinearTerm / KernelSelfApplyTerm / etc. (TERM residual would be a new Name)
- Not DominanceClaimed / band FullBackend forge
- Not mathlib / full Lean 4 core parity

## Residual status

**R1 done** (2026-08-11 honest stop). Living package-env tip remains Mult..**ParityEmit**
Env-only. Open remains **R2** (FullHost meet), **R3** (LLVM honesty), **R4**
(elaborator parity inventory), **R5** (host long-file split). H2 still **partial**
vs seed 206 (pilot Mult..ParityEmit package-env, not seed-wide).

## Why GREEN without a new band

Done when item 1 is inventory; item 2 is land next real band(s) **when they exist**.
The How clause: if no next real unit exists, document honest stop with inventory
of L0-only vs package-env covered -- still GREEN if evidence-based. This report is
that inventory + stop. Forging a soft-J5 band without a TERM companion would be
dishonest residual theater.
