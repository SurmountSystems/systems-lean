# SelfApplyFs dual-pin thin batch 8 inventory (B9 ProductPathPerform)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b8.md` (ephemeral)

## Family

**B9 ProductPathPerform** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathPerform`. Living claim SSoT
(`productPathFreestandingPerformClaimed := true`) and thin chain fold stay on
`SelfApplyFs`. Tip `productPathPerformDependsOnLake := true` kept (later family
folds use the tip pin). B4 tip `productPathHostLakeBootstrapRemains := true`
and living ownership claimed left untouched. PerformClaimed living claim family
(B39 stage/recipe/measured) not moved.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathFreestandingPerformClaimed : Bool := true` | Living perform claimed SSoT (critical claim guard) |
| `theorem productPathFreestandingPerformClaimed_true` | host-presence tip + claim honesty |
| `def productPathPerformDependsOnLake : Bool := true` | Living honesty; later family folds use tip pin |
| `theorem productPathPerformDependsOnLake_true` | host-presence + honesty continuity |
| `def productPathPerformPartialReady` | Chain fold: ownership && home PartialReady && remains && claims && DependsOnLake |
| `theorem productPathPerformPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathPerformPartialReady = true` | host-presence tip |
| `example : productPathFreestandingPerformClaimed = true` | host-presence tip |
| complete + remains + ownership re-smokes in B9 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathPerform` / string `ProductPathPerform` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-PERFORM`, `product path perform` | fold doc / host-presence tip |
| B10+ `productPathPerformPartialReady` / tip DependsOnLake chain uses | later family folds (untouched) |
| B10 InstallLakeFreeEntrypoint defs on tip | B10 family (not this batch) |
| B39 PerformClaimed family dual-pins | separate family; not this batch |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathPerformStageId` | `ProductPathPerform.stageId` |
| `hostProductPathPerformId` | `ProductPathPerform.hostId` |
| `selfHostProductPathPerformId` | `ProductPathPerform.selfHostId` |
| `productPathPerformModuleCite` | `ProductPathPerform.performModuleCite` (name differs; home string value same) |
| `productPathPerformInstallStepLakeFreeCapable` tip def + theorem | same name on home (+ ProductPathPerformStep) |
| `productPathPerformLakeWriterCite` | same name on home |
| `productPathPerformLakeExeCite` | same name on home |
| `productPathPerformInstallRecipeCite` | same name on home |
| `productPathPerformGapReadSsot` / `GapCompose` / `GapWriteWire` | same names on home |
| `productPathPerformOk` tip alias | home Bool bulk (`productPathPerformOk`) |
| 13 B9 stage/gap/ok examples (kept partialReady + perform claimed + DependsOnLake + complete + remains + ownership) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathPerformPartialReady` | chain fold (B8 && home && remains && claims && DependsOnLake) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `productPathPerformDependsOnLake` | tip living honesty true | land-time honesty true |
| `SELF-HOST-PRODUCT-PATH-PERFORM` | fold comments | hostId / surface |
| `productPathFreestandingPerformClaimed` | living SSoT true | **forbidden** true def on home |

### Not touched

- justfile: no B9 tip-only stage/path recipe pins requiring tip stage strings
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B4 tip living pins
- living ownership claimed true
- PerformClaimed (B39) dual-pin block
- PartialReady bulk body (already home from batch 26)
- B10 InstallLakeFreeEntrypoint tip defs (batch 9 territory)
- B10+ dual-pin thin, short-name track

## Gate-first edits (batch 8)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/moduleCite/gap/Lake-writer strings; keep partialReady + perform claimed true + DependsOnLake true + ProductPathPerform + remains + ownership chain |
| `nix/systems-emit-wire/emit-product.nix` | Home + performModuleCite + productPathPerformLake* + Gap* |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B9 list shrink to fold/claim/DependsOnLake/theorem/example; home ProductPathPerform expanded |
| `SelfApplyFs.lean` | Delete B9 historical defs + stage/gap/ok examples; thin B9 section + header inventory; keep InstallLakeFree under B10 header |
| `ProductPathPerform.lean` | Header note dual-pin thin batch 8 (no new living claim true defs) |

## Line counts (batch 8)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5361 | 5283 | -78 |
| ProductPathPerform.lean | 135 | 137 | +2 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- ProductPathPerform: no living-tip complete/perform/ownership true defs
- productPathHostLakeBootstrapRemains := true still on tip (B4)

## Lessons

1. B9 tip fold already used `ProductPathPerform.productPathPerformPartialReady` plus bare tip remains + perform/ownership claimed + DependsOnLake; tip Ok alias and stage/gap strings were dual-pin theater.
2. Home moduleCite name is `performModuleCite` (not tip's old `productPathPerformModuleCite`); gate home tokens use home name.
3. Tip `productPathPerformDependsOnLake` must stay: later family folds reference the tip pin extensively (not only home).
4. InstallStepLakeFreeCapable tip def was only used by tip theorem/smoke; home (and PerformStep) already own it -- safe to drop tip InstallStep after hostPin shrink.
5. Critical: do not move `productPathFreestandingPerformClaimed := true` off tip; emit-wire forbids that true def on home.
6. B10 InstallLakeFreeEntrypoint stayed on tip under B10 header (next dual-pin thin batch 9).
7. Next family: B10 ProductPathPerformStep (plan section 8).
