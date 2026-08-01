# SelfApplyFs dual-pin thin batch 11 inventory (B12 ProductPathComposePlan)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b11-2026-07-31.md` (ephemeral)

## Family

**B12 ProductPathComposePlan** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathComposePlan`. Living tip keeps
`productPathPerformComposeDependsOnLake := true` and
`productPathPerformComposeEntrypointClaimed := true` honesty pins and the thin
chain fold `productPathPerformComposePartialReady`. Living perform claimed /
ownership claimed / DependsOnLake (perform) / remains / InstallLakeFree /
ReadDependsOnLake / ReadEntrypointClaimed stay on tip (prior batches). B13+
untouched.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathPerformComposeDependsOnLake : Bool := true` | Living B12 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `def productPathPerformComposeEntrypointClaimed : Bool := true` | Living B12 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `theorem productPathPerformComposeDependsOnLake_true` | host-presence tip + honesty |
| `theorem productPathPerformComposeEntrypointClaimed_true` | host-presence tip + honesty |
| `def productPathPerformComposePartialReady` | Chain fold: B11 read && home COMPOSE PartialReady && remains && ownership && perform claimed && DependsOnLake && ComposeDependsOnLake && ComposeEntrypointClaimed |
| `theorem productPathPerformComposePartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathPerformComposePartialReady = true` | host-presence tip |
| `example : productPathPerformComposeEntrypointClaimed = true` | host-presence tip |
| `example : productPathPerformComposeDependsOnLake = true` | host-presence tip |
| complete + remains + ownership + perform + DependsOnLake + B11 PartialReady re-smokes in B12 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathComposePlan` / string `ProductPathComposePlan` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE`, `product path perform compose` | fold doc / host-presence tip |
| B13+ `productPathPerformComposePartialReady` chain uses | later family folds (untouched) |
| B11 ReadDependsOnLake + ReadEntrypointClaimed + B10 InstallLakeFree + B9 perform claimed | prior families (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathPerformComposeStageId` | `ProductPathComposePlan.stageId` |
| `hostProductPathPerformComposeId` | `ProductPathComposePlan.hostId` |
| `selfHostProductPathPerformComposeId` | `ProductPathComposePlan.selfHostId` |
| `productPathPerformComposeModuleCite` | `ProductPathComposePlan.composeModuleCite` |
| `productPathPerformComposeFnCite` | `ProductPathComposePlan.composeFnCite` |
| `productPathPerformComposeEntrypointRecipe` tip string | `ProductPathComposePlan.justRecipeName` |
| `productPathPerformComposeLakeExe` tip string | `ProductPathComposePlan.lakeExeName` |
| `productPathPerformComposeOk` tip alias | home Bool bulk (`productPathPerformComposeOk`) |
| 8 B12 stage/recipe/exe/moduleCite/fnCite/Ok examples (kept DependsOnLake + EntrypointClaimed + PartialReady + claim chain) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathPerformComposePartialReady` | chain fold (B11 && home && remains && claims && DependsOnLake && ComposeDependsOnLake && ComposeEntrypoint) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `productPathPerformComposeDependsOnLake` | tip living honesty true | land-time honesty true |
| `productPathPerformComposeEntrypointClaimed` | tip living honesty true | land-time honesty true |
| `SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE` | fold comments | hostId / surface |
| perform claimed / ownership / remains / InstallLakeFree / Read* | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: compose-product-plan process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B10 InstallLakeFree / B11 Read*
- B13 WRITE-HC and later families
- short-name track (ComposePlan names already short role style)
- CompilePath wall / hostSpecs CompilePath block

## Gate-first edits (batch 11)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/fn/gap/WRITER strings; keep PartialReady + ComposeEntrypointClaimed true + ComposeDependsOnLake true + claim chain + ProductPathComposePlan + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home + composeModuleCite + justRecipeName + lakeExeName + composeFnCite + stageId/hostId/selfHostId + gapCompose + compose-product-plan |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B12 list shrink to fold/DependsOnLake/EntrypointClaimed/theorem/example; home ProductPathComposePlan expanded |
| `SelfApplyFs.lean` | Delete B12 historical defs + stage/recipe/Ok examples; thin B12 section + header inventory; keep DependsOnLake + EntrypointClaimed + fold |
| `ProductPathComposePlan.lean` | Header note dual-pin thin batch 11 (no new living claim true defs) |

## Line counts (batch 11)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5204 | 5162 | -42 |
| ProductPathComposePlan.lean | 248 | 251 | +3 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathPerformComposeDependsOnLake true (tip + home land-time)
- productPathPerformComposeEntrypointClaimed true (tip + home land-time)
- productPathPerformReadDependsOnLake true (tip; B11)
- productPathPerformReadEntrypointClaimed true (tip; B11)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- ProductPathComposePlan: no living-tip complete/perform/ownership true defs

## Lessons

1. B12 tip fold already used home `ProductPathComposePlan.productPathPerformComposePartialReady` plus bare tip remains + claims + DependsOnLake + ComposeDependsOnLake + ComposeEntrypointClaimed; tip Ok alias and stage/recipe/exe/moduleCite/fnCite were dual-pin theater.
2. Home moduleCite name is `composeModuleCite` (not tip's old `productPathPerformComposeModuleCite`); gate home tokens use home name. Recipe/exe are `justRecipeName` / `lakeExeName`.
3. Tip `productPathPerformComposeDependsOnLake` and `productPathPerformComposeEntrypointClaimed` must stay: fold uses bare tip names; emit-wire/hostSpecs require tip literal `def ... := true` (same as Read on B11 / InstallLakeFree on B10).
4. Recipe/exe tip strings were only dual-pin + smoke; home owns recipe/exe + justfile structural scan covers compose-product-plan.
5. Critical: do not move living perform/ownership/complete claimed true off tip; emit-wire forbids those true defs on home.
6. B13 WRITE-HC dual-pin block left untouched (next batch).
7. Next family: B13 ProductPathWriteHc (plan section continue dual-pin thin).
