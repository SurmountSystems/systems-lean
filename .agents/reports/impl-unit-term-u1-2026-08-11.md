# Report: U1 Host unit TERM expand (L0 real units) (2026-08-11)

## Verdict

**GREEN (done partial).** Landed **11** real L0 TERM companions this wave (9
`Emit*Scaffold` + `KernelSelfApply` + `ProductOutKernel`). TERM dual-ok total
**21 -> 32**. Harness **65 -> 76** (`seed=206+Main=59+harness=76`). free /
complete / PROVABLY **true**; FullHostElaborateRemains **false**; DominanceClaimed
**false**. Residual **U1 done partial** with remaining L0 candidate inventory
below (not invent; next growth **U2** package-env for the new TERM band, then
optional further L0 TERM).

Completeness goal for this wave: max **checkable real** L0 units with dialect
authority (scaffold emit SSOT + kernel self-apply + product-out kernel). Not a
single pilot then park. Not seed-wide 142 L0 TERM (product-path / subset / llvm
tool surface remains for later Named residual).

## Done when checklist

| # | Requirement | Status |
|---|-------------|--------|
| 1 | Inventory L0 real modules lacking TERM | **yes** (section Inventory) |
| 2 | Land max real units (Term + E-good/ILL twins + dualOk+SurfaceOk + RealModule refine + LoadOk + harness) | **yes** 11 units |
| 3 | free/complete/PROVABLY true; FullHost false; Dominance false | **yes** (gates) |
| 4 | Residual U1 done or done partial + remaining list | **done partial** |
| 5 | This report path | **yes** |

## Inventory (pre-U1 L0 lacking TERM)

Prior TERM dual-ok (**21**): Mult, Linear, Types, IrProgram, IrGraph, HostCompose,
Erasure, Extract, EmitPlan, EmitApply, EmitBody, KernelMult, KernelLinear,
KernelTypes, KernelProgram, KernelEmit, ParityMult, ParityLinear, ParityTypes,
ParityProgram, ParityEmit.

**Checkable real L0 candidates landed this wave (11):**

| Unit (L0 product module) | Companion | Why real / checkable |
|--------------------------|-----------|----------------------|
| `SystemsLean.EmitMultScaffold` | `HostModuleCheckEmitMultScaffoldTerm` | Host emit authority Mult SSOT |
| `SystemsLean.EmitLinearScaffold` | `HostModuleCheckEmitLinearScaffoldTerm` | Host emit authority Linear SSOT |
| `SystemsLean.EmitTypesScaffold` | `HostModuleCheckEmitTypesScaffoldTerm` | Host emit authority Types SSOT |
| `SystemsLean.EmitProgramScaffold` | `HostModuleCheckEmitProgramScaffoldTerm` | Host emit authority Program SSOT |
| `SystemsLean.EmitGraphScaffold` | `HostModuleCheckEmitGraphScaffoldTerm` | Host emit authority Graph SSOT |
| `SystemsLean.EmitComposeScaffold` | `HostModuleCheckEmitComposeScaffoldTerm` | Host emit authority Compose SSOT |
| `SystemsLean.EmitErasureScaffold` | `HostModuleCheckEmitErasureScaffoldTerm` | Host emit authority Erasure SSOT |
| `SystemsLean.EmitExtractScaffold` | `HostModuleCheckEmitExtractScaffoldTerm` | Host emit authority Extract SSOT |
| `SystemsLean.EmitBannerScaffold` | `HostModuleCheckEmitBannerScaffoldTerm` | Host emit authority Banner SSOT |
| `SystemsLean.KernelSelfApply` | `HostModuleCheckKernelSelfApplyTerm` | Real kernel self-apply unit |
| `SystemsLean.ProductOutKernel` | `HostModuleCheckProductOutKernelTerm` | Real product-out kernel unit |

**Skipped intentionally (not invent / not double-dialect):**

| Class | Modules | Reason |
|-------|---------|--------|
| Plan/Apply/Body scaffolds | EmitPlanScaffold, EmitApplyScaffold, EmitBodyScaffold | Product `EmitPlan` / `EmitApply` / `EmitBody` already have TERM dual-ok |
| Emit product shells | EmitMult, EmitLinear, EmitTypes, EmitProgram, EmitGraph, EmitCompose, EmitErasure, EmitExtract, EmitBanner | Shells; dialect authority lives on *Scaffold (U1 target) |
| Freestanding load scaffold | FreestandingEmitLoadScaffold | Load glue, not unit dialect body |

## Units landed (detail)

Each companion follows the established pattern (`HostModuleCheckParityEmitTerm` /
`Kernel*Term` reports):

- TERM-SURFACE scope `Unit-only`
- E-good accept fixture + ILL-TYPED-TERM twins (L0 structural may still accept)
- `dualOk` + `SurfaceOk` mirrors in `HostResidualShrink`
- `checkRealModule` refine hook on the real module name
- LoadOk SurfaceOk fold (AcceptsGoods path)
- Harness list entry (ImportGraph family + HostModuleCheck*Term)

