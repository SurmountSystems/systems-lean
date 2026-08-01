# SelfApplyFs dual-pin thin batch 9 inventory (B10 ProductPathPerformStep)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b9.md` (ephemeral)

## Family

**B10 ProductPathPerformStep** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathPerformStep`. Living tip keeps
`productPathPerformInstallLakeFreeEntrypointClaimed := true` honesty pin and the
thin chain fold `productPathPerformStepPartialReady`. Living perform claimed /
DependsOnLake / remains / ownership claimed stay on tip (B9/B8/B4). B11+ untouched.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true` | Living B10 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `theorem productPathPerformInstallLakeFreeEntrypointClaimed_true` | host-presence tip + honesty |
| `def productPathPerformStepPartialReady` | Chain fold: B9 perform && home STEP PartialReady && remains && ownership && perform claimed && DependsOnLake && InstallLakeFreeEntrypointClaimed |
| `theorem productPathPerformStepPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathPerformStepPartialReady = true` | host-presence tip |
| `example : productPathPerformInstallLakeFreeEntrypointClaimed = true` | host-presence tip |
| complete + remains + ownership + perform + DependsOnLake + B9 PartialReady re-smokes in B10 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathPerformStep` / string `ProductPathPerformStep` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-PERFORM-STEP`, `product path perform step` | fold doc / host-presence tip |
| B11+ `productPathPerformStepPartialReady` chain uses | later family folds (untouched) |
| B9 perform claimed + DependsOnLake tip pins | prior family (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathPerformStepStageId` | `ProductPathPerformStep.stageId` |
| `hostProductPathPerformStepId` | `ProductPathPerformStep.hostId` |
| `selfHostProductPathPerformStepId` | `ProductPathPerformStep.selfHostId` |
| `productPathPerformStepModuleCite` | `ProductPathPerformStep.stepModuleCite` (name differs; home string value same) |
| `productPathPerformInstallLakeFreeEntrypointRecipe` tip string | same name on home |
| `productPathPerformStepOk` tip alias | home Bool bulk (`productPathPerformStepOk`) |
| 6 B10 stage/recipe/moduleCite/Ok examples (kept InstallLakeFreeClaimed + PartialReady + claim chain) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathPerformStepPartialReady` | chain fold (B9 && home && remains && claims && DependsOnLake && InstallLakeFree) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `productPathPerformInstallLakeFreeEntrypointClaimed` | tip living honesty true | land-time honesty true |
| `SELF-HOST-PRODUCT-PATH-PERFORM-STEP` | fold comments | hostId / surface |
| perform claimed / DependsOnLake / remains / ownership | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: install-freestanding-c-out process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed
- B11 READ and later families
- InstallStepLakeFreeCapable (already home-only after earlier splits; not re-added on tip)
- short-name track

## Gate-first edits (batch 9)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/gap strings; keep PartialReady + InstallLakeFreeClaimed true + claim chain + ProductPathPerformStep + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home + stepModuleCite + recipe + stageId/hostId/selfHostId + gap* + FREESTANDING-PERFORM-GAP-* |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B10 list shrink to fold/InstallLakeFree/theorem/example; home ProductPathPerformStep expanded |
| `SelfApplyFs.lean` | Delete B10 historical defs + stage/recipe/Ok examples; thin B10 section + header inventory; keep InstallLakeFreeClaimed + fold |
| `ProductPathPerformStep.lean` | Header note dual-pin thin batch 9 (no new living claim true defs) |

## Line counts (batch 9)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5283 | 5245 | -38 |
| ProductPathPerformStep.lean | 148 | ~153 | +header |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathPerformInstallLakeFreeEntrypointClaimed true (tip + home land-time)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- ProductPathPerformStep: no living-tip complete/perform/ownership true defs

## Lessons

1. B10 tip fold already used home `ProductPathPerformStep.productPathPerformStepPartialReady` plus bare tip remains + claims + DependsOnLake + InstallLakeFreeEntrypointClaimed; tip Ok alias and stage/recipe/moduleCite were dual-pin theater.
2. Home moduleCite name is `stepModuleCite` (not tip's old `productPathPerformStepModuleCite`); gate home tokens use home name.
3. Tip `productPathPerformInstallLakeFreeEntrypointClaimed` must stay: fold uses bare tip name; emit-wire/hostSpecs require tip literal `def ... := true` (safer default, same as perform claimed on B9).
4. Recipe tip string was only dual-pin + smoke; home owns recipe + justfile structural scan covers install-freestanding-c-out.
5. Critical: do not move living perform/ownership/complete claimed true off tip; emit-wire forbids those true defs on home.
6. B11 READ dual-pin block left untouched (next batch 10).
7. Next family: B11 ProductPathReadSsot (plan section 8).
