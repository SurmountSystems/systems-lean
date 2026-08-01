# SelfApplyFs dual-pin thin batch 21 inventory (B22 OwnershipRegenerate)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-1000/grok-impl-summary-dual-pin-b21-2026-07-31.md`

## Family

**B22..B30 OwnershipRegenerate pack** -- tip dual-pins gate-first onto
`SystemsLean.ProductPathOwnershipRegenerate`
(`ProductPathOwnershipRegenerate.lean`). Living tip keeps twelve honesty bools
(Install/Read/Compose/WriteHc LakeFree + PathClaimed, LakeFreeJoinClaimed,
ProductPathAuthorityClaimed, WithoutLake, DependsOnLake) and the thin chain fold
`productPathOwnershipRegeneratePartialReady`. Living perform/ownership/complete/
FullBar stay on tip. B31+ untouched (except PartialReady chain use).

Tip start line count: **4641** (verified `wc -l` before thin).

## Short-name choice

**Defer** rename `ProductPathOwnershipRegenerate` -> shorter role name
(+ Main). Reasons:

1. Home basename is already role-shaped (`ProductPathOwnershipRegenerate`);
   shorter forms like `OwnershipRegenerate` are optional cleanup, not dual-pin
   tip mass.
2. Rename touches lakefile Main, justfile path greps, emit-wire modulePath,
   hostSpecs rel, SelfApplyFs import, ModuleCite string -- serial surface.
3. Prefer dual-pin tip shrink now; short-name residual when tip dual-pin not
   racing (plan section 8c).

Home module stays `ProductPathOwnershipRegenerate.lean`.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| twelve honesty bools `:= true` | B22..B30 fold bare names; tip hostPin / hostSpecs |
| theorems `*_true` for honesty + PartialReady | host-presence tip + honesty |
| `def productPathOwnershipRegeneratePartialReady` | Chain fold: B21 FullBar PartialReady && home PartialReady && honesty && !FullSatisfied && perform && ownership |
| examples for honesty + PartialReady + claim chain | host-presence tip |
| complete + ownership + perform + FullBar dual-pin re-smokes | claim/honesty continuity |
| `import SystemsLean.ProductPathOwnershipRegenerate` / string cite | compile + greppable import cite |
| fold comments (SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE) | fold doc / host-presence tip |
| B31+ chain uses of OwnershipRegenerate PartialReady | later family folds (untouched defs) |
| FullBar OwnershipRegenerateWithoutLake | prior family honesty (B21) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathOwnershipRegenerateStageId` | `stageId` |
| `hostProductPathOwnershipRegenerateId` | `hostId` |
| `selfHostProductPathOwnershipRegenerateId` | `selfHostId` |
| Install/Read/Compose/WriteHc/LakeFreeJoin/Authority/SharedInstall/Measure recipes | `lakeFree*Recipe` / `productPathAuthorityRecipe` / `sharedInstallRecipe` / `justMeasureRecipe` |
| `productPathOwnershipRegenerateLakeExe` | `lakeExeName` |
| `productPathOwnershipRegenerateModuleCite` | header / module basename |
| `ownershipRegenerate*Id` step token strings | home `ownershipRegenerate*Id` |
| `productPathOwnershipRegenerateOk` tip alias | home `productPathOwnershipRegenerateOk` bulk |
| stage/host/recipe/exe/moduleCite/stepId/Ok smoke examples | home examples / print path |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathOwnershipRegeneratePartialReady` | chain fold | Ok stage bulk |
| theorem partialReady_true | tip theorem | home theorem |
| twelve honesty bools true | tip living honesty | land-time same names on home |
| `SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE` | fold comments | hostId / surface |
| perform / ownership / complete / FullBar | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile ownership-regenerate process glue
- living claim bools on tip
- B31+ family defs
- short-name track (deferred)
- CompilePath / cold hostSpecs splits
- self-host.md acceptance prose

## Gate-first edits (batch 21)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe/OWNERSHIP-REGENERATE-* step strings; keep PartialReady + honesty bools + claim chain + ProductPathOwnershipRegenerate + Capable* dual-pin + FullBar dual-pin + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens: add stageId/hostId/selfHostId def forms, lakeExeName, justMeasureRecipe, lakeFree*Recipe if missing |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B22 list shrink to fold/honesty; home ProductPathOwnershipRegenerate expanded (stageId/hostId/selfHostId/recipe/exe/step ids) |
| `SelfApplyFs.lean` | Delete B22 historical defs + stage/recipe/Ok/stepId examples; thin B22 section + header inventory; keep honesty + fold |
| `ProductPathOwnershipRegenerate.lean` | Header note dual-pin thin batch 21 (no new living claim true defs) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathOwnershipRegenerateWithoutLake true (tip + home)
- productPathOwnershipRegenerateDependsOnLake true (tip + home)
- Home: no living-tip complete/perform/ownership true defs

## Next

B31 PerformEvidence dual-pin thin batch 22.
