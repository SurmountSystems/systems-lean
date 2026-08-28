# Report: U2 Package env seed expand after new TERM (2026-08-11)

## Verdict

**GREEN.** H2 package-env grown for all **11** U1 TERM units (Emit*Scaffold x9 +
KernelSelfApply + ProductOutKernel). Soft J5 + E-good/E-bad PE28..PE38 + dual-ok
gate. Sub-1-KLOC enforced via long-file split **before** growth past 1000.
free / complete / PROVABLY **true** unchanged; FullHostElaborateRemains **false**;
DominanceClaimed **false**.

## Done when checklist

| # | Requirement | Status |
|---|-------------|--------|
| 1 | 11 units: E-good / E-bad PE + dual-ok env gate | **yes** PE28..PE38 |
| 2 | Sub-1-KLOC: split PackageEnv before >1000 | **yes** Evidence + FixturesU2 |
| 3 | LoadOk / RealModule / HostResidualShrink lockstep | **yes** |
| 4 | pure Nix host-presence for new modules | **yes** (291 paths) |
| 5 | free/complete/PROVABLY true; FullHost false; Dominance false | **yes** |
| 6 | without-Lake verify + hygiene | **yes** |
| 7 | Residual lockstep U2 done; WATCHER next U3 | **yes** |
| 8 | This report path | **yes** |

## Eleven package-env bands

| # | Unit | PE | Companion TERM | E-bad twin | needImport |
|---|------|-----|----------------|------------|------------|
| 1 | EmitMultScaffold | PE28 | HostModuleCheckEmitMultScaffoldTerm | stageId | Mult |
| 2 | EmitLinearScaffold | PE29 | HostModuleCheckEmitLinearScaffoldTerm | stageId | optional |
| 3 | EmitTypesScaffold | PE30 | HostModuleCheckEmitTypesScaffoldTerm | stageId | optional |
| 4 | EmitProgramScaffold | PE31 | HostModuleCheckEmitProgramScaffoldTerm | stageId | optional |
| 5 | EmitGraphScaffold | PE32 | HostModuleCheckEmitGraphScaffoldTerm | stageId | optional |
| 6 | EmitComposeScaffold | PE33 | HostModuleCheckEmitComposeScaffoldTerm | stageId | optional |
| 7 | EmitErasureScaffold | PE34 | HostModuleCheckEmitErasureScaffoldTerm | stageId | optional |
| 8 | EmitExtractScaffold | PE35 | HostModuleCheckEmitExtractScaffoldTerm | stageId | optional |
| 9 | EmitBannerScaffold | PE36 | HostModuleCheckEmitBannerScaffoldTerm | stageId | optional |
| 10 | KernelSelfApply | PE37 | HostModuleCheckKernelSelfApplyTerm | stageId | optional |
| 11 | ProductOutKernel | PE38 | HostModuleCheckProductOutKernelTerm | stageId | optional |

Scope (living tip):
`MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelEnv-only`

