# ProductPathOwnershipInputs long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Why
Cold never-split primary after BootstrapHonesty (142->111). Live parent
was 141 lines with theorem + example smoke co-located with stage / Mult..Out
SSOT / emit / Out path cites and Ok / PartialReady folds.

## Seam
Same pattern as BootstrapHonesty / ProductPathWriterPathPlan:

| Role | Module |
|------|--------|
| Stage ids, Mult..Out SSOT / emit / Out path cites, Ok / PartialReady | `ProductPathOwnershipInputs.lean` |
| OWNERSHIP-INPUTS-THEOREM + SMOKE | `ProductPathOwnershipInputsTheorems.lean` (same namespace) |

Greppable honesty tokens on parent: `theorem productPathOwnershipInputsPartialReady_true`,
`OWNERSHIP-INPUTS-THEOREM`, `ProductPathOwnershipInputsTheorems` (cite only; live
defs in Theorems).

## Sizes
- Parent **141 -> 136**
- Theorems **87** (new)
- SelfApplyFs tip import +1 (`ProductPathOwnershipInputsTheorems`)

## Nix
- `nix/systems-emit-wire/emit-product.nix`: parent module tokens gain Theorems
  name; greppable theorem cites stay on primary header
- `nix/systems-host-presence/specs.nix`: parent block + new Theorems rel block

## Out of scope held
No free / llvm / PROVABLY forge; no dual-pin reopen; no product C; no bulk sed.
Land-time Ok / PartialReady folds stay on parent (no claim-bool true defs).

## Next never-split cold (live wc after this slice)
ProductPathPerform **137**, ProductOutKernel **130**, KernelSelfApply **125**,
Linear **118**.
