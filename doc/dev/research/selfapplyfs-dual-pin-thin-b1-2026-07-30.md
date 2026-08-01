# SelfApplyFs dual-pin thin batch 1 inventory (B2 KernelSelfApply)

Kind: analysis only. Not residual.

Date: 2026-07-30
Source join: `/tmp/grok-impl-summary-dual-pin-thin-b1.md` (ephemeral)
Review: APPROVE_WITH_NITS (durable-ize this inventory)

## Family

**B2 KernelSelfApply** -- historical tip dual-pins migrated gate-first onto
`SystemsLean.KernelSelfApply`. Living claim SSoT and thin chain fold stay on
`SelfApplyFs`.

## Inventory classification

### Stayed on tip (must-stay fold/claim chain)

| Token / form | Why |
|--------------|-----|
| `def productKernelSelfApplyPartialReady` | Chain fold: `freestandingSelfApplyReady && KernelSelfApply.productKernelSelfApplyPartialReady` |
| `theorem productKernelSelfApplyPartialReady_true` | host-presence + emit-wire tip hostPin |
| `example : productKernelSelfApplyPartialReady = true` | host-presence tip |
| `import SystemsLean.KernelSelfApply` / string `KernelSelfApply` | compile + greppable import cite |
| doc greps `SELF-HOST-KERNEL-SELF-APPLY`, `product kernel self-application` | fold doc / host-presence tip |

### Moved authority to home only (deleted tip duplicates)

| Tip def / smoke removed | Home already owns |
|-------------------------|-------------------|
| `productKernelSelfApplyStageId` | `KernelSelfApply.stageId` |
| `hostProductKernelSelfApplyId` | `KernelSelfApply.hostId` |
| `selfHostProductKernelSelfApplyId` | `KernelSelfApply.selfHostId` |
| `productKernelSelfApplyModuleCite` | same name on home |
| `productKernelBarMult/Linear/Erasure/Types/Program` | same on home |
| `productKernelBarSurfaceOk` tip alias | home Bool bulk |
| 10 B2 stage/bar/surface examples | home examples already |

### Still dual by necessity (tip fold + home bulk)

| Token | Tip | Home |
|-------|-----|------|
| `productKernelSelfApplyPartialReady` | chain fold (ready && home) | surface Ok bulk |
| `theorem productKernelSelfApplyPartialReady_true` | tip theorem | home theorem |
| `SELF-HOST-KERNEL-SELF-APPLY` | fold comments | hostId / surface |

### Not touched

- justfile: no B2 recipe pinned tip historical strings
- living claim bools on tip (complete/Full/ownership/perform/StillUses/free/llvm/PROVABLY)
- PartialReady bulk body (already home from batch 33)

## Gate-first edits (batch 1)

| Path | Change |
|------|--------|
| `nix/systems-emit-wire/default.nix` | Tip hostPin shrink to fold/import/theorem only; drop bar/moduleCite/HOST-EMIT tip requirements |
| `nix/systems-emit-wire/emit-product.nix` | Home tokens + moduleCite + all productKernelBar* names |
| `nix/systems-host-presence/specs.nix` | Tip SelfApplyFs B2 list shrink; home KernelSelfApply block + moduleCite + bar names |
| `SelfApplyFs.lean` | Delete B2 historical defs + 10 examples; thin B2 section + header inventory |
| `KernelSelfApply.lean` | Header note dual-pin thin batch 1 (no new claim true defs) |

## Line counts (batch 1)

| File | Before | After | Delta |
|------|-------:|------:|------:|
| SelfApplyFs.lean | 5755 | 5710 | -45 |
| KernelSelfApply.lean | 121 | 125 | +4 (header) |

## Lessons

1. Gate-first is the tip shrink path after PartialReady bulk split is exhausted.
2. Tip fold does not need tip bar aliases.
3. Home already had the defs from batch 33; slice is mostly gate list migration + tip delete.
4. Surgical only: no /tmp stitch, no bulk sed.
5. Next family after batch 1: B3 ProductOutKernel (same pattern).
