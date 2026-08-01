# SelfApplyFs dual-pin thin batch 2 inventory (B3 ProductOutKernel)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b2.md` (ephemeral)
Review: APPROVE_WITH_NITS (durable-ize this inventory -- closed in dual-pin thin batch 3)

## Family

**B3 ProductOutKernel** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.ProductOutKernel`. Living claim SSoT and thin chain fold stay on
`SelfApplyFs`.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productOutKernelEvidencePartialReady` | Chain fold: `productKernelSelfApplyPartialReady && ProductOutKernel.productOutKernelEvidencePartialReady` |
| `theorem productOutKernelEvidencePartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productOutKernelEvidencePartialReady = true` | host-presence tip |
| `import SystemsLean.ProductOutKernel` / string `ProductOutKernel` | compile + greppable import cite |
| doc greps `SELF-HOST-PRODUCT-OUT`, `product Out kernel evidence` | fold doc / host-presence tip |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productOutKernelStageId` | `ProductOutKernel.stageId` |
| `hostProductOutKernelId` | `ProductOutKernel.hostId` |
| `selfHostProductOutKernelId` | `ProductOutKernel.selfHostId` |
| `productOutKernelModuleCite` | same name on home |
| `productOutPath` | same on home |
| `productOutApiMult/Linear/Erasure/Types/Program` | same on home |
| `productOutKernelBarSurfaceOk` tip alias | home Bool bulk |
| 12 B3 stage/path/API/surface examples (+ complete re-smoke) | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productOutKernelEvidencePartialReady` | chain fold (B2 && home) | surface Ok bulk |
| `theorem productOutKernelEvidencePartialReady_true` | tip theorem | home theorem |
| `SELF-HOST-PRODUCT-OUT` | fold comments | hostId / surface |

### Not touched

- justfile: no B3 recipe pinned tip historical stage/API string defs only
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- PartialReady bulk body (already home from batch 32)
- B4+ families, short-name track

## Gate-first edits (batch 2)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink to fold/import/theorem only; drop bar/moduleCite/path/API tip requirements |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens + moduleCite + productOutApi* names |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B3 list shrink; home ProductOutKernel block + moduleCite + productOutApi* |
| `SelfApplyFs.lean` | Delete B3 historical defs + 12 examples; thin B3 section + header inventory |
| `ProductOutKernel.lean` | Header note dual-pin thin batch 2 (no new claim true defs) |
| `doc/dev/research/selfapplyfs-dual-pin-thin-b1-2026-07-30.md` | Batch 1 inventory durable (review nit) |

## Line counts (batch 2)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5710 | 5657 | -53 |
| ProductOutKernel.lean | 129 | 130 | +1 (header) |

## Claim bools (preserved)

- freestandingProductSelfHostComplete true
- stepContractFull true
- productPathFreestandingOwnershipClaimed true
- productPathFreestandingPerformClaimed true
- productPathOfficialPathStillUsesFreestandingEmit false
- residual free / llvm / PROVABLY false
- DependsOnLake may stay true (unchanged)
- ProductOutKernel: no living-tip complete/perform/ownership true defs

## Lessons

1. Same gate-first pattern as batch 1: shrink tip hostPin before deleting tip string defs.
2. Tip fold already used `ProductOutKernel.productOutKernelEvidencePartialReady`; tip `productOutKernelBarSurfaceOk` alias was dual-pin theater.
3. Home already had stage/path/API defs from batch 32; slice is gate list migration + tip delete.
4. Surgical only: ~53 lines, no /tmp stitch, no bulk sed.
5. Next family after batch 2: B4 BootstrapHonesty (watch remains := true tip literal).