Gate: `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk).
E-good: `hostModuleCheckGoodPackageEnvU2Text` = prior Mult..ParityEmit good ++ `packageEnvU2ModulesGood`.
Dialect tail: `checkPackageEnvDialectU2` after ParityEmit soft J5.

One stageId twin per U2 unit (KernelMult PE13 style), not stageId+ready duals, to
keep FixturesU2 under 1000.

## LOC before / after split

| Module | Before U2 | After U2 | Role |
|--------|-----------|----------|------|
| HostModuleCheckPackageEnv.lean | **954** | **611** | dialect + helpers + surfaceOk + dialectOk |
| HostModuleCheckPackageEnvEvidence.lean | (new) | **650** | PE1..PE38 rejects/L0 + Ok + native_decide |
| HostModuleCheckPackageEnvFixtures.lean | **802** | **802** | Mult..ParityEmit builders + PE1..PE27 |
| HostModuleCheckPackageEnvFixturesU2.lean | (new) | **390** | U2 goods + PE28..PE38 texts |

All four under **1000**.

## Wire-up

| Surface | Change |
|---------|--------|
| HostModuleCheckPackageEnv | U2 dialect tail; scope; surfaceOk x11; dialectOk uses U2 good |
| HostModuleCheckPackageEnvEvidence | PE1..PE38 folds; Ok gate; theorems |
| HostModuleCheckPackageEnvFixtures | packageBand header U2 string |
| HostModuleCheckPackageEnvFixturesU2 | packageEnvU2ModulesGood + PE28..PE38 |
| HostModuleCheck / LoadOk / Driver | import Evidence (+ FixturesU2 on hub) |
| HostResidualShrink (+ Theorems) | scope; harness list; seed=206+Main=59+harness=**78** |
| just/host.just | scope greps; harness 78; harness module list |
| just/host-without-lake.just | scope; PE tokens; family_mods Fixtures/U2/Evidence |
| nix host-leans / required-files / host-specs-compile-path-3 | new modules + presence |

Harness partition: **76 -> 78** (+ FixturesU2 + Evidence). Seed **206** unchanged.
TERM dual-ok **32** unchanged (U1).

## Pins (unchanged claim story)

| Pin | Value |
|-----|-------|
| free / residualFreeClaimed | **true** |
| complete / freestandingProductSelfHostComplete | **true** |
| PROVABLY / provablyUnlocked | **true** |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / Main / harness | **206** / **59** / **78** |
| package-env | Mult..ParityEmit + **U2** Emit*Scaffold + KernelSelfApply + ProductOutKernel |
| TERM dual-ok | **32** |

## Verify

| Path | Command | Result |
|------|---------|--------|
| Lake FixturesU2 | `lake build SystemsLean.HostModuleCheckPackageEnvFixturesU2` | **GREEN** |
| Lake PackageEnv | `lake build SystemsLean.HostModuleCheckPackageEnv` | **GREEN** |
| Lake Evidence | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` | **GREEN** (~8s native_decide) |
| Lake LoadOk / Shrink / hub | `lake build ...LoadOk HostResidualShrink* HostModuleCheck` | **GREEN** |
| Pure Nix host presence | `just systems-host` | **GREEN** (291 required paths) |
| Host residual shrink | `just host-residual-shrink` | **GREEN** (FullHost false; free dual-ok) |
| Host module check without Lake | `just host-module-check-without-lake` | **GREEN** (modules=206 PARTIAL-STRUCTURAL) |
| Hygiene | `just hygiene` | **GREEN** |

## Residual / WATCHER

- `RESIDUAL-systems.md`: U2 **done**; U3 open; Done archive row
- `RESIDUAL.md` join board: U2 done; harness **78**; next U3
- `WATCHER.md`: next implement **U3** FullHost meet
- `doc/SESSION-HANDOFF.md`: living tip harness 78; package-env U2; U2 done

## Out of scope (honored)

- No invented units beyond the 11
- No FullHost flip
- No seed-wide 206 complete claim
- No Dominance / mathlib
- No product C/shell
- No git commit / git add

## Next U3 prompt (WATCHER)

```
/implement --effort 2 U3 FullHost meet progress flip-or-partial. Goal: reseed H1-H8 after U1/U2; flip FullHostElaborateRemains only if bar met + lake; else FULLHOST_FLIP=no with reasons. Done when: inventory reseed; H1-H8 table; flip yes only with bar+lake OR no with reasons; residual lockstep; free/complete/PROVABLY true; FullHostElaborateRemains false unless flip justified; report .agents/reports/impl-fullhost-meet-u3-2026-08-11.md. Out of scope: grep-only FullHost true; mathlib day-one; forge free/complete/PROVABLY. Paths: doc/dev/research/c2-fullhost-bar-criteria*; fullhost-meet-inventory; HostResidualShrink*; residual / WATCHER / handoff.
```
