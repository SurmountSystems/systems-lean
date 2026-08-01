# SelfApplyFs dual-pin thin batch 4 inventory (B5 ProductPathWriterSurface)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b4.md` (ephemeral)

## Family

**B5 ProductPathWriterSurface** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductPathWriterSurface`. Living claim SSoT and thin chain fold stay on
`SelfApplyFs`. B4 tip `productPathHostLakeBootstrapRemains := true` left untouched.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productWriterSurfacePartialReady` | Chain fold: `productPathHostLakeBootstrapPartialReady && ProductPathWriterSurface.productWriterSurfacePartialReady` |
| `theorem productWriterSurfacePartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productWriterSurfacePartialReady = true` | host-presence tip |
| complete + remains re-smokes in B5 smoke block | claim/honesty continuity |
| `import SystemsLean.ProductPathWriterSurface` / string `ProductPathWriterSurface` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-WRITER-SURFACE`, `product writer surface` | fold doc / host-presence tip |
| B6+ `productWriterSurfacePartialReady` chain uses | later family folds (untouched) |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productWriterSurfaceStageId` | `ProductPathWriterSurface.stageId` |
| `hostProductWriterSurfaceId` | `ProductPathWriterSurface.hostId` |
| `selfHostProductWriterSurfaceId` | `ProductPathWriterSurface.selfHostId` |
| `productWriterSurfaceModuleCite` | `ProductPathWriterSurface.writerSurfaceModuleCite` (name differs; home string value same) |
| `productWriterApiPlan` / `Apply` / `Body` | same names on home |
| `productWriterOwnPlan` / `Apply` / `Body` | same names on home |
| `productWriterSurfaceOk` tip alias | home Bool bulk (`productWriterSurfaceOk`) |
| 10 B5 stage/API/own/ok examples (kept partialReady + complete + remains) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productWriterSurfacePartialReady` | chain fold (B4 && home) | Ok surface bulk |
| theorem partialReady_true | tip theorem | home theorem |
| `SELF-HOST-PRODUCT-WRITER-SURFACE` | fold comments | hostId / surface |

### Not touched

- justfile: no B5 tip-only stage/path recipe pins
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- B4 remains := true and B4 tip living pins
- PartialReady bulk body (already home from batch 30)
- B6+ dual-pin thin, short-name track

## Gate-first edits (batch 4)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop Ok/moduleCite/API strings; keep partialReady + ProductPathWriterSurface + theorem + remains literal |
| `nix/systems-emit-wire/emit-product.nix` | Home + writerSurfaceModuleCite + productWriterApi* + productWriterOwn* |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B5 list shrink to fold/theorem/example; home ProductPathWriterSurface expanded |
| `SelfApplyFs.lean` | Delete B5 historical defs + 10 examples; thin B5 section + header inventory |
| `ProductPathWriterSurface.lean` | Header note dual-pin thin batch 4 (no new living claim true defs) |

## Line counts (batch 4)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5609 | 5555 | -54 |
| ProductPathWriterSurface.lean | 144 | 147 | +3 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- DependsOnLake may stay true (unchanged)
- ProductPathWriterSurface: no living-tip complete/perform/ownership true defs
- productPathHostLakeBootstrapRemains := true still on tip (B4)

## Lessons

1. B5 tip fold already used `ProductPathWriterSurface.productWriterSurfacePartialReady`; tip Ok alias was dual-pin theater.
2. Home moduleCite name is `writerSurfaceModuleCite` (not tip's old `productWriterSurfaceModuleCite`); gate home tokens use home name.
3. Home already had stage/API/ownership defs from batch 30; slice is gate list migration + tip delete.
4. Surgical only: ~54 lines, no /tmp stitch, no bulk sed.
5. Next family: B6 ProductPathWriterPathPlan (plan section 8 item 4 remaining / item 5 order).