| # | Companion module | Scope | RealModule refine | dualOk def |
|---|------------------|-------|-------------------|------------|
| 1 | HostModuleCheckEmitMultScaffoldTerm | EmitMultScaffold-only | yes | hostModuleCheckEmitMultScaffoldTermSurfaceDualOk |
| 2 | HostModuleCheckEmitLinearScaffoldTerm | EmitLinearScaffold-only | yes | hostModuleCheckEmitLinearScaffoldTermSurfaceDualOk |
| 3 | HostModuleCheckEmitTypesScaffoldTerm | EmitTypesScaffold-only | yes | hostModuleCheckEmitTypesScaffoldTermSurfaceDualOk |
| 4 | HostModuleCheckEmitProgramScaffoldTerm | EmitProgramScaffold-only | yes | hostModuleCheckEmitProgramScaffoldTermSurfaceDualOk |
| 5 | HostModuleCheckEmitGraphScaffoldTerm | EmitGraphScaffold-only | yes | hostModuleCheckEmitGraphScaffoldTermSurfaceDualOk |
| 6 | HostModuleCheckEmitComposeScaffoldTerm | EmitComposeScaffold-only | yes | hostModuleCheckEmitComposeScaffoldTermSurfaceDualOk |
| 7 | HostModuleCheckEmitErasureScaffoldTerm | EmitErasureScaffold-only | yes | hostModuleCheckEmitErasureScaffoldTermSurfaceDualOk |
| 8 | HostModuleCheckEmitExtractScaffoldTerm | EmitExtractScaffold-only | yes | hostModuleCheckEmitExtractScaffoldTermSurfaceDualOk |
| 9 | HostModuleCheckEmitBannerScaffoldTerm | EmitBannerScaffold-only | yes | hostModuleCheckEmitBannerScaffoldTermSurfaceDualOk |
| 10 | HostModuleCheckKernelSelfApplyTerm | KernelSelfApply-only | yes | hostModuleCheckKernelSelfApplyTermSurfaceDualOk |
| 11 | HostModuleCheckProductOutKernelTerm | ProductOutKernel-only | yes | hostModuleCheckProductOutKernelTermSurfaceDualOk |

**TERM dual-ok total after U1: 32** (21 prior + 11).

## Wire-up

| Surface | Change |
|---------|--------|
| `HostModuleCheckRealModule.lean` | imports + refine for 11 modules |
| `HostModuleCheck.lean` / `SystemsLean.lean` | hub imports |
| `HostImportGraphLoadOk.lean` | SurfaceOk folds |
| `HostResidualShrink.lean` (+ Theorems) | dualOk mirrors; harness list; partition `seed=206+Main=59+harness=76` |
| `just/host.just` | dualOk greps; harness=76 |
| `just/host-without-lake.just` | family_mods U1 Term modules |
| `nix/systems-host-presence/` | host-leans, required-files, host-specs-compile-path-3 presence blocks |

Avoided racing `HostModuleCheckTheorems` (U7 long-file headroom already on disk;
Theorems ~668). New work is Term companions only.

## Remaining L0 without TERM (after U1)

Develop seed **206** modules; **142** non-Theorems L0; **32** with TERM; **110** still L0-only.

| Class | Count (approx) | Examples | Next residual |
|-------|----------------|----------|---------------|
| Core join / path | 4 | CompilePath, JoinMap, SelfHost, SurfaceMatrix | Optional L0 TERM Name |
| Product-path / capable cluster | ~35 | ProductPath*, Capable*, Official*, DualEq*, Perform*, Ownership* | Optional; claim-path not U1 dialect first class |
| CompilePath* unit slices | 10 | CompilePathMult..Extract | Optional after core CompilePath |
| Subset emit/rebuild / host tools | many | *SubsetEmit, *SubsetRebuild, HostFront, HostCheck, Llvm*Text | Tool surface; low TERM value unless Named |
| Other (SelfApply, DualResidual, SpecProof, etc.) | rest | InventoryClose, ProbeWire, SelfHostBody | Not U1 completeness class |
| Skipped scaffolds / emit shells | 13 | Plan/Apply/Body scaffolds; Emit* shells; FreestandingEmitLoadScaffold | See skip table |

**Next sequential product residual:** **U2** Package env seed expand for each U1
TERM unit (Emit*Scaffold + KernelSelfApply + ProductOutKernel package-env band).
**U3** FullHost meet reseed after U1/U2. Further L0 TERM is optional completeness,
not invent.

## Pins (unchanged claim story)

| Pin | Value | Notes |
|-----|-------|-------|
| free / residualFreeClaimed | **true** | no flip |
| complete / freestandingProductSelfHostComplete | **true** | no flip |
| PROVABLY / provablyUnlocked | **true** | no flip |
| FullHostElaborateRemains | **false** | no flip (U3 owns reseed) |
| DominanceClaimed / band FullBackend | **false** | no flip |
| seed / Main / harness | **206** / **59** / **76** | +11 Term modules |
| package-env | Mult..**ParityEmit** | U2 expands for U1 units |
| TERM dual-ok | **32** | was 21 |

## Verify (Slake preferred)

| Path | Command | Result |
|------|---------|--------|
| Pure Nix host presence | `just systems-host` | **GREEN** (289 required paths) |
| Host residual shrink | `just host-residual-shrink` | **GREEN** (FullHost false; free dual-ok) |
| Host module check without Lake | `just host-module-check-without-lake` | **GREEN** (modules=206 PARTIAL-STRUCTURAL) |
| Hygiene | `just hygiene` | **GREEN** |
| Lake (new Lean modules) | lake build of U1 Term + RealModule / LoadOk / Shrink / HostModuleCheck | **GREEN** (prior session) |

## Residual / WATCHER

- `RESIDUAL-systems.md`: U1 **done partial**; U2/U3 remain open
- `RESIDUAL.md` join board: U1 done partial; harness **76**
- `WATCHER.md`: next implement **U2** package-env
- `doc/SESSION-HANDOFF.md`: living tip harness 76; TERM 32; U1 done partial

## Out of scope (honored)

Invent fake units; FullHost flip (U3); package-env (U2); mathlib; git commit.
