# SelfApplyFs dual-pin thin batch 13 inventory (B14 Capable)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b13-2026-07-31.md` (ephemeral)

## Family

**B14 Capable** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.Capable` (Capable.lean). Living tip keeps InstallOnly / Read /
Compose / WriteHc / FullPerform honesty bools (fold + B16..B18 bare-name chain)
and the thin chain fold `productPathFreestandingCapablePartialReady`. Living
perform claimed / ownership claimed / DependsOnLake / remains / B13 WriteHc
PartialReady stay on tip (prior batches). B15+ untouched.

Tip start line count: **5117** (verified `wc -l` before thin).

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathFreestandingCapableInstallOnly : Bool := true` | B14 fold bare name; tip hostPin / hostSpecs require tip literal |
| `def productPathFreestandingCapableRead : Bool := true` | B14 fold + B16 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableCompose : Bool := true` | B17 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableWriteHc : Bool := true` | B18 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableFullPerform : Bool := false` | B14 fold bare name; honesty false hold; tip hostPin |
| theorems `*_true` / `FullPerform_false` for those five | host-presence tip + honesty |
| `def productPathFreestandingCapablePartialReady` | Chain fold: B13 WriteHc && home Capable PartialReady && remains && ownership && perform claimed && DependsOnLake && InstallOnly && Read && !FullPerform |
| `theorem productPathFreestandingCapablePartialReady_true` | host-presence + emit-wire tip hostPin |
| examples for InstallOnly/Read/Compose/WriteHc/FullPerform/PartialReady + claim chain | host-presence tip |
| complete + remains + ownership + perform + DependsOnLake + B13 PartialReady re-smokes in B14 smoke block | claim/honesty continuity |
| `import SystemsLean.Capable` / string `Capable` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP`, `product path freestanding capable gap` | fold doc / host-presence tip |
| B15+ `productPathFreestandingCapablePartialReady` chain uses | later family folds (untouched) |
| B13 WriteHcDependsOnLake + EntrypointClaimed + prior families | prior (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathFreestandingCapableStageId` | `Capable.stageId` |
| `hostCapableId` | `Capable.hostId` |
| `selfHostCapableId` | `Capable.selfHostId` |
| `productPathFreestandingCapableOrderedPipelineRecipe` | `Capable.orderedPipelineRecipe` |
| `productPathFreestandingCapableMeasureRecipe` | `Capable.justMeasureRecipe` |
| `productPathFreestandingCapableLakeExe` | `Capable.lakeExeName` |
| `productPathFreestandingCapableModuleCite` | home module name / header `Capable` |
| `productPathFreestandingCapableReadLakeFreeRecipe` | home same name |
| `productPathFreestandingCapableComposeLakeFreeRecipe` | home same name |
| `productPathFreestandingCapableWriteHcLakeFreeRecipe` | home same name |
| `productPathFreestandingCapableOk` tip alias | home `productPathFreestandingCapableOk` bulk |
| 8 B14 stage/host/recipe/exe/moduleCite/Ok/LakeFree examples (kept InstallOnly/Read/Compose/WriteHc/FullPerform/PartialReady + claim chain) | home examples / printGapMeasure |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathFreestandingCapablePartialReady` | chain fold (B13 && home && remains && claims && DependsOnLake && InstallOnly && Read && !FullPerform) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| InstallOnly / Read / Compose / WriteHc true | tip living honesty | land-time honesty true |
| FullPerform false | tip living honesty | land-time honesty false |
| `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP` | fold comments | hostId / surface |
| perform claimed / ownership / remains / B13 WriteHc* | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: freestanding-capable-gap / regenerate-product-path / Lake-free Capable* recipes (structural emit-wire scan stays)
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B13 WriteHc*
- B15 CAPABLE-STEP-CONTRACT and later families
- short-name track (Capable already short role name)
- CompilePath wall / hostSpecs CompilePath block
- self-host.md acceptance prose (still greps recipe/exe/stage as product surface docs)

## Gate-first edits (batch 13)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/moduleCite/LakeFreeRecipe/gap-token strings; keep PartialReady + InstallOnly/Read/Compose/WriteHc true + FullPerform false + claim chain + Capable + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home + stageId/hostId/selfHostId + justMeasureRecipe + lakeExeName + orderedPipelineRecipe + LakeFree recipes (already largely present; expand if thin) |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B14 list shrink to fold/honesty bools/theorem/example; home Capable expanded (LakeFree recipes + stageId/hostId/selfHostId/orderedPipeline) |
| `SelfApplyFs.lean` | Delete B14 historical defs + stage/recipe/Ok examples; thin B14 section + header inventory; keep InstallOnly/Read/Compose/WriteHc/FullPerform + fold |
| `Capable.lean` | Header note dual-pin thin batch 13 (no new living claim true defs) |

## Line counts (batch 13)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5117 | 4999 | -118 |
| Capable.lean | 256 | 258 | +2 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathFreestandingCapableInstallOnly true (tip + home land-time)
- productPathFreestandingCapableRead/Compose/WriteHc true (tip + home land-time)
- productPathFreestandingCapableFullPerform false (tip + home land-time)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- Capable: no living-tip complete/perform/ownership true defs

## Lessons

1. B14 tip fold already used home `Capable.productPathFreestandingCapablePartialReady` plus bare tip remains + claims + DependsOnLake + InstallOnly + Read + !FullPerform; tip Ok alias and stage/recipe/exe/moduleCite/LakeFreeRecipe were dual-pin theater.
2. Unlike B13 (only two living honesty bools), B14 keeps **five** living tip bools because B14 fold and B16..B18 folds use bare tip names for InstallOnly/Read/Compose/WriteHc/FullPerform.
3. Home moduleCite is the basename `Capable` (no separate `*ModuleCite` def on home); gate home tokens use stageId/hostId/selfHostId + lakeExeName + justMeasureRecipe.
4. Recipe/exe tip strings were only dual-pin + smoke; home owns recipe/exe + justfile structural scan covers freestanding-capable-gap / regenerate-product-path.
5. Critical: do not move living perform/ownership/complete claimed true off tip; emit-wire forbids those true defs on home.
6. B15 CAPABLE-STEP-CONTRACT dual-pin block left untouched (next batch).
7. Next family: B15 CapableStepContract (plan section continue dual-pin thin).
