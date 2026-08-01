# SelfApplyFs dual-pin thin batch 12 inventory (B13 ProductPathWriteHc)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b12-2026-07-31.md` (ephemeral)

## Family

**B13 ProductPathWriteHc** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathWriteHc`. Living tip keeps
`productPathPerformWriteHcDependsOnLake := true` and
`productPathPerformWriteHcEntrypointClaimed := true` honesty pins and the thin
chain fold `productPathPerformWriteHcPartialReady`. Living perform claimed /
ownership claimed / DependsOnLake (perform) / remains / InstallLakeFree /
Read* / Compose* stay on tip (prior batches). B14+ untouched.

Tip start line count: **5162** (verified `wc -l` before thin).

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathPerformWriteHcDependsOnLake : Bool := true` | Living B13 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `def productPathPerformWriteHcEntrypointClaimed : Bool := true` | Living B13 honesty; fold uses bare tip name; tip hostPin / hostSpecs require tip literal |
| `theorem productPathPerformWriteHcDependsOnLake_true` | host-presence tip + honesty |
| `theorem productPathPerformWriteHcEntrypointClaimed_true` | host-presence tip + honesty |
| `def productPathPerformWriteHcPartialReady` | Chain fold: B12 compose && home WRITE-HC PartialReady && remains && ownership && perform claimed && DependsOnLake && WriteHcDependsOnLake && WriteHcEntrypointClaimed |
| `theorem productPathPerformWriteHcPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathPerformWriteHcPartialReady = true` | host-presence tip |
| `example : productPathPerformWriteHcEntrypointClaimed = true` | host-presence tip |
| `example : productPathPerformWriteHcDependsOnLake = true` | host-presence tip |
| complete + remains + ownership + perform + DependsOnLake + B12 PartialReady re-smokes in B13 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathWriteHc` / string `ProductPathWriteHc` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC`, `product path perform write` | fold doc / host-presence tip |
| B14+ `productPathPerformWriteHcPartialReady` chain uses | later family folds (untouched) |
| B12 ComposeDependsOnLake + ComposeEntrypointClaimed + B11 Read* + B10 InstallLakeFree + B9 perform claimed | prior families (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathPerformWriteHcStageId` | `ProductPathWriteHc.stageId` |
| `hostProductPathPerformWriteHcId` | `ProductPathWriteHc.hostId` |
| `selfHostProductPathPerformWriteHcId` | `ProductPathWriteHc.selfHostId` |
| `productPathPerformWriteHcModuleCite` | `ProductPathWriteHc.writeHcModuleCite` |
| `productPathPerformWriteHcFnCite` | `ProductPathWriteHc.writeHcFnCite` |
| `productPathPerformWriteHcEntrypointRecipe` tip string | `ProductPathWriteHc.justRecipeName` |
| `productPathPerformWriteHcLakeExe` tip string | `ProductPathWriteHc.lakeExeName` |
| `productPathPerformWriteHcOk` tip alias | home Bool bulk (`productPathPerformWriteHcOk`) |
| 8 B13 stage/recipe/exe/moduleCite/fnCite/Ok examples (kept DependsOnLake + EntrypointClaimed + PartialReady + claim chain) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathPerformWriteHcPartialReady` | chain fold (B12 && home && remains && claims && DependsOnLake && WriteHcDependsOnLake && WriteHcEntrypoint) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `productPathPerformWriteHcDependsOnLake` | tip living honesty true | land-time honesty true |
| `productPathPerformWriteHcEntrypointClaimed` | tip living honesty true | land-time honesty true |
| `SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC` | fold comments | hostId / surface |
| perform claimed / ownership / remains / InstallLakeFree / Read* / Compose* | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: write-freestanding-hc process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B10 InstallLakeFree / B11 Read* / B12 Compose*
- B14 CAPABLE-GAP and later families
- short-name track (WriteHc names already short role style)
- CompilePath wall / hostSpecs CompilePath block
- self-host.md acceptance prose (still greps recipe/exe/stage as product surface docs)

## Gate-first edits (batch 12)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/fn/gap/WRITER strings; keep PartialReady + WriteHcEntrypointClaimed true + WriteHcDependsOnLake true + claim chain + ProductPathWriteHc + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home + writeHcModuleCite + justRecipeName + lakeExeName + writeHcFnCite + stageId/hostId/selfHostId + gapWriteHc |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B13 list shrink to fold/DependsOnLake/EntrypointClaimed/theorem/example; home ProductPathWriteHc expanded |
| `SelfApplyFs.lean` | Delete B13 historical defs + stage/recipe/Ok examples; thin B13 section + header inventory; keep DependsOnLake + EntrypointClaimed + fold |
| `ProductPathWriteHc.lean` | Header note dual-pin thin batch 12 (no new living claim true defs) |

## Line counts (batch 12)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5162 | 5117 | -45 |
| ProductPathWriteHc.lean | 190 | 194 | +4 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathPerformWriteHcDependsOnLake true (tip + home land-time)
- productPathPerformWriteHcEntrypointClaimed true (tip + home land-time)
- productPathPerformComposeDependsOnLake true (tip; B12)
- productPathPerformComposeEntrypointClaimed true (tip; B12)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- ProductPathWriteHc: no living-tip complete/perform/ownership true defs

## Lessons

1. B13 tip fold already used home `ProductPathWriteHc.productPathPerformWriteHcPartialReady` plus bare tip remains + claims + DependsOnLake + WriteHcDependsOnLake + WriteHcEntrypointClaimed; tip Ok alias and stage/recipe/exe/moduleCite/fnCite were dual-pin theater.
2. Home moduleCite name is `writeHcModuleCite` (not tip's old `productPathPerformWriteHcModuleCite`); gate home tokens use home name. Recipe/exe are `justRecipeName` / `lakeExeName`.
3. Tip `productPathPerformWriteHcDependsOnLake` and `productPathPerformWriteHcEntrypointClaimed` must stay: fold uses bare tip names; emit-wire/hostSpecs require tip literal `def ... := true` (same as Compose on B12 / Read on B11).
4. Recipe/exe tip strings were only dual-pin + smoke; home owns recipe/exe + justfile structural scan covers write-freestanding-hc.
5. Critical: do not move living perform/ownership/complete claimed true off tip; emit-wire forbids those true defs on home.
6. B14 CAPABLE-GAP dual-pin block left untouched (next batch).
7. Next family: B14 Capable (plan section continue dual-pin thin).
