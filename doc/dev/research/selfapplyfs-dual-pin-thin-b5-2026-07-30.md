# SelfApplyFs dual-pin thin batch 5 inventory (B6 ProductPathWriterPathPlan)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b5.md` (ephemeral)

## Family

**B6 ProductPathWriterPathPlan** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathWriterPathPlan`. Living claim SSoT and thin chain fold stay on
`SelfApplyFs`. B4 tip `productPathHostLakeBootstrapRemains := true` left untouched.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productWriterPathPlanPartialReady` | Chain fold: `productWriterSurfacePartialReady && ProductPathWriterPathPlan.productWriterPathPlanPartialReady && productPathHostLakeBootstrapRemains` |
| `theorem productWriterPathPlanPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productWriterPathPlanPartialReady = true` | host-presence tip |
| complete + remains + surface re-smokes in B6 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathWriterPathPlan` / string `ProductPathWriterPathPlan` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-WRITER-PATH-PLAN`, `product writer path plan` | fold doc / host-presence tip |
| B7+ `productWriterPathPlanPartialReady` chain uses | later family folds (untouched) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productWriterPathPlanStageId` | `ProductPathWriterPathPlan.stageId` |
| `hostProductWriterPathPlanId` | `ProductPathWriterPathPlan.hostId` |
| `selfHostProductWriterPathPlanId` | `ProductPathWriterPathPlan.selfHostId` |
| `productWriterPathPlanModuleCite` | `ProductPathWriterPathPlan.writerPathPlanModuleCite` (name differs; home string value same) |
| `productWriterPathStepReadSsot` / `Compose` / `WriteWire` / `InstallOut` | same names on home |
| `productWriterPathPlanOk` tip alias | home Bool bulk (`productWriterPathPlanOk`) |
| 9 B6 stage/step/ok examples (kept partialReady + complete + remains + surface) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productWriterPathPlanPartialReady` | chain fold (B5 && home && remains) | Ok plan bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `SELF-HOST-PRODUCT-WRITER-PATH-PLAN` | fold comments | hostId / surface |

### Not touched

- justfile: no B6 tip-only stage/path recipe pins requiring tip stage strings
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B4 tip living pins
- PartialReady bulk body (already home from batch 29)
- B7+ dual-pin thin, short-name track

## Gate-first edits (batch 5)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/moduleCite/step strings; keep partialReady + ProductPathWriterPathPlan + theorem + surface + remains literal |
| `nix/systems-emit-wire/emit-product.nix` | Home + writerPathPlanModuleCite + productWriterPathStep* |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B6 list shrink to fold/theorem/example; home ProductPathWriterPathPlan expanded |
| `SelfApplyFs.lean` | Delete B6 historical defs + 9 examples; thin B6 section + header inventory |
| `ProductPathWriterPathPlan.lean` | Header note dual-pin thin batch 5 (no new living claim true defs) |

## Line counts (batch 5)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5555 | 5499 | -56 |
| ProductPathWriterPathPlan.lean | 140 | 143 | +3 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- DependsOnLake may stay true (unchanged)
- ProductPathWriterPathPlan: no living-tip complete/perform/ownership true defs
- productPathHostLakeBootstrapRemains := true still on tip (B4)

## Lessons

1. B6 tip fold already used `ProductPathWriterPathPlan.productWriterPathPlanPartialReady` plus bare tip remains; tip Ok alias was dual-pin theater.
2. Home moduleCite name is `writerPathPlanModuleCite` (not tip's old `productWriterPathPlanModuleCite`); gate home tokens use home name.
3. Home already had stage/step defs from batch 29; slice is gate list migration + tip delete.
4. Surgical only: ~56 lines, no /tmp stitch, no bulk sed.
5. Next family: B7 ProductPathWriterPathExec (plan section 8).
