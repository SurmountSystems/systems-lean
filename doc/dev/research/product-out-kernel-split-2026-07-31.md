# ProductOutKernel long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Why
Cold never-split primary after ProductPathPerform (137->134). Live parent
was 130 lines with theorem + example smoke co-located with stage / Out path /
B-bar Mult..IR API cites and Ok / PartialReady folds.

## Seam
Same pattern as ProductPathPerform / OwnershipInputs / BootstrapHonesty:

| Role | Module |
|------|--------|
| Stage ids, Out path, B-bar Mult..IR API cites, Ok / PartialReady | `ProductOutKernel.lean` |
| PRODUCT-OUT-THEOREM + SMOKE | `ProductOutKernelTheorems.lean` (same namespace) |

Greppable honesty tokens on parent: `theorem productOutKernelEvidencePartialReady_true`,
`PRODUCT-OUT-THEOREM`, `ProductOutKernelTheorems` (cite only; live defs in Theorems).

## Sizes
- Parent **130 -> 106**
- Theorems **105** (new)
- SelfApplyFs tip import +1 (`ProductOutKernelTheorems`; tip **1918**)

## Nix
- `nix/systems-emit-wire/emit-product.nix`: parent module tokens gain Theorems
  name + PRODUCT-OUT-*-THEOREM/SMOKE; greppable theorem cites stay on primary header
- `nix/systems-host-presence/specs.nix`: parent block + new Theorems rel block
- `nix/systems-host-presence/required-files.nix` + `host-leans.nix`: Theorems path

## Out of scope held
No free / llvm / PROVABLY forge; no dual-pin reopen; no product C; no bulk sed.
Land-time Ok / PartialReady folds stay on parent (no claim-bool true defs).

## Next never-split cold (live wc after this slice)
KernelSelfApply **125**, Linear **118**.
