# SelfApplyFs dual-pin thin batch 16 inventory (B17 CapableCompose)

Kind: analysis only. Not residual.

Date: 2026-07-31
Source join: `/tmp/grok-impl-summary-dual-pin-b16-2026-07-31.md` (ephemeral)

## Family

**B17 CapableCompose** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathFreestandingCapableCompose`
(`ProductPathFreestandingCapableCompose.lean`). Living tip keeps
EntrypointClaimed / AuthorityNotEmit / DependsOnLake honesty bools (fold bare
names), and the thin chain fold
`productPathFreestandingCapableComposePartialReady`. Living perform claimed /
ownership claimed / complete / B14 CapableCompose / B15 ComposeSatisfied /
B16 Read PartialReady stay on tip (prior batches). B18+ untouched (except string
presence via header/fold comments).

Tip start line count: **4877** (verified `wc -l` before thin).

## Short-name choice

**Defer** rename `ProductPathFreestandingCapableCompose` -> `CapableCompose`
(+ Main) this batch. Reasons:

1. Dual-pin thin alone is the tip shrink; basename rename does not remove tip
   dual-pin mass by itself (plan section 8).
2. Rename touches lakefile Main, justfile path greps, emit-wire modulePath,
   hostSpecs rel, SelfApplyFs import, ModuleCite string, acceptance prose --
   large serial surface for one quality batch.
3. Pattern matches prior defer when long ProductPath* still present (WriteHc
   still long too). Prefer split B17 dual-pin now; short-name residual or next
   family batch when tip dual-pin not racing.

Home module stays `ProductPathFreestandingCapableCompose.lean`.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productPathFreestandingCapableComposeEntrypointClaimed : Bool := true` | B17 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true` | B17 fold bare name; tip hostPin / hostSpecs |
| `def productPathFreestandingCapableComposeDependsOnLake : Bool := true` | B17 fold bare name; tip hostPin / hostSpecs |
| theorems `*_true` for those three + PartialReady | host-presence tip + honesty |
| `def productPathFreestandingCapableComposePartialReady` | Chain fold: B16 Read PartialReady && home Compose PartialReady && honesty && ComposeSatisfied && B14 CapableCompose && perform && ownership |
| `theorem productPathFreestandingCapableComposePartialReady_true` | host-presence + emit-wire tip hostPin |
| examples for honesty bools + PartialReady + claim chain | host-presence tip |
| complete + remains + ownership + perform + B14 CapableCompose + ComposeSatisfied re-smokes | claim/honesty continuity |
| `import SystemsLean.ProductPathFreestandingCapableCompose` / string cite | compile + greppable import cite |
| doc greps in fold comments (SELF-HOST-...-CAPABLE-COMPOSE, freestandingCapableComposePlanApplyBody) | fold doc / host-presence tip |
| B18+ chain uses of Compose PartialReady | later family folds (untouched) |
| B14 `productPathFreestandingCapableCompose` true + B15 ComposeSatisfied | prior (not moved) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathFreestandingCapableComposeStageId` | `stageId` |
| `hostProductPathFreestandingCapableComposeId` | `hostId` |
| `selfHostProductPathFreestandingCapableComposeId` | `selfHostId` |
| `productPathFreestandingCapableComposeEntrypointRecipe` | `justRecipeName` |
| `productPathFreestandingCapableComposeLakeExe` | `lakeExeName` |
| `productPathFreestandingCapableComposeModuleCite` | header / module basename |
| `productPathFreestandingCapableComposeFnCite` | `freestandingCapableComposeApi` / `freestandingCapableComposePlanApplyBody` |
| `productPathFreestandingCapableComposeOk` tip alias | home `productPathFreestandingCapableComposeOk` bulk |
| 8+ B17 stage/host/recipe/exe/moduleCite/FnCite/Ok smoke examples | home examples / print path |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productPathFreestandingCapableComposePartialReady` | chain fold | Ok stage/gap bulk |
| theorem partialReady_true | tip theorem | home theorem |
| EntrypointClaimed / AuthorityNotEmit / DependsOnLake true | tip living honesty | AuthorityNotEmit/DependsOnLake land-time (no EntrypointClaimed on home) |
| `SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE` | fold comments | hostId / surface |
| perform claimed / ownership / complete / B14 CapableCompose / B16 Read | tip living SSoT | **forbidden** living claim true defs on home |

### Not touched

- justfile: freestanding-capable-compose process glue (structural emit-wire scan stays)
- living claim bools on tip (complete/Full short-name/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B9 DependsOnLake / perform claimed / B14-B16 chain
- B18 CAPABLE-WRITE-HC and later families (defs untouched)
- short-name track (deferred; see above)
- CompilePath wall / hostSpecs CompilePath block
- self-host.md acceptance prose

## Gate-first edits (batch 16)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/stage/recipe/exe strings; keep PartialReady + honesty bools + ComposeSatisfied + B14 CapableCompose + claim chain + ProductPathFreestandingCapableCompose + freestandingCapableComposePlanApplyBody + theorem |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens: add stageId/hostId/selfHostId def forms, freestandingCapableComposeApi, PartialReady def form if missing |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B17 list shrink to fold/honesty; home ProductPathFreestandingCapableCompose expanded (stageId/hostId/selfHostId/recipe/exe/API) |
| `SelfApplyFs.lean` | Delete B17 historical defs + stage/recipe/Ok/FnCite examples; thin B17 section + header inventory; keep honesty + fold |
| `ProductPathFreestandingCapableCompose.lean` | Header note dual-pin thin batch 16 (no new living claim true defs) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- productPathFreestandingCapableCompose true (B14 tip)
- productPathFreestandingCapableComposeEntrypointClaimed true (tip)
- productPathFreestandingCapableComposeAuthorityNotEmit true (tip + home)
- productPathFreestandingCapableComposeDependsOnLake true (tip + home)
- Home: no living-tip complete/perform/ownership true defs

## Lessons

1. B17 tip fold already used home PartialReady plus bare tip honesty bools + B14 CapableCompose + living claims; tip Ok alias and stage/recipe/exe/moduleCite/FnCite were dual-pin theater.
2. Three living tip honesty bools (EntrypointClaimed/AuthorityNotEmit/DependsOnLake) stay because fold uses bare tip names; home has AuthorityNotEmit/DependsOnLake land-time but not EntrypointClaimed.
3. Short-name deferred: dual-pin value is tip line drop + home-primary gates, not basename churn this slice.
4. Next family: B18 ProductPathFreestandingCapableWriteHc dual-pin thin batch 17.
