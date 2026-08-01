# SelfApplyFs dual-pin thin batch 15 inventory (B16 CapableRead)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b15-2026-07-31.md` (ephemeral)

## Family

**B16 CapableRead** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.CapableRead` (CapableRead.lean). Living tip keeps
EntrypointClaimed / AuthorityNotEmit / DependsOnLake honesty bools (fold bare
names), and the thin chain fold
`productPathFreestandingCapableReadPartialReady`. Living perform claimed /
ownership claimed / complete / B14 CapableRead / B15 step-contract chain stay on
tip (prior batches). B17+ untouched (except string presence via header/fold
comments).

Tip start line count: **4918** (verified `wc -l` before thin).

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathFreestandingCapableReadEntrypointClaimed : Bool := true` | B16 fold bare name; tip hostPin / hostSpecs require tip literal |
| `def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true` | B16 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableReadDependsOnLake : Bool := true` | B16 fold bare name; tip hostPin / hostSpecs |
| theorems `*_true` for those three + PartialReady | host-presence tip + honesty |
| `def productPathFreestandingCapableReadPartialReady` | Chain fold: B15 step-contract PartialReady && home CapableRead PartialReady && EntrypointClaimed && AuthorityNotEmit && DependsOnLake && ReadSatisfied && B14 CapableRead && perform claimed && ownership claimed |
| `theorem productPathFreestandingCapableReadPartialReady_true` | host-presence + emit-wire tip hostPin |
| examples for EntrypointClaimed/AuthorityNotEmit/DependsOnLake/PartialReady + claim chain | host-presence tip |
| complete + remains + ownership + perform + B14 CapableRead + B15 PartialReady re-smokes in B16 smoke block | claim/honesty continuity |
| `import SystemsLean.CapableRead` / string `CapableRead` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ`, `product path freestanding capable read`, `freestandingCapableReadDualSsot` in fold comments | fold doc / host-presence tip |
| B17+ `productPathFreestandingCapableReadPartialReady` chain uses | later family folds (untouched) |
| B15 CapableStepContract* + B14 Capable* + prior families | prior (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathFreestandingCapableReadStageId` | `CapableRead.stageId` |
| `hostCapableReadId` | `CapableRead.hostId` |
| `selfHostCapableReadId` | `CapableRead.selfHostId` |
| `productPathFreestandingCapableReadEntrypointRecipe` | `CapableRead.justRecipeName` |
| `productPathFreestandingCapableReadLakeExe` | `CapableRead.lakeExeName` |
| `productPathFreestandingCapableReadModuleCite` | home module name / header `CapableRead` |
| `productPathFreestandingCapableReadFnCite` | `CapableRead.freestandingCapableReadApi` / `freestandingCapableReadDualSsot` |
| `productPathFreestandingCapableReadOk` tip alias | home `productPathFreestandingCapableReadOk` bulk |
| 8+ B16 stage/host/recipe/exe/moduleCite/FnCite/Ok smoke examples (kept honesty bools + PartialReady + claim chain) | home examples / print path |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathFreestandingCapableReadPartialReady` | chain fold (B15 && home && honesty bools && claims) | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| EntrypointClaimed / AuthorityNotEmit / DependsOnLake true | tip living honesty | AuthorityNotEmit/DependsOnLake land-time (no EntrypointClaimed on home) |
| `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ` | fold comments | hostId / surface |
| perform claimed / ownership / complete / B14 CapableRead / B15 step-contract | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: freestanding-capable-read process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full short-name/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B14 Capable* / B15 step-contract*
- B17 CAPABLE-COMPOSE and later families (defs untouched)
- short-name track (CapableRead already short role name)
- CompilePath wall / hostSpecs CompilePath block
- self-host.md acceptance prose (still greps recipe/exe/stage as product surface docs)

## Gate-first edits (batch 15)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/FnCite strings; keep PartialReady + EntrypointClaimed/AuthorityNotEmit/DependsOnLake true + ReadSatisfied + B14 CapableRead + claim chain + CapableRead + freestandingCapableReadDualSsot + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens: stageId/hostId/selfHostId, lakeExeName, justRecipeName, freestandingCapableReadApi, AuthorityNotEmit/DependsOnLake def literals, PartialReady def/theorem |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B16 list shrink to fold/honesty bools/theorem/example; home CapableRead expanded (stageId/hostId/selfHostId/recipe/exe/API/LakeFree) |
| `SelfApplyFs.lean` | Delete B16 historical defs + stage/recipe/Ok/FnCite examples; thin B16 section + header inventory; keep honesty + fold |
| `CapableRead.lean` | Header note dual-pin thin batch 15 (no new living claim true defs) |

## Line counts (batch 15)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 4918 | 4877 | -41 |
| CapableRead.lean | 293 | ~297 | +4 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true (living tip SSoT kept)
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathPerformDependsOnLake true (tip + home; not forged false)
- productPathFreestandingCapableReadEntrypointClaimed true (tip)
- productPathFreestandingCapableReadAuthorityNotEmit true (tip + home land-time)
- productPathFreestandingCapableReadDependsOnLake true (tip + home land-time)
- productPathFreestandingCapableRead true (B14 tip)
- productPathHostLakeBootstrapRemains := true still on tip (B4)
- CapableRead: no living-tip complete/perform/ownership true defs

## Lessons

1. B16 tip fold already used home `CapableRead.productPathFreestandingCapableReadPartialReady` plus bare tip honesty bools + B14 CapableRead + living claims; tip Ok alias and stage/recipe/exe/moduleCite/FnCite were dual-pin theater.
2. Like B15 (five honesty bools), B16 keeps **three** living tip bools (EntrypointClaimed/AuthorityNotEmit/DependsOnLake) because the B16 fold uses bare tip names; home has AuthorityNotEmit/DependsOnLake land-time but not EntrypointClaimed.
3. Home moduleCite is the basename `CapableRead` (no separate `*ModuleCite` def on home); gate home tokens use stageId/hostId/selfHostId + lakeExeName + justRecipeName + freestandingCapableReadApi.
4. Recipe/exe tip strings were only dual-pin + smoke; home owns recipe/exe + justfile structural scan covers freestanding-capable-read.
5. Critical: do not move living perform/ownership/complete claimed true or B14 CapableRead true off tip; emit-wire forbids those true defs on home.
6. B17+ CAPABLE-COMPOSE dual-pin block left untouched (next batch). B17 tip hostPin still greps FREESTANDING-CAPABLE-READ chain via B16 PartialReady fold.
7. Next family: B17 ProductPathFreestandingCapableCompose (plan section continue dual-pin thin).
