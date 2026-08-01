# SelfApplyFs dual-pin thin batch 14 inventory (B15 CapableStepContract)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b14-2026-07-31.md` (ephemeral)

## Family

**B15 CapableStepContract** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.CapableStepContract` (CapableStepContract.lean). Living tip keeps
AuthorityNotEmit / ReadSatisfied / ComposeSatisfied / WriteHcSatisfied /
FullSatisfied (long-name false) honesty bools (fold + B16..B18 bare-name chain),
living short role name `stepContractFull` true, and the thin chain fold
`productPathFreestandingCapableStepContractPartialReady`. Living perform claimed /
ownership claimed / DependsOnLake / remains / B14 Capable* stay on tip (prior
batches). B16+ untouched (except string presence via header/fold comments).

Tip start line count: **4999** (verified `wc -l` before thin).

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true` | B15 fold bare name; tip hostPin / hostSpecs require tip literal |
| `def productPathFreestandingCapableStepContractReadSatisfied : Bool := true` | B15 fold + B16 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true` | B17 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true` | B18 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableStepContractFullSatisfied : Bool := false` | B15 fold bare name; long-name honesty false hold; tip hostPin |
| `def stepContractFull : Bool := true` | Living tip short role name SSoT (distinct from FullSatisfied long-name) |
| theorems `*_true` / `FullSatisfied_false` / `stepContractFull_true` for those | host-presence tip + honesty |
| `def productPathFreestandingCapableStepContractPartialReady` | Chain fold: B14 Capable && home CapableStepContract PartialReady && remains && ownership && perform claimed && DependsOnLake && AuthorityNotEmit && Read/Compose/WriteHc && !FullSatisfied |
| `theorem productPathFreestandingCapableStepContractPartialReady_true` | host-presence + emit-wire tip hostPin |
| examples for AuthorityNotEmit/Read/Compose/WriteHc/FullSatisfied/stepContractFull/PartialReady + claim chain | host-presence tip |
| complete + remains + ownership + perform + DependsOnLake + B14 PartialReady re-smokes in B15 smoke block | claim/honesty continuity |
| `import SystemsLean.CapableStepContract` / string `CapableStepContract` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT`, `product path freestanding capable step contract`, recipe/exe/contract-step names in fold comments | fold doc / host-presence tip |
| B16+ `productPathFreestandingCapableStepContractPartialReady` chain uses | later family folds (untouched) |
| B14 Capable* + B13 WriteHc* + prior families | prior (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathFreestandingCapableStepContractStageId` | `CapableStepContract.stageId` |
| `hostProductPathFreestandingCapableStepContractId` | `CapableStepContract.hostId` |
| `selfHostProductPathFreestandingCapableStepContractId` | `CapableStepContract.selfHostId` |
| `freestandingCapableStepContractRead` / Compose / WriteHc | `contractStepRead` / Compose / WriteHc |
| `freestandingCapableReadApiCite` / Compose / WriteHc | `freestandingCapableReadApi` / Compose / WriteHc |
| `blockerReadStillLakeHost` / Compose / WriteHc / MustOwnRegenerate | home same blocker names |
| `productPathFreestandingCapableStepContractMeasureRecipe` | `CapableStepContract.justMeasureRecipe` |
| `productPathFreestandingCapableStepContractLakeExe` | `CapableStepContract.lakeExeName` |
| `productPathFreestandingCapableStepContractModuleCite` | home module name / header `CapableStepContract` |
| `productPathFreestandingCapableStepContractOk` tip alias | home `productPathFreestandingCapableStepContractOk` bulk |
| 15+ B15 stage/host/recipe/exe/moduleCite/Ok/contract-step/blocker/API smoke examples (kept honesty bools + stepContractFull + PartialReady + claim chain) | home examples / printStepContract |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathFreestandingCapableStepContractPartialReady` | chain fold (B14 && home && remains && claims && DependsOnLake && honesty bools) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| AuthorityNotEmit / Read / Compose / WriteHc true | tip living honesty | land-time honesty true |
| FullSatisfied false | tip living honesty (long-name) | land-time honesty false |
| stepContractFull true | tip living short role SSoT | **not** home living tip claim |
| `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT` | fold comments | hostId / surface |
| perform claimed / ownership / remains / B14 Capable* | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: freestanding-capable-step-contract process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full short-name/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B14 Capable*
- B16 CAPABLE-READ and later families (defs untouched; tip hostPin strings for contract-step/API stay via B16 FnCite + tip header/fold comments)
- short-name track (CapableStepContract already short role name)
- CompilePath wall / hostSpecs CompilePath block
- self-host.md acceptance prose (still greps recipe/exe/stage as product surface docs)

## Gate-first edits (batch 14)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/contract-step/blocker/API/gap-token strings; keep PartialReady + AuthorityNotEmit/Read/Compose/WriteHc true + FullSatisfied false + stepContractFull true + claim chain + CapableStepContract + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens: stageId/hostId/selfHostId, justMeasureRecipe, lakeExeName, contractStep*, satisfied/Full def literals, PartialReady def/theorem |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B15 list shrink to fold/honesty bools/theorem/example; home CapableStepContract expanded (stageId/hostId/selfHostId/recipe/exe/contract-step/blocker/API/gaps) |
| `SelfApplyFs.lean` | Delete B15 historical defs + stage/recipe/Ok/contract-step/blocker/API examples; thin B15 section + header inventory; keep honesty + stepContractFull + fold |
| `CapableStepContract.lean` | Header note dual-pin thin batch 14 (no new living claim true defs) |

## Line counts (batch 14)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 4999 | 4918 | -81 |
| CapableStepContract.lean | 282 | 286 | +4 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathFreestandingCapableStepContractAuthorityNotEmit true (tip + home land-time)
- productPathFreestandingCapableStepContractRead/Compose/WriteHcSatisfied true (tip + home land-time)
- productPathFreestandingCapableStepContractFullSatisfied false (tip + home land-time long-name)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- CapableStepContract: no living-tip complete/perform/ownership true defs

## Lessons

1. B15 tip fold already used home `CapableStepContract.productPathFreestandingCapableStepContractPartialReady` plus bare tip remains + claims + DependsOnLake + honesty bools; tip Ok alias and stage/recipe/exe/moduleCite/contract-step/blocker/API were dual-pin theater.
2. Unlike B13 (two living honesty bools) and like B14 (five), B15 keeps **five** living tip bools (AuthorityNotEmit/Read/Compose/WriteHc/FullSatisfied) because B15 fold and B16..B18 folds use bare tip names; plus separate living short role name `stepContractFull` true (not the same as FullSatisfied long-name false).
3. Home moduleCite is the basename `CapableStepContract` (no separate `*ModuleCite` def on home); gate home tokens use stageId/hostId/selfHostId + lakeExeName + justMeasureRecipe + contractStep*.
4. Recipe/exe tip strings were only dual-pin + smoke; home owns recipe/exe + justfile structural scan covers freestanding-capable-step-contract.
5. Critical: do not move living perform/ownership/complete claimed true or stepContractFull true off tip; emit-wire forbids those true defs on home.
6. B16+ CAPABLE-READ dual-pin block left untouched (next batch). B16 tip hostPin still greps FREESTANDING-CAPABLE-STEP-CONTRACT-READ and freestandingCapableReadDualSsot on tip via header/fold comments + B16 FnCite.
7. Next family: B16 CapableRead (plan section continue dual-pin thin).
