# SelfApplyFs dual-pin thin batch 3 inventory (B4 BootstrapHonesty)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b3.md` (ephemeral)

## Family

**B4 BootstrapHonesty** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.BootstrapHonesty`. Living claim SSoT and thin chain fold stay on
`SelfApplyFs`. Special: tip keeps `productPathHostLakeBootstrapRemains := true`
literal (later family folds and emit-wire tip hostPin require it).

## Inventory classification

### Stayed on tip (must-stay fold/claim chain + remains honesty)

| Token / form | Why |
|--------------|-----|
| `def productPathHostLakeBootstrapRemains : Bool := true` | Living tip honesty SSoT; later B5..Full folds use tip name; emit-wire + host-presence require tip literal |
| `theorem productPathHostLakeBootstrapRemains_true` | host-presence + emit-wire tip hostPin |
| `def productPathHostLakeBootstrapPartialReady` | Chain fold: `productOutKernelEvidencePartialReady && BootstrapHonesty.productPathHostLakeBootstrapPartialReady` |
| `theorem productPathHostLakeBootstrapPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productPathHostLakeBootstrapRemains = true` | host-presence tip |
| `example : productPathHostLakeBootstrapPartialReady = true` | host-presence tip |
| `import SystemsLean.BootstrapHonesty` / string `BootstrapHonesty` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-PATH-BOOTSTRAP`, `product path Lake bootstrap` | fold doc / host-presence tip |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productPathBootstrapStageId` | `BootstrapHonesty.stageId` |
| `hostProductPathBootstrapId` | `BootstrapHonesty.hostId` |
| `selfHostProductPathBootstrapId` | `BootstrapHonesty.selfHostId` |
| `productPathBootstrapModuleCite` | `BootstrapHonesty.bootstrapHonestyModuleCite` (name differs; home string value same) |
| `hostLakeEmitWriterPath` | same name on home |
| `hostLakeEmitExe` | same name on home |
| `hostLakeEmitStageCite` | same name on home |
| `productPathBootstrapSurfaceOk` tip alias | home Bool bulk (`productPathBootstrapSurfaceOk`) |
| 8 B4 stage/path/surface examples (kept remains + partialReady + complete re-smoke) | home examples already |

### Still dual by necessity (tip fold + home bulk + remains pin)

| Token | Tip | Home |
|-------|-----|------|
| `productPathHostLakeBootstrapRemains` | living tip `:= true` (later folds) | land-time honesty pin `:= true` OK |
| `productPathHostLakeBootstrapPartialReady` | chain fold (B3 && home) | remains && surface Ok bulk |
| theorems remains_true / partialReady_true | tip theorems | home theorems |
| `SELF-HOST-PRODUCT-PATH-BOOTSTRAP` | fold comments | hostId / surface |

### Not touched

- justfile: no B4 recipe pinned tip-only stage/path string defs
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- PartialReady bulk body (already home from batch 31)
- B5+ dual-pin thin, short-name track
- later family tip re-smokes of `productPathHostLakeBootstrapRemains = true` (kept)

## Gate-first edits (batch 3)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink: drop moduleCite; keep remains literal + partialReady + BootstrapHonesty + both theorems |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens + bootstrapHonestyModuleCite + hostLakeEmitExe + hostLakeEmitStageCite |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B4 list shrink to fold/remains/theorems/examples; home BootstrapHonesty + moduleCite + hostLakeEmit* |
| `SelfApplyFs.lean` | Delete B4 historical stage/writer-path/surface alias defs + 8 examples; thin B4 section + header inventory |
| `BootstrapHonesty.lean` | Header note dual-pin thin batch 3 (no new living claim true defs) |
| `doc/dev/research/selfapplyfs-dual-pin-thin-b2-2026-07-30.md` | Batch 2 inventory durable (review nit from b2) |

## Line counts (batch 3)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5657 | 5609 | -48 |
| BootstrapHonesty.lean | 139 | 142 | +3 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- DependsOnLake may stay true (unchanged)
- BootstrapHonesty: no living-tip complete/perform/ownership true defs; remains := true land-time honesty pin OK

## Lessons

1. B4 is special: remains tip literal is living honesty for many later family folds -- do not delete or alias away.
2. Tip fold already used `BootstrapHonesty.productPathHostLakeBootstrapPartialReady`; tip surfaceOk alias was dual-pin theater.
3. Home moduleCite name is `bootstrapHonestyModuleCite` (not tip's old `productPathBootstrapModuleCite`); gate home tokens use home name.
4. Home already had stage/writer-path defs from batch 31; slice is gate list migration + tip delete.
5. Surgical only: ~48 lines, no /tmp stitch, no bulk sed.
6. Next family: B5 ProductPathWriterSurface (plan section 8 item 4: B5..B8 writer / ownership inputs).
