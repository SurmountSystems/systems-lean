# BootstrapHonesty long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Why
Cold never-split primary after ProductPathWriterPathPlan (143->136). Live parent
was 142 lines with theorem + example smoke co-located with stage/writer path
cites and remains / surface Ok / PartialReady folds.

## Seam
Same pattern as ProductPathWriterPathPlan / ProductPathWriterSurface:

| Role | Module |
|------|--------|
| Stage ids, Lake writer path cites, remains / surface Ok / PartialReady | `BootstrapHonesty.lean` |
| BOOTSTRAP-THEOREM + SMOKE | `BootstrapHonestyTheorems.lean` (same namespace) |

Greppable honesty tokens on parent: `theorem productPathHostLakeBootstrapPartialReady_true`,
`theorem productPathHostLakeBootstrapRemains_true`, `BOOTSTRAP-THEOREM`,
`BootstrapHonestyTheorems` (cite only; live defs in Theorems).

## Sizes
- Parent **142 -> 111**
- Theorems **111** (new)
- SelfApplyFs tip untouched (import `BootstrapHonesty` only; no +1)

## Nix
- `nix/systems-emit-wire/emit-product.nix`: parent module tokens gain Theorems
  name; greppable theorem cites stay on primary header
- `nix/systems-host-presence/specs.nix`: parent block + new Theorems rel block

## Out of scope held
No free / llvm / PROVABLY forge; no dual-pin reopen; no product C; no bulk sed.
Land-time remains := true honesty pin stays on parent.

## Next never-split cold (live wc after this slice)
ProductPathOwnershipInputs **141**, ProductPathPerform **137**, ProductOutKernel **130**.
