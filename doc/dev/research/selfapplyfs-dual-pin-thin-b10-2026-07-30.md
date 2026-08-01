# SelfApplyFs dual-pin thin batch 10 inventory (B11 ProductPathReadSsot)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b10.md` (ephemeral)

## Family

**B11 ProductPathReadSsot** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathReadSsot`. Living tip keeps
`productPathPerformReadDependsOnLake := true` and
`productPathPerformReadEntrypointClaimed := true` honesty pins and the thin
chain fold `productPathPerformReadPartialReady`. Living perform claimed /
ownership claimed / DependsOnLake (perform) / remains / InstallLakeFree stay on
tip (B9/B8/B4/B10). B12+ untouched.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathPerformReadDependsOnLake : Bool := true` | Living B11 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `def productPathPerformReadEntrypointClaimed : Bool := true` | Living B11 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `theorem productPathPerformReadDependsOnLake_true` | host-presence tip + honesty |
| `theorem productPathPerformReadEntrypointClaimed_true` | host-presence tip + honesty |
| `def productPathPerformReadPartialReady` | Chain fold: B10 step && home READ PartialReady && remains && ownership && perform claimed && DependsOnLake && ReadDependsOnLake && ReadEntrypointClaimed |
| `theorem productPathPerformReadPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathPerformReadPartialReady = true` | host-presence tip |
| `example : productPathPerformReadEntrypointClaimed = true` | host-presence tip |
| `example : productPathPerformReadDependsOnLake = true` | host-presence tip |
| complete + remains + ownership + perform + DependsOnLake + B10 PartialReady re-smokes in B11 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathReadSsot` / string `ProductPathReadSsot` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-PERFORM-READ`, `product path perform read` | fold doc / host-presence tip |
| B12+ `productPathPerformReadPartialReady` chain uses | later family folds (untouched) |
| B10 InstallLakeFree + B9 perform claimed + DependsOnLake tip pins | prior families (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathPerformReadStageId` | `ProductPathReadSsot.stageId` |
| `hostProductPathPerformReadId` | `ProductPathReadSsot.hostId` |
| `selfHostProductPathPerformReadId` | `ProductPathReadSsot.selfHostId` |
| `productPathPerformReadModuleCite` | `ProductPathReadSsot.readModuleCite` |
| `productPathPerformReadFnCite` | `ProductPathReadSsot.readFnCite` |
| `productPathPerformReadEntrypointRecipe` tip string | `ProductPathReadSsot.justRecipeName` |
| `productPathPerformReadLakeExe` tip string | `ProductPathReadSsot.lakeExeName` |
| `productPathPerformReadOk` tip alias | home Bool bulk (`productPathPerformReadOk`) |
| 8 B11 stage/recipe/exe/moduleCite/fnCite/Ok examples (kept DependsOnLake + EntrypointClaimed + PartialReady + claim chain) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathPerformReadPartialReady` | chain fold (B10 && home && remains && claims && DependsOnLake && ReadDependsOnLake && ReadEntrypoint) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `productPathPerformReadDependsOnLake` | tip living honesty true | land-time honesty true |
| `productPathPerformReadEntrypointClaimed` | tip living honesty true | land-time honesty true |
| `SELF-HOST-PRODUCT-PATH-PERFORM-READ` | fold comments | hostId / surface |
| perform claimed / ownership / remains / InstallLakeFree | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: read-product-ssot process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B10 InstallLakeFree
- B12 COMPOSE and later families
- short-name track

## Gate-first edits (batch 10)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/fn/gap strings; keep PartialReady + ReadEntrypointClaimed true + ReadDependsOnLake true + claim chain + ProductPathReadSsot + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home + readModuleCite + justRecipeName + lakeExeName + readFnCite + stageId/hostId/selfHostId + gapReadSsot + read-product-ssot |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B11 list shrink to fold/DependsOnLake/EntrypointClaimed/theorem/example; home ProductPathReadSsot expanded |
| `SelfApplyFs.lean` | Delete B11 historical defs + stage/recipe/Ok examples; thin B11 section + header inventory; keep DependsOnLake + EntrypointClaimed + fold |
| `ProductPathReadSsot.lean` | Header note dual-pin thin batch 10 (no new living claim true defs) |

## Line counts (batch 10)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5245 | 5204 | -41 |
| ProductPathReadSsot.lean | 204 | 208 | +4 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathPerformReadDependsOnLake true (tip + home land-time)
- productPathPerformReadEntrypointClaimed true (tip + home land-time)
- productPathPerformInstallLakeFreeEntrypointClaimed true (tip; B10)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- ProductPathReadSsot: no living-tip complete/perform/ownership true defs

## Lessons

1. B11 tip fold already used home `ProductPathReadSsot.productPathPerformReadPartialReady` plus bare tip remains + claims + DependsOnLake + ReadDependsOnLake + ReadEntrypointClaimed; tip Ok alias and stage/recipe/exe/moduleCite/fnCite were dual-pin theater.
2. Home moduleCite name is `readModuleCite` (not tip's old `productPathPerformReadModuleCite`); gate home tokens use home name. Recipe/exe are `justRecipeName` / `lakeExeName`.
3. Tip `productPathPerformReadDependsOnLake` and `productPathPerformReadEntrypointClaimed` must stay: fold uses bare tip names; emit-wire/hostSpecs require tip literal `def ... := true` (safer default, same as InstallLakeFree on B10 / perform claimed on B9).
4. Recipe/exe tip strings were only dual-pin + smoke; home owns recipe/exe + justfile structural scan covers read-product-ssot.
5. Critical: do not move living perform/ownership/complete claimed true off tip; emit-wire forbids those true defs on home.
6. B12 COMPOSE dual-pin block left untouched (next batch 11).
7. Next family: B12 ProductPathComposePlan (plan section 8).
