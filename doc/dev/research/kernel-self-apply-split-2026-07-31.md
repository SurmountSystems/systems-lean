# KernelSelfApply long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Why
Cold never-split primary after ProductOutKernel (130->106). Live parent
was 125 lines with theorem + example smoke co-located with stage / B-bar
HOST-EMIT Mult..Program cites and Ok / PartialReady folds.

## Seam
Same pattern as ProductOutKernel / ProductPathPerform:

| Role | Module |
|------|--------|
| Stage ids, B-bar Mult..Program HOST-EMIT cites, Ok / PartialReady | `KernelSelfApply.lean` |
| KERNEL-SELF-APPLY-THEOREM + SMOKE | `KernelSelfApplyTheorems.lean` (same namespace) |

Greppable honesty tokens on parent: `theorem productKernelSelfApplyPartialReady_true`,
`KERNEL-SELF-APPLY-THEOREM`, `KernelSelfApplyTheorems` (cite only; live defs in Theorems).

## Sizes
- Parent **125 -> 105**
- Theorems **101** (new)
- SelfApplyFs tip import +1 (`KernelSelfApplyTheorems`; tip **1919**)

## Nix
- `nix/systems-emit-wire/emit-product.nix`: parent module tokens gain Theorems
  name + KERNEL-SELF-APPLY-*-THEOREM/SMOKE; greppable theorem cites stay on primary header
- `nix/systems-host-presence/specs.nix`: parent block + new Theorems rel block
- `nix/systems-host-presence/required-files.nix` + `host-leans.nix`: Theorems path

## Out of scope held
No free / llvm / PROVABLY forge; no dual-pin reopen; no product C; no bulk sed.
Land-time Ok / PartialReady folds stay on parent (no claim-bool true defs).

## Next never-split cold (live wc after this slice)
Linear **118**.
