# SelfApplyFs dual-pin thin batch 6 inventory (B7 ProductPathWriterPathExec)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b6.md` (ephemeral)

## Family

**B7 ProductPathWriterPathExec** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathWriterPathExec`. Living claim SSoT and thin chain fold stay on
`SelfApplyFs`. B4 tip `productPathHostLakeBootstrapRemains := true` left untouched.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productWriterPathExecutionPartialReady` | Chain fold: `productWriterPathPlanPartialReady && ProductPathWriterPathExec.productWriterPathExecutionPartialReady && productPathHostLakeBootstrapRemains` |
| `theorem productWriterPathExecutionPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productWriterPathExecutionPartialReady = true` | host-presence tip |
| complete + remains + plan re-smokes in B7 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathWriterPathExec` / string `ProductPathWriterPathExec` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-WRITER-PATH-EXEC`, `product writer path execution` | fold doc / host-presence tip |
| B8+ `productWriterPathExecutionPartialReady` chain uses | later family folds (untouched) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productWriterPathExecutionStageId` | `ProductPathWriterPathExec.stageId` |
| `hostProductWriterPathExecutionId` | `ProductPathWriterPathExec.hostId` |
| `selfHostProductWriterPathExecutionId` | `ProductPathWriterPathExec.selfHostId` |
| `productWriterPathExecModuleCite` | `ProductPathWriterPathExec.writerPathExecModuleCite` (name differs; home string value same) |
| `productWriterPathExecReadSsotFn` / `ReadBodyFn` / `ReadPlanFn` / `DualSsot` / `ComposeFn` / `ComposeSourceFn` / `WriteFn` / `EmitEntry` / `InstallRecipe` | same names on home |
| `productWriterPathExecutionOk` tip alias | home Bool bulk (`productWriterPathExecutionOk`) |
| 14 B7 stage/fn/ok examples (kept partialReady + complete + remains + plan) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productWriterPathExecutionPartialReady` | chain fold (B6 && home && remains) | Ok exec bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `SELF-HOST-PRODUCT-WRITER-PATH-EXEC` | fold comments | hostId / surface |

### Not touched

- justfile: no B7 tip-only stage/path recipe pins requiring tip stage strings
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B4 tip living pins
- PartialReady bulk body (already home from batch 28)
- B8+ dual-pin thin, short-name track

## Gate-first edits (batch 6)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/moduleCite/fn strings; keep partialReady + ProductPathWriterPathExec + theorem + plan + remains literal |
| `nix/systems-emit-wire/emit-product.nix` | Home + writerPathExecModuleCite + productWriterPathExec* fns + load/render/write cites |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B7 list shrink to fold/theorem/example; home ProductPathWriterPathExec expanded |
| `SelfApplyFs.lean` | Delete B7 historical defs + 14 examples; thin B7 section + header inventory |
| `ProductPathWriterPathExec.lean` | Header note dual-pin thin batch 6 (no new living claim true defs) |

## Line counts (batch 6)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5499 | 5415 | -84 |
| ProductPathWriterPathExec.lean | 167 | 169 | +2 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- DependsOnLake may stay true (unchanged)
- ProductPathWriterPathExec: no living-tip complete/perform/ownership true defs
- productPathHostLakeBootstrapRemains := true still on tip (B4)

## Lessons

1. B7 tip fold already used `ProductPathWriterPathExec.productWriterPathExecutionPartialReady` plus bare tip remains; tip Ok alias was dual-pin theater.
2. Home moduleCite name is `writerPathExecModuleCite` (not tip's old `productWriterPathExecModuleCite`); gate home tokens use home name.
3. Home already had stage/fn defs from batch 28; slice is gate list migration + tip delete.
4. Surgical only: ~84 lines, no /tmp stitch, no bulk sed.
5. Next family: B8 ProductPathOwnershipInputs (plan section 8).
